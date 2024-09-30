import 'package:flutter/material.dart';
import 'dart:async';

import 'package:warenkorb_riverpod/product_overview_page.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProductOverviewPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/loading.png',
            fit: BoxFit.cover,
          ),
          Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
