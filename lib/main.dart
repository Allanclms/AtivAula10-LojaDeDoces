import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/product_page.dart';
import 'providers/cart_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loja de Doces',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ProductPage(),
    );
  }
}
