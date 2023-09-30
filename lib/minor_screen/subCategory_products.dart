import 'package:flutter/material.dart';

import '../widget/appBarWidget.dart';

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
        leading: const AppBarBackButton(),
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTittle(title: subcategoryname),
      ),
      body: Center(
        child: Text(maincategoryname),
      ),
    );
  }
}
