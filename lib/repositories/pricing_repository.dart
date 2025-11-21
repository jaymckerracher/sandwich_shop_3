class PricingRepository {
  int quantity;
  bool isFootlong;
  int price = 0;

  PricingRepository({required this.quantity, required this.isFootlong});

  void updatePrice() {
    if (isFootlong) {
      price = 11 * quantity;
    } else {
      price = 7 * quantity;
    }
  }

  int get getPrice => price;
}
