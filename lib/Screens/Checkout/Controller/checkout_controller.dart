import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sample_razorpay_integration/Models/Product/product.dart';

class CheckoutController extends GetxController {
  final box = GetStorage();

  RxList<Product> checkoutProductList = <Product>[].obs;
  // RxList<Product> productList = <Product>[].obs;

  // RxDouble totalSum = 0.0.obs;
  RxDouble totalSum = 0.0.obs;

  getTotalSum() {
    double sum = 0;
    for (Product i in checkoutProductList) {
      sum = sum + i.price!;
    }
    totalSum.value = sum;
    debugPrint('broooo = $totalSum');
    debugPrint(sum.toString());
  }

  saveItemToBox(Product checkoutProduct) async {
    checkoutProductList.add(checkoutProduct);
    debugPrint('product added to checkout list = $checkoutProduct');
    debugPrint('product list = $checkoutProductList');
    await box.write('checkoutProductsInBox', jsonEncode(checkoutProductList));
  }

  fetchItemsfromBox() async {
    // checkoutProductList = box.read('checkoutProductsInBox') ?? [].obs;
    var data = await box.read('checkoutProductsInBox') ?? '';
    List jsonData = jsonDecode(data);
    checkoutProductList =
        jsonData.map((item) => Product.fromJson(item)).toList().obs;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchItemsfromBox();
    debugPrint(checkoutProductList.toString());
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
