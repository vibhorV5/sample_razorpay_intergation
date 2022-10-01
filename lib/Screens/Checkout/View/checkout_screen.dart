import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_razorpay_integration/Screens/Checkout/Controller/checkout_controller.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
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
            'Checkout Screen',
            style: TextStyle(fontSize: 15, color: Colors.yellowAccent),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 15,
                    right: 15,
                  ),
                  height: mediaQuery.height * 0.74,
                  width: mediaQuery.width,
                  color: Colors.purpleAccent,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.yellow.shade200,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  padding: const EdgeInsets.all(10),
                                  color: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      Get.find<CheckoutController>()
                                          .checkoutProductList[index]
                                          .image
                                          .toString(),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        width: 220,
                                        child: Text(
                                          Get.find<CheckoutController>()
                                              .checkoutProductList[index]
                                              .title
                                              .toString(),
                                          style: const TextStyle(fontSize: 10),
                                        ),
                                      ),
                                      Text(
                                        'Price: \$${Get.find<CheckoutController>().checkoutProductList[index].price.toString()}',
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                      color: Colors.yellow.shade200,
                      thickness: 1,
                    ),
                    itemCount: Get.find<CheckoutController>()
                        .checkoutProductList
                        .length,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      left: 15, right: 15, top: mediaQuery.height * 0.06),
                  color: Colors.purpleAccent,
                  height: mediaQuery.height * 0.2,
                  width: mediaQuery.width,
                  child: Column(
                    children: [
                      SizedBox(
                        width: mediaQuery.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Sum:',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '\$500',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.find<CheckoutController>().getTotalSum();
                            // Get.find<CheckoutController>().printHello();
                            // print(
                            //     Get.find<CheckoutController>().totalSum.value);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: mediaQuery.height * 0.05,
                            width: mediaQuery.width,
                            decoration:
                                BoxDecoration(color: Colors.yellow.shade300),
                            child: const Text('Proceed to Checkout'),
                          )),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
