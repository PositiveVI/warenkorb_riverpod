class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  int availability;

  Product(
      {required this.title,
      required this.description,
      required this.price,
      required this.image,
      this.availability = 10});
}
