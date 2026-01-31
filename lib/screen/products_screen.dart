import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/mock_product.dart';
import '../main.dart';
import '../model/product.dart';
import '../state/cart_model.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  void _openDetail(BuildContext context, Product product) {
    Navigator.pushNamed(context, MyApp.routeProductDetail, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    final cartCount = context.watch<CartModel>().totalItems;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, MyApp.routeCart),
            icon: Badge(
              isLabelVisible: cartCount > 0,
              label: Text('$cartCount'),
              child: const Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: mockProducts.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final p = mockProducts[index];
          return Card(
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  p.imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(p.name),
              subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
              onTap: () => _openDetail(context, p),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => context.read<CartModel>().add(p),
              ),
            ),
          );
        },
      ),
    );
  }
}
