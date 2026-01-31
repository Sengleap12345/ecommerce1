import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();
    final items = cart.items;

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: items.isEmpty
          ? const Center(child: Text('Your cart is empty.'))
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return Card(
                        child: ListTile(
                          title: Text(item.product.name),
                          subtitle: Text(
                            '\$${item.product.price.toStringAsFixed(2)}  ×  ${item.qty}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () =>
                                    cart.removeOne(item.product.id),
                                icon: const Icon(Icons.remove),
                              ),
                              IconButton(
                                onPressed: () => cart.add(item.product),
                                icon: const Icon(Icons.add),
                              ),
                              IconButton(
                                onPressed: () =>
                                    cart.removeAll(item.product.id),
                                icon: const Icon(Icons.delete_outline),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 10),
                      FilledButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Checkout flow not implemented yet.',
                              ),
                            ),
                          );
                        },
                        child: const Text('Checkout'),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: cart.clear,
                        child: const Text('Clear cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
