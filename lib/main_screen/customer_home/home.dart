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
      length: 9,
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
              appBarRepeatedTab(label: 'Men'),
              appBarRepeatedTab(label: 'Women'),
              appBarRepeatedTab(label: 'Shoes'),
              appBarRepeatedTab(label: 'Bags'),
              appBarRepeatedTab(label: 'Electronics'),
              appBarRepeatedTab(label: 'Accessories'),
              appBarRepeatedTab(label: 'Home & Garden'),
              appBarRepeatedTab(label: 'Kids'),
              appBarRepeatedTab(label: 'Beauty'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('men screen')),
            Center(child: Text('women screen')),
            Center(child: Text('shoe screen')),
            Center(child: Text('Bag screen')),
            Center(child: Text('Electronics screen')),
            Center(child: Text('Accessories screen')),
            Center(child: Text('Home And Garden screen')),
            Center(child: Text('Kids screen')),
            Center(child: Text('Beauty screen')),
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
