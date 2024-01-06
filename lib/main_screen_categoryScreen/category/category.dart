import 'package:ecommerce_predict/main_screen_categoryScreen/category/chemicals.dart';
import 'package:ecommerce_predict/main_screen_categoryScreen/category/equipments.dart';
import 'package:ecommerce_predict/main_screen_categoryScreen/category/kids_category.dart';
import 'package:ecommerce_predict/main_screen_categoryScreen/category/property.dart';
import 'package:ecommerce_predict/main_screen_categoryScreen/category/shoes.dart';
import 'package:ecommerce_predict/main_screen_categoryScreen/category/women_category.dart';
import 'package:ecommerce_predict/widget/fakeSearch.dart';
import 'package:flutter/material.dart';

import 'accessories_category.dart';
import 'bag_category.dart';
import 'beauty_category.dart';
import 'electronics_category.dart';
import 'home_and_garden.dart';
import 'main_category.dart';

List<ItemsData> items = [
  ItemsData(label: 'cereals'),
  ItemsData(label: 'tubers'),
  ItemsData(label: 'legumes'),
  ItemsData(label: 'vegetable & fruits'),
  ItemsData(label: 'sugars'),
  ItemsData(label: 'meats & eggs'),
  ItemsData(label: 'dairy'),
  ItemsData(label: 'oil'),
  ItemsData(label: 'beverages'),
  ItemsData(label: 'equipments'),
  ItemsData(label: 'chemicals'),
  ItemsData(label: 'property'),
];

class CategoryScreeen extends StatefulWidget {
  const CategoryScreeen({Key? key}) : super(key: key);

  @override
  State<CategoryScreeen> createState() => _CategoryScreeenState();
}

class _CategoryScreeenState extends State<CategoryScreeen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });

    /// Todo: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const appBarTitleFakeSearch(),
      ),
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              left: 0,

              /// this is the sideNavigator  function that was defined below
              child: sideNavigatorView(size)),
          Positioned(
              bottom: 0,
              right: 0,

              /// this is the category view function defined below
              child: categoryView(size))
        ],
      ),
    );
  }

  Widget sideNavigatorView(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                _pageController.animateToPage(index,
                    duration: const Duration(
                      milliseconds: 100,
                    ),
                    curve: Curves.bounceIn);
                // for (var element in items) {
                //   element.isSelected = false;
                // }
                // setState(() {
                //   items[index].isSelected = true;
                //     });
              },
              child: Container(
                  color: items[index].isSelected == true
                      ? Colors.white
                      : Colors.grey.shade300,
                  height: 100,
                  child: Center(child: Text(items[index].label))),
            );
          }),
    );
  }

  /// Size is an inbuilt function for parsing size
  Widget categoryView(Size size) {
    return Container(
      height: size.height * 0.8,
      width: size.width * 0.8,
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          CerealCategory(),
          TuberCategory(),
          LegumesCategory(),
          VegetableFruitsCategory(),
          SugarCategory(),
          MeatEggCategory(),
          DairyCategory(),
          OilCategory(),
          BeverageCategory(),
          EquipmentCategory(),
          ChemicalCategory(),
          PropertyCategory()
        ],
      ),
    );
  }
}

/// this will make us to be able to select the side view category
class ItemsData {
  String label;
  bool isSelected;

  ItemsData({required this.label, this.isSelected = false});
}
