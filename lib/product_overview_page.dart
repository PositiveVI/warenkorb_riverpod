import 'package:flutter/material.dart';
import 'product.dart';
import 'product_detail_page.dart';
import 'cart_page.dart';

class ProductOverviewPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        title: 'Veggy Grill',
        description: 'Frischer Spieß mit Gemüse',
        price: 09.99,
        image: 'assets/grill.png'),
    Product(
        title: 'Happy Veggy Burger',
        description: 'Perfekt für den kleinen Hunger',
        price: 14.99,
        image: 'assets/hamburger.png'),
    Product(
      title: 'Vegan Meet',
      description: 'Frisch vom Grill',
      price: 12.99,
      image: 'assets/meet.png',
    ),
    Product(
        title: 'Lovely Noodles',
        description: 'Made with love',
        price: 12.99,
        image: 'assets/noodle.png'),
    Product(
        title: 'Healthy Salat',
        description: 'Frisch und knackig',
        price: 13.99,
        image: 'assets/salat.png'),
  ];

  ProductOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Happy Food',
          style: TextStyle(
              fontSize: 30,
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: const Color.fromARGB(255, 230, 253, 228),
              leading: Image.asset(product.image),
              title: Text(
                product.title,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price}',
                  style: const TextStyle(fontSize: 14)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
