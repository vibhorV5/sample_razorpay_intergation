import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.yellowAccent,
          ),
        ),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 70),
          child: Text(
            'Products Screen',
            style: TextStyle(fontSize: 15, color: Colors.yellowAccent),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.height,
          width: mediaQuery.width,
          color: Colors.purpleAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Products will go here'),
            ],
          ),
        ),
      ),
    );
  }
}
