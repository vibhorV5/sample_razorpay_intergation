import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/Controller/checkout_controller.dart';
import 'package:sample_razorpay_integration/Screens/Home/View/home_screen.dart';

class OrderSuccessScreen extends StatefulWidget {
  const OrderSuccessScreen({super.key});

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.find<CheckoutController>().checkoutProductList.value = [];
    debugPrint('Checkout list emptied');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
        elevation: 0.0,
        title: const Padding(
          padding: EdgeInsets.only(left: 65),
          child: Text(
            'Order Success Screen',
            style: TextStyle(fontSize: 15, color: Colors.yellowAccent),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                right: 15,
              ),
              height: mediaQuery.height,
              width: mediaQuery.width,
              color: Colors.green.shade700,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(const HomeScreen());
                    },
                    child: Center(
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          color: Colors.yellow.shade300,
                          child: const Text(
                            'Back to Home',
                            style: TextStyle(color: Colors.black87),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
