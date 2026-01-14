class HomeProductData {
  final int id;
  final String product_name;
  final String category;
  final double price;
  final String image_url;
  final String currency;
  final int quantity;
  final String unit;
  final bool in_stock;

  HomeProductData({
    required this.id,
    required this.product_name,
    required this.category,
    required this.price,
    required this.image_url,
    required this.currency,
    required this.quantity,
    required this.unit,
    required this.in_stock,
  });
}
