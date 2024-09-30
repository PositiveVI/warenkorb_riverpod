import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_page.dart';
import 'cart.dart';
import 'product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(product.title),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_checkout, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(product.description),
            SizedBox(height: 8),
            Text('\$${product.price}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text('Availability: ${product.availability}'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: product.availability >
                      0 //sobald nix mehr da ist, wird der Button disabled
                  ? () {
                      Provider.of<Cart>(context, listen: false)
                          .addProduct(product);
                      if (product.availability == 0) {
                        //Wenn nichts mehr da ist, wird eine Snackbar angezeigt
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Leider nicht mehr verfügbar')));
                      }
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text('Hinzufügen', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
