import 'package:ecommerce_predict/customer/cart.dart';
import 'package:ecommerce_predict/customer/stores.dart';
import 'package:ecommerce_predict/customer/user_profile.dart';
import 'package:ecommerce_predict/explore/explore_ui.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../main_screen_categoryScreen/category/category.dart';
import 'home.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;

  /// this will change to the screen of the selected bottom nav bar
  final List<Widget> _bottomNavBarTabs = [
    const HomeScreen(),
    const CategoryScreeen(),
    const StoreScreen(),
    const CartScreen(),
    const ExploreLandingPage(),
    ProfileScreen(
      documentId: FirebaseAuth.instance.currentUser!.uid,
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
