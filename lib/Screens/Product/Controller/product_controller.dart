import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Models/Product/product.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxList<Product> productList = <Product>[].obs;
  RxBool isLoading = true.obs;

  Future<dynamic> fetchProducts() async {
    isLoading(true);
    try {
      var response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      if (response.statusCode != 200) {
        throw HttpException('${response.statusCode}');
      }
      final jsonData = jsonDecode(response.body);
      for (Map<String, dynamic> i in jsonData) {
        productList.add(Product.fromJson(i));
        isLoading(false);
      }
      debugPrint(productList.length.toString());
      return productList;
    } on SocketException {
      debugPrint('No Internet connection 😑');
    } on HttpException {
      debugPrint("Couldn't find the post 😱");
    } on FormatException {
      debugPrint("Bad response format 👎");
    }
  }

  @override
  void onClose() {
    super.onClose();
    productList.value = [];
  }
}
