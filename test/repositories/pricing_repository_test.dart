import 'package:flutter_test/flutter_test.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

void main() {
  group('Price Repository', () {
    test('initial price should be 0', () {
      final repository =
          PricingRepository(quantity: 0, sandwichSize: 'Footlong');
      expect(repository.price, 0);
    });

    test('price should be calculated correctly', () {
      final repository =
          PricingRepository(quantity: 4, sandwichSize: 'Footlong');
      expect(repository.price, 44);
    });
  });
}
