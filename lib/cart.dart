import 'package:flutter/material.dart';
import 'product.dart';

class Cart with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => _items; //Gibt die Produkte im Warenkorb zurück

  addProduct(Product product) {
    //Fügt ein Produkt zum Warenkorb hinzu und verringert die Verfügbarkeit
    if (product.availability > 0) {
      _items.add(product);
      product.availability--;
      notifyListeners();
    }
  }

  removeProduct(Product product) {
    //Entfernt ein Produkt aus dem Warenkorb und erhöht die Verfügbarkeit
    _items.remove(product);
    product.availability++;
    notifyListeners();
  }

  clearCart() {
    //Leert den Warenkorb und erhöht die Verfügbarkeit der Produkte
    for (var product in _items) {
      product.availability++; //Erhöht die Verfügbarkeit
    }
    _items.clear();
    notifyListeners(); //Listener  Widgets, die auf Änderungen reagieren
  }

  double get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
}
