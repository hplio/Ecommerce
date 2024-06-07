class KPricing {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxtRate = getTaxRateForLocation(location);
    double taxtAmount = productPrice * taxtRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxtAmount + shippingCost;
    return totalPrice;
  }

  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  static String calculateTax(double productPrice, String location) {
    double taxtRate = getTaxRateForLocation(location);
    double taxtAmount = productPrice * taxtRate;
    return taxtAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return .10;
  }
  static double getShippingCost(String location) {
    return 5.00;
  }

  
}
