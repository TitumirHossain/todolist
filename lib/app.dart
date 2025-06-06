import 'package:flutter/material.dart';
import 'package:todolist/ui/screens/add_new_product_screen.dart';
import 'package:todolist/ui/screens/product_list_screen.dart';
import 'package:todolist/ui/screens/update_product_screen.dart';

class CRUDApp extends StatelessWidget {
  const CRUDApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const ProductListScreen(),
        AddNewProductScreen.name: (context) => const AddNewProductScreen(),
        UpdateProductScreen.name: (context) => const UpdateProductScreen(),
      },
    );
  }
}
