import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/Controller/checkout_controller.dart';
import 'package:sample_razorpay_integration/Screens/Product/Controller/product_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void dispose() {
    super.dispose();
    Get.find<ProductController>().productList.value = [];
    debugPrint('Emptied list');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
            // Get.find<ProductController>().productList.value = [];
            // print('Emptied list');
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
        child: Obx(
          () {
            return Container(
              height: mediaQuery.height,
              width: mediaQuery.width,
              color: Colors.purpleAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Get.find<ProductController>().isLoading.isTrue
                      ? const CircularProgressIndicator(
                          color: Colors.yellowAccent,
                        )
                      : Container(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20, bottom: 100),
                          height: mediaQuery.height,
                          width: mediaQuery.width,
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 2.1 / 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.yellow.shade200,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: 70,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: double.infinity,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              Get.find<ProductController>()
                                                  .productList[index]
                                                  .image
                                                  .toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          width: 150,
                                          child: Text(
                                            'Name: ${Get.find<ProductController>().productList[index].title}',
                                            style: const TextStyle(
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                "Price: ₹${Get.find<ProductController>().productList[index].price}"
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Get.find<CheckoutController>()
                                                //     .checkoutProductList
                                                //     .add(Get.find<
                                                //             ProductController>()
                                                //         .productList[index]);
                                                Get.find<CheckoutController>()
                                                    .saveItemToBox(Get.find<
                                                            ProductController>()
                                                        .productList[index]);
                                                Get.snackbar('Success',
                                                    'Product has been added to your checkout page',
                                                    backgroundColor: Colors
                                                        .white
                                                        .withOpacity(0.7),
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    duration: const Duration(
                                                        milliseconds: 1000));
                                              },
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(6),
                                                color: Colors.purpleAccent,
                                                child: const Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                      color:
                                                          Colors.yellowAccent,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: Get.find<ProductController>()
                                .productList
                                .length,
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
