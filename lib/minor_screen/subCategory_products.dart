import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryProducts extends StatelessWidget {
  final String maincategoryname;
  final String subcategoryname;
  const SubCategoryProducts(
      {Key? key, required this.subcategoryname, required this.maincategoryname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          subcategoryname,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(maincategoryname),
      ),
    );
  }
}
