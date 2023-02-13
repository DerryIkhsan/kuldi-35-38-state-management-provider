import 'package:flutter/material.dart';
import 'package:flutter_kuldi_35_state_management_provider/providers/products.dart';
import 'package:provider/provider.dart';

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

    final product = Provider.of<Products>(context)
        .findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Column(
          children: [
            // Text("INI ADALAG PAGE PRODUK (${product.title})"),
            Container(
              width: double.infinity,
              height: 250,
              child: Image.network(
                '${product.imageUrl}',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
