import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:warenkorb_riverpod/loading.dart';
import 'cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        home: LoadingScreen(),
      ),
    );
  }
}
