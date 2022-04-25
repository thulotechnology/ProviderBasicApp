import 'package:flutter/material.dart';
import 'package:product_app/models/item.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ItemModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Shop App",
      home: HomePage(),
    );
  }
}
