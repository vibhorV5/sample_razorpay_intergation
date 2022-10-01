import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Models/Product/product.dart';

class CheckoutController extends GetxController {
  RxList checkoutProductList = <Product>[].obs;
  // RxDouble totalSum = 0.0.obs;
  double totalSum = 0;

  getTotalSum() {
    num sum = 0;
    for (Product i in checkoutProductList) {
      sum = sum + i.price!;
    }
    print(sum);
  }

  // getTotalSum() {
  //   // debugPrint('hello');
  //   // // var sum = 0.0;
  //   // for (var i = 0; i <= checkoutProductList.length; i++) {
  //   //   totalSum.value = totalSum.value + checkoutProductList[i].price;
  //   // }
  //   // totalSum.value = sum;
  //   // print(sum);
  //   print(totalSum.value);
  //   // return totalSum.value;
  // }

  // printHello() {
  //   print('hello');
  // }
}
