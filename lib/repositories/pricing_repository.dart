class PricingRepository {
  final int quantity;
  final String sandwichSize;
  int price = 0;

  PricingRepository({required this.quantity, required this.sandwichSize}) {
    if (sandwichSize == 'Footlong') {
      price = 11 * quantity;
    } else {
      price = 7 * quantity;
    }
  }

  int get getPrice => price;
}
