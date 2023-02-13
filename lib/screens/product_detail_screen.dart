import 'package:flutter/material.dart';
import 'package:flutter_kuldi_35_state_management_provider/providers/products.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    // ...

    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badge(
                child: ch!,
                value: value.jumlah.toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                '${product.imageUrl}',
                fit: BoxFit.cover,
              ),
            ),
            Text("INI ADALAG PAGE PRODUK (${product.title})"),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Berhasil ditambahkan'),)
              );

              cart.addCart(product.id!, product.title!, product.price!);
              },
              child: Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
