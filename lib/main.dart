import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state/cart_model.dart';
import 'screen/login_screen.dart';
import 'screen/home_screen.dart';
import 'screen/products_screen.dart';
import 'screen/product_detail_screen.dart';
import 'screen/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const routeLogin = '/';
  static const routeHome = '/home';
  static const routeProducts = '/products';
  static const routeProductDetail = '/product-detail';
  static const routeCart = '/cart';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-Commerce Starter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: routeLogin,
        routes: {
          routeLogin: (_) => const LoginScreen(),
          routeHome: (_) => const HomeScreen(),
          routeProducts: (_) => const ProductsScreen(),
          routeProductDetail: (_) => const ProductDetailScreen(),
          routeCart: (_) => const CartScreen(),
        },
      ),
    );
  }
}
