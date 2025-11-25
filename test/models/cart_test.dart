import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/models/cart.dart';
import 'package:sandwich_shop/models/sandwich.dart';

void main() {
  group('Cart', () {
    late Cart cart;
    late Sandwich footlongSandwich;
    late Sandwich sixInchSandwich;

    setUp(() {
      cart = Cart();
      footlongSandwich = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: true,
        breadType: BreadType.white,
      );
      sixInchSandwich = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
    });

    test('initial cart is empty', () {
      expect(cart.sandwiches, isEmpty);
      expect(cart.totalPrice, 0.0);
    });

    test('addSandwich adds a sandwich', () {
      cart.addSandwich(footlongSandwich);
      expect(cart.sandwiches.length, 1);
      expect(cart.sandwiches.first, footlongSandwich);
    });

    test('removeSandwich removes a sandwich', () {
      cart.addSandwich(footlongSandwich);
      cart.removeSandwich(footlongSandwich);
      expect(cart.sandwiches, isEmpty);
    });

    test('totalPrice calculates correctly for footlong', () {
      cart.addSandwich(footlongSandwich);
      expect(cart.totalPrice, 11.0);
      cart.addSandwich(footlongSandwich);
      expect(cart.totalPrice, 22.0);
    });

    test('totalPrice calculates correctly for six inch', () {
      cart.addSandwich(sixInchSandwich);
      expect(cart.totalPrice, 7.0);
      cart.addSandwich(sixInchSandwich);
      expect(cart.totalPrice, 14.0);
    });

    test('totalPrice calculates correctly for mixed sandwiches', () {
      cart.addSandwich(footlongSandwich);
      cart.addSandwich(sixInchSandwich);
      expect(cart.totalPrice, 18.0); // 11 + 7
    });

    test('sandwiches getter returns unmodifiable list', () {
      cart.addSandwich(footlongSandwich);
      expect(
          () => cart.sandwiches.add(sixInchSandwich), throwsUnsupportedError);
      expect(() => cart.sandwiches.removeAt(0), throwsUnsupportedError);
    });
  });
}
