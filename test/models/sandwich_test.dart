import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Sandwich model', () {
    test('name getter returns correct name', () {
      expect(
        Sandwich(
                type: SandwichType.veggieDelight,
                isFootlong: true,
                breadType: BreadType.white)
            .name,
        'Veggie Delight',
      );
      expect(
        Sandwich(
                type: SandwichType.chickenTeriyaki,
                isFootlong: false,
                breadType: BreadType.wheat)
            .name,
        'Chicken Teriyaki',
      );
      expect(
        Sandwich(
                type: SandwichType.tunaMelt,
                isFootlong: true,
                breadType: BreadType.wholemeal)
            .name,
        'Tuna Melt',
      );
      expect(
        Sandwich(
                type: SandwichType.meatballMarinara,
                isFootlong: false,
                breadType: BreadType.white)
            .name,
        'Meatball Marinara',
      );
    });

    test('image getter returns correct image path', () {
      expect(
        Sandwich(
                type: SandwichType.veggieDelight,
                isFootlong: true,
                breadType: BreadType.white)
            .image,
        'assets/images/veggieDelight_footlong.png',
      );
      expect(
        Sandwich(
                type: SandwichType.tunaMelt,
                isFootlong: false,
                breadType: BreadType.wheat)
            .image,
        'assets/images/tunaMelt_six_inch.png',
      );
    });

    test('Sandwich properties are set correctly', () {
      final sandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      expect(sandwich.type, SandwichType.chickenTeriyaki);
      expect(sandwich.isFootlong, false);
      expect(sandwich.breadType, BreadType.wholemeal);
    });
  });
}
