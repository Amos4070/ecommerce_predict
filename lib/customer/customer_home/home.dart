import 'package:flutter/material.dart';

import '../../widget/fakeSearch.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      /// defaultTabController is used to make controller available
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,

          /// CupertinoSearchTextField is used for searching in the appbar
          ///title: const CupertinoSearchTextField(), container can be used instead
          title: const appBarTitleFakeSearch(

              /// this is appBar title that was extracted
              ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 6,

            /// the TabBar allow us to have tab widget in the appBar
            tabs: [
              /// this was extracted because it is repeated, check below
              appBarRepeatedTab(label: 'Cereals'),
              appBarRepeatedTab(label: 'Tubers'),
              appBarRepeatedTab(label: 'Legumes'),
              appBarRepeatedTab(label: 'Vegetable & Fruits'),
              appBarRepeatedTab(label: 'Sugar'),
              appBarRepeatedTab(label: 'Meats & Eggs'),
              appBarRepeatedTab(label: 'Dairy'),
              appBarRepeatedTab(label: 'Oil'),
              appBarRepeatedTab(label: 'Beverages'),
              appBarRepeatedTab(label: 'Equipments'),
              appBarRepeatedTab(label: 'Chemicals'),
              appBarRepeatedTab(label: 'Property'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Cereals screen')),
            Center(child: Text('Tubers screen')),
            Center(child: Text('Legumes screen')),
            Center(child: Text('Vegetable screen')),
            Center(child: Text('Sugar screen')),
            Center(child: Text('Meats And Eggs screen')),
            Center(child: Text('Dairy screen')),
            Center(child: Text('Oil screen')),
            Center(child: Text('Beverages screen')),
            Center(child: Text('Equipments screen')),
            Center(child: Text('Chemicals')),
            Center(child: Text('Property screen')),
          ],
        ),
      ),
    );
  }
}

/// this is appBar title that was extracted
class appBarRepeatedTab extends StatelessWidget {
  final String label;
  const appBarRepeatedTab({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}
