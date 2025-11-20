class PricingRepository {
  final int quantity;
  final bool isFootlong;
  int price = 0;

  PricingRepository({required this.quantity, required this.isFootlong}) {
    if (isFootlong) {
      price = 11 * quantity;
    } else {
      price = 7 * quantity;
    }
  }

  int get getPrice => price;
}
