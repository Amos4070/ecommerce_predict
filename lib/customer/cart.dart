import 'package:ecommerce_predict/widget/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/yellowButton.dart';
import 'customer_home/customer_home_screen.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: widget.back,
            centerTitle: true,
            title: const AppBarTittle(title: 'Cart'),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.black,
                  ))
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Your Cart is Empty !',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 50,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.lightBlueAccent,
                  child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width * 0.6,
                    onPressed: () {
                      Get.offAll(const CustomerHomeScreen(),
                          transition: Transition.fade,
                          duration: const Duration(milliseconds: 50));
                    },
                    child: const Text('Continue Showing...',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text(
                      'Total: \$   ',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '00.00',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ],
                ),
                YellowButton(
                  label: 'Check Out',
                  onPressed: () {},
                  width: 0.45,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
