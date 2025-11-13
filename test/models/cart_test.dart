import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart Model', () {
    late Cart cart;
    late Sandwich sandwich1;
    late Sandwich sandwich2;

    setUp(() {
      cart = Cart();
      sandwich1 = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.white,
      );
      sandwich2 = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
    });

    test('addToCart adds a sandwich to the cart', () {
      cart.addToCart(sandwich1);
      expect(cart.items[sandwich1], 1);

      cart.addToCart(sandwich1);
      expect(cart.items[sandwich1], 2);
    });

    test('removeFromCart removes a sandwich from the cart', () {
      cart.addToCart(sandwich1);
      cart.removeFromCart(sandwich1);
      expect(cart.items.containsKey(sandwich1), isFalse);
    });

    test('updateQuantity updates the quantity of a sandwich in the cart', () {
      cart.addToCart(sandwich1);
      cart.updateQuantity(sandwich1, 5);
      expect(cart.items[sandwich1], 5);

      cart.updateQuantity(sandwich1, 0);
      expect(cart.items.containsKey(sandwich1), isFalse);
    });

    test('totalPrice calculates the total price correctly', () {
      cart.addToCart(sandwich1); // Footlong - $11.0
      cart.addToCart(sandwich2); // Six-inch - $7.0
      cart.addToCart(sandwich2); // Six-inch - $7.0

      final total = cart.totalPrice;
      expect(total, 25.0);
    });
  });
}