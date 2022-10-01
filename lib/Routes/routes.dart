import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/View/checkout_screen.dart';
import 'package:sample_razorpay_integration/Screens/Home/View/home_screen.dart';
import 'package:sample_razorpay_integration/Screens/Product/View/product_screen.dart';

const String homeScreen = '/homeScreen';
const String productScreen = '/productsScreen';
const String checkoutScreen = '/checkoutScreen';

class Routes {
  static final routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: productScreen, page: () => const ProductScreen()),
    GetPage(name: checkoutScreen, page: () => const CheckoutScreen()),
  ];
}
