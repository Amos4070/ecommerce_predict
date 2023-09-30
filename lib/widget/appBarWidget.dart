import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black,
      ),
    );
  }
}

class AppBarTittle extends StatelessWidget {
  const AppBarTittle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Acme',
          fontSize: 28.0,
          letterSpacing: 1.5),
    );
  }
}
