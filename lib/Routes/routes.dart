import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/View/checkout_screen.dart';
import 'package:sample_razorpay_integration/Screens/Home/View/home_screen.dart';
import 'package:sample_razorpay_integration/Screens/OrderFailure/View/order_failure_screen.dart';
import 'package:sample_razorpay_integration/Screens/OrderSuccess/View/order_success_screen.dart';
import 'package:sample_razorpay_integration/Screens/Product/View/product_screen.dart';

const String homeScreen = '/homeScreen';
const String productScreen = '/productsScreen';
const String checkoutScreen = '/checkoutScreen';
const String orderSuccessScreen = '/orderSuccessScreen';
const String orderFailureScreen = '/orderFailureScreen';

class Routes {
  static final routes = [
    GetPage(name: homeScreen, page: () => const HomeScreen()),
    GetPage(name: productScreen, page: () => const ProductScreen()),
    GetPage(name: checkoutScreen, page: () => const CheckoutScreen()),
    GetPage(name: orderSuccessScreen, page: () => const OrderSuccessScreen()),
    GetPage(name: orderFailureScreen, page: () => const OrderFailureScreen()),
  ];
}
