import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../minor_screen/search_bar.dart';

class appBarTitleFakeSearch extends StatelessWidget {
  const appBarTitleFakeSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const SearchScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 300));
      },
      child: Container(
        /// this is for designing the search bar
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.yellow, width: 1.4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
                ),
                Text(
                  'What are you looking for?',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            Container(
              width: 75,
              height: 32,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontStyle: FontStyle.italic),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
