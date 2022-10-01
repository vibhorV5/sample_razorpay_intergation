import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_razorpay_integration/Routes/routes.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/Controller/checkout_controller.dart';
import 'package:sample_razorpay_integration/Screens/Home/View/home_screen.dart';

void main() async {
  await GetStorage.init();
  // Get.lazyPut(() => ProductController());
  Get.put(CheckoutController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      title: 'Sample Razorpay Integration',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomeScreen(),
    );
  }
}
