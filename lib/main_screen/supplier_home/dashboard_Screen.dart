import 'package:ecommerce_predict/widget/appBarWidget.dart';
import 'package:flutter/material.dart';

List<String> label = [
  'my store',
  'orders',
  'edit profile',
  'manage products',
  'balance',
  'statics'
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
              onPressed: () {},
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
            return Card(
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
            );
          }),
        ),
      ),
    );
  }
}
