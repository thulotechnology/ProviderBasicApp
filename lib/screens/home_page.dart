import 'package:flutter/material.dart';
import 'package:product_app/data/data.dart';
import 'package:product_app/models/item.dart';
import 'package:product_app/screens/cart_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allItems = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: Text("View Cart ${allItems.items.length}"))
        ],
      ),
      body: ListView.builder(
          itemCount: allData.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allData[index].name),
              subtitle: Text("Price: ${allData[index].price}"),
              leading: CircleAvatar(
                child: Text((index + 1).toString()),
              ),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<ItemModel>(context, listen: false)
                        .addItem(allData[index]);
                  },
                  icon: Icon(Icons.add)),
            );
          }),
    );
  }
}
