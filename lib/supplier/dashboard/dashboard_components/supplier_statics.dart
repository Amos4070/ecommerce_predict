import 'package:ecommerce_predict/widget/appBarWidget.dart';
import 'package:flutter/material.dart';

class StaticsScreen extends StatelessWidget {
  const StaticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const AppBarBackButton(),
        title: const AppBarTittle(
          title: 'Statistics',
        ),
      ),
    );
  }
}
