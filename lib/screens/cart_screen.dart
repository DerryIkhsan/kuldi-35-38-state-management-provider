import 'package:flutter/material.dart';
import 'package:flutter_kuldi_35_state_management_provider/models/cart_item.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Text('total: \$${cartData.totalHarga}'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (context, index){
                return ListTile(
                  title: Text('${cartData.items.values.toList()[index].title}'),
                  subtitle: Text('${cartData.items.values.toList()[index].qty}'),
                  trailing: Container(child: Text('\$${cartData.items.values.toList()[index].price}')),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
