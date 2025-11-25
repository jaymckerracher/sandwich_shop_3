import 'package:sandwich_shop/models/sandwich.dart';
import 'package:sandwich_shop/repositories/pricing_repository.dart';

class Cart {
  final List<Sandwich> _sandwiches = [];
  final PricingRepository _pricingRepository = PricingRepository();

  List<Sandwich> get sandwiches => List.unmodifiable(_sandwiches);

  void addSandwich(Sandwich sandwich) {
    _sandwiches.add(sandwich);
  }

  void removeSandwich(Sandwich sandwich) {
    _sandwiches.remove(sandwich);
  }

  void clear() {
    _sandwiches.clear();
  }

  double get totalPrice {
    double total = 0.0;
    // Group sandwiches by isFootlong for pricing
    int footlongCount = _sandwiches.where((s) => s.isFootlong).length;
    int sixInchCount = _sandwiches.where((s) => !s.isFootlong).length;
    if (footlongCount > 0) {
      total += _pricingRepository.calculatePrice(
          quantity: footlongCount, isFootlong: true);
    }
    if (sixInchCount > 0) {
      total += _pricingRepository.calculatePrice(
          quantity: sixInchCount, isFootlong: false);
    }
    return total;
  }
}
