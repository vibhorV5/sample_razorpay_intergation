import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Routes/routes.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/Controller/checkout_controller.dart';
import 'package:sample_razorpay_integration/Screens/Product/Controller/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Center(
          child: Text(
            'Home Screen',
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      Get.toNamed(productScreen);
                      await productController.fetchProducts();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: Colors.yellow.shade200,
                      child: const Text('Product Screen'),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () async {
                      Get.toNamed(checkoutScreen);
                      Get.find<CheckoutController>().getTotalSum();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      color: Colors.yellow.shade200,
                      child: const Text('Checkout Screen'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
