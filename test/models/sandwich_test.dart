import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich Model', () {
    test('Constructor initializes properties correctly', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );

      expect(sandwich.type, SandwichType.veggieDelight);
      expect(sandwich.isFootlong, isTrue);
      expect(sandwich.breadType, BreadType.wholemeal);
    });

    group('name getter', () {
      test('should return "Veggie Delight" for SandwichType.veggieDelight', () {
        final sandwich = Sandwich(
            type: SandwichType.veggieDelight,
            isFootlong: false,
            breadType: BreadType.white);
        expect(sandwich.name, 'Veggie Delight');
      });

      test(
          'should return "Chicken Teriyaki" for SandwichType.chickenTeriyaki',
          () {
        final sandwich = Sandwich(
            type: SandwichType.chickenTeriyaki,
            isFootlong: false,
            breadType: BreadType.white);
        expect(sandwich.name, 'Chicken Teriyaki');
      });

      test('should return "Tuna Melt" for SandwichType.tunaMelt', () {
        final sandwich = Sandwich(
            type: SandwichType.tunaMelt,
            isFootlong: false,
            breadType: BreadType.white);
        expect(sandwich.name, 'Tuna Melt');
      });

      test(
          'should return "Meatball Marinara" for SandwichType.meatballMarinara',
          () {
        final sandwich = Sandwich(
            type: SandwichType.meatballMarinara,
            isFootlong: false,
            breadType: BreadType.white);
        expect(sandwich.name, 'Meatball Marinara');
      });
    });

    group('image getter', () {
      test('should return correct image path for a six-inch sandwich', () {
        final sandwich = Sandwich(
            type: SandwichType.veggieDelight,
            isFootlong: false,
            breadType: BreadType.wheat);
        expect(sandwich.image, 'assets/images/veggieDelight_six_inch.png');
      });

      test('should return correct image path for a footlong sandwich', () {
        final sandwich = Sandwich(
            type: SandwichType.chickenTeriyaki,
            isFootlong: true,
            breadType: BreadType.wheat);
        expect(sandwich.image, 'assets/images/chickenTeriyaki_footlong.png');
      });
    });
  });
}
