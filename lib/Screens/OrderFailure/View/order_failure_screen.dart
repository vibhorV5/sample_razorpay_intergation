import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Home/View/home_screen.dart';

class OrderFailureScreen extends StatelessWidget {
  const OrderFailureScreen({super.key});

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
            'Order Failure Screen',
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
              color: Colors.red.shade500,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.offAll(const HomeScreen());
                      Get.snackbar('Payment Failure', 'Please retry',
                          backgroundColor: Colors.white.withOpacity(0.7),
                          snackPosition: SnackPosition.BOTTOM);
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
