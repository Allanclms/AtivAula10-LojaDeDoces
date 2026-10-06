import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProvider.cart.isEmpty
                ? const Center(
                    child: Text(
                      'Seu carrinho está vazio.',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartProvider.cart.length,
                    itemBuilder: (context, index) {
                      final produto = cartProvider.cart[index];

                      return ListTile(
                        title: Text(produto.name),
                        subtitle: Text(
                          'R\$ ${produto.price.toStringAsFixed(2)}',
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            cartProvider.removeProduct(produto);
                          },
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Total: R\$ ${cartProvider.total.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
