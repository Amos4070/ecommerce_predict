import 'package:ecommerce_predict/explore/explore_ui.dart';
import 'package:ecommerce_predict/main_screen/category/category.dart';
import 'package:ecommerce_predict/main_screen/customer_home/home.dart';
import 'package:flutter/material.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

  /// this will change to the screen of the selected bottom nav bar
  final List<Widget> _bottomNavBarTabs = const [
    HomeScreen(),
    CategoryScreeen(),
    Center(
      child: Text('Store Screen'),
    ),
    Center(
      child: Text('Cart Screen'),
    ),
    ExploreLandingPage(),
    Center(
      child: Text('Profile Screen'),
    )
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
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
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
