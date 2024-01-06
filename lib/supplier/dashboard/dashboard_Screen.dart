import 'package:ecommerce_predict/widget/appBarWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../splash_and_welcome_screen/welcomescreen_seller_buyer.dart';
import '../../widget/alertDialogforlogout.dart';
import 'dashboard_components/balance.dart';
import 'dashboard_components/edit_business.dart';
import 'dashboard_components/manage_products.dart';
import 'dashboard_components/my_store.dart';
import 'dashboard_components/order.dart';
import 'dashboard_components/supplier_statics.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
];

List<Widget> pages = const [
  MyStore(),
  SupplierOrder(),
  EditBusiness(),
  ManageProducts(),
  BalanceScreen(),
  StaticsScreen()
];

List<IconData> icons = [
  Icons.store,
  Icons.shop_2_outlined,
  Icons.edit,
  Icons.settings,
  Icons.attach_money,
  Icons.show_chart,
];

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const AppBarTittle(
          title: 'Dashboard',
        ),
        actions: [
          IconButton(
              onPressed: () {
//todo dont forget what you are planning to do here

                // Get.off(
                //     //LoginScreen()
                //     const WelcomeScreen());

                MyAlertDialog.showMyDialog(
                    title: "Log Out",
                    context: context,
                    content: 'Do you want to logout?',
                    tabNo: () {
                      Get.back();
                    },
                    tabYes: () async {
                      await FirebaseAuth.instance.signOut();
                      Get.offAll(
                          //todo dont forget your plans for here
                          //LoginScreen()
                          const WelcomeScreen());
                    });
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Get.to(pages[index]);
              },
              child: Card(
                elevation: 20,
                shadowColor: Colors.pinkAccent.shade200,
                color: Colors.blueGrey.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      icons[index],
                      color: Colors.yellowAccent,
                      size: 50,
                    ),
                    Text(
                      label[index].toUpperCase(),
                      style: const TextStyle(
                          letterSpacing: 2,
                          color: Colors.yellowAccent,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Acme'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
