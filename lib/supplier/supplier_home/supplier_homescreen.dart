import 'package:ecommerce_predict/customer/stores.dart';
import 'package:flutter/material.dart';

import '../../customer/customer_home/home.dart';
import '../../main_screen_categoryScreen/category/category.dart';
import '../dashboard/dashboard_Screen.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;

  /// this will change to the screen of the selected bottom nav bar
  final List<Widget> _bottomNavBarTabs = const [
    HomeScreen(),
    CategoryScreeen(),
    StoreScreen(),
    DashBoardScreen(),
    Center(
      child: Text('Upload'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///this will allow the body to change with the index as defined in the list above
      body: _bottomNavBarTabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        /// this is for the bottom navigation bar
        /// allows you to navigate in the ui
        elevation: 0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed, // this could be set to fixed

        selectedItemColor: Colors.red.shade300,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Stores'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;

            ///this will make the index change
          });
        },
      ),
    );
  }
}
