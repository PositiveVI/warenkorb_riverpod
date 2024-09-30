import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.white, title: const Text('Warenkorb')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      cart.removeProduct(product);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total: \$${cart.totalPrice}',
            style: TextStyle(fontSize: 24),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            onPressed: () {
              cart.clearCart();
            },
            child:
                const Text('Clear Cart', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
