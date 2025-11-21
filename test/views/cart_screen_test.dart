import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/views/cart_screen.dart';

void main() {
  group('CartScreen Widget Tests', () {
    Sandwich createTestSandwich({
      SandwichType type = SandwichType.veggieDelight,
      bool isFootlong = false,
      BreadType bread = BreadType.white,
    }) {
      return Sandwich(
        type: type,
        isFootlong: isFootlong,
        breadType: bread,
      );
    }
    testWidgets('shows empty cart message when no items are present',
        (WidgetTester tester) async {
      final cart = Cart();

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      expect(find.text('Your Cart'), findsOneWidget);
      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('displays items, quantities, and totals correctly',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = createTestSandwich(type: SandwichType.veggieDelight);
      cart.addToCart(sandwich);

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      await tester.pump();

      expect(find.text('Veggie Delight'), findsOneWidget);
      expect(find.textContaining('Six-inch'), findsOneWidget);
      expect(find.textContaining('on white bread'), findsOneWidget);
      expect(find.text('Total Items: 1'), findsOneWidget);
      expect(find.text('Total: £7.00'), findsOneWidget);
    });

    testWidgets('tapping add icon increases item quantity and updates totals',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = createTestSandwich();
      cart.addToCart(sandwich);

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();

      expect(find.text('2'), findsOneWidget);
      expect(find.text('Total Items: 2'), findsOneWidget);
      expect(find.text('Total: £14.00'), findsOneWidget);
    });

    testWidgets(
        'tapping remove icon decreases quantity and updates totals, disabling button at 1',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = createTestSandwich();
      cart.addToCart(sandwich);
      cart.updateQuantity(sandwich, 2);

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      await tester.tap(find.byIcon(Icons.remove));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
      expect(find.text('Total Items: 1'), findsOneWidget);
      expect(find.text('Total: £7.00'), findsOneWidget);

      final removeButton = tester.widget<IconButton>(find.byIcon(Icons.remove));
      expect(removeButton.onPressed, isNull);
    });

    testWidgets('tapping delete icon removes item from cart',
        (WidgetTester tester) async {
      final cart = Cart();
      final sandwich = createTestSandwich();
      cart.addToCart(sandwich);

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      expect(find.text('Your cart is empty.'), findsOneWidget);
      expect(find.byType(ListTile), findsNothing);
    });

    testWidgets('displays a checkout button', (WidgetTester tester) async {
      final cart = Cart();
      cart.addToCart(createTestSandwich());

      await tester.pumpWidget(MaterialApp(home: CartScreen(cart: cart)));
      await tester.pump();

      expect(find.widgetWithText(ElevatedButton, 'Checkout'), findsOneWidget);
    });
  });
}