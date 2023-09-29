import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../minor_screen/subCategory_products.dart';

class SliderBar extends StatelessWidget {
  final String mainCategoryName;
  const SliderBar({
    super.key,
    required this.mainCategoryName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.05,
      height: MediaQuery.of(context).size.height * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.brown.withOpacity(0.3)),

          /// note the use of rotated box, is used to turn
          child: RotatedBox(
            /// the codes here is for the tiny straight container at
            /// right side in the category
            quarterTurns: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategoryName == 'beauty'
                    ? const Text('')
                    : const Text('<<', style: categStyle),
                Text(mainCategoryName.toUpperCase(), style: categStyle),
                mainCategoryName == 'men'
                    ? const Text('')
                    : const Text('>>', style: categStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const categStyle = TextStyle(
    color: Colors.brown,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 10);

class SubCategoryModel extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  final String assetName;
  final String subCategoryLabel;

  const SubCategoryModel({
    super.key,
    required this.mainCategoryName,
    required this.subCategoryName,
    required this.assetName,
    required this.subCategoryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          /// this subcategory product is the page we go to when a product is clicked on
          SubCategoryProducts(
            subcategoryname: subCategoryName,
            maincategoryname: mainCategoryName,
          ),
          fullscreenDialog: true,
          // transition: Transition.leftToRightWithFade,
          // duration: const Duration(milliseconds: 200),
        );
      },
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 70,
              width: 80,
              child: Image(image: AssetImage(assetName)),
            ),
          ),

          /// this was called from the list name
          Text(subCategoryLabel, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}

class CategoryHeaderLabel extends StatelessWidget {
  final String headerLabel;
  const CategoryHeaderLabel({
    super.key,
    required this.headerLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //todo there is an overflow here tryna fix
      padding: const EdgeInsets.all(30),
      child: Text(
        headerLabel,
        style: const TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),
      ),
    );
  }
}
