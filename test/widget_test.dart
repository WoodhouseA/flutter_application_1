import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/main.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('App', () {
    testWidgets('renders OrderScreen as home', (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(OrderScreen), findsOneWidget);
    });
  });

  group('OrderScreen - Controls', () {
    testWidgets('toggles sandwich size with Switch',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      
      // Find the initial state of the image before interaction
      final initialImage = tester.widget<Image>(find.byType(Image));
      expect(initialImage.image, isA<AssetImage>());
      expect((initialImage.image as AssetImage).assetName, contains('footlong'));

      // Tap the switch and verify the image changes
      await tester.tap(find.byType(Switch));
      await tester.pump();

      final updatedImage = tester.widget<Image>(find.byType(Image));
      expect(updatedImage.image, isA<AssetImage>());
      expect((updatedImage.image as AssetImage).assetName, contains('six_inch'));
    });

    testWidgets('changes bread type with DropdownMenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const App());
      
      // Tap the bread type dropdown
      await tester.tap(find.widgetWithText(DropdownMenu<BreadType>, 'Bread Type'));
      await tester.pumpAndSettle(); // Wait for animation

      // Select a new bread type
      await tester.tap(find.text('wheat').last);
      await tester.pumpAndSettle();

      // No direct visual feedback to test in UI for bread type, but this confirms interaction.
      // A more robust test would check the state if it were exposed.
    });
  });

  group('StyledButton', () {
    testWidgets('renders with icon and label', (WidgetTester tester) async {
      const testButton = StyledButton(
        onPressed: null,
        icon: Icons.add,
        label: 'Test Add',
        backgroundColor: Colors.blue,
      );
      const testApp = MaterialApp(
        home: Scaffold(body: testButton),
      );
      await tester.pumpWidget(testApp);
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.text('Test Add'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}
