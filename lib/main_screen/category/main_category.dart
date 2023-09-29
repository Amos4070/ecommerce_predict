import 'package:ecommerce_predict/utilities/categ_list.dart';
import 'package:flutter/material.dart';

import '../../widget/categorywidget_for_category.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 1,

                    /// this widget was extracted and is below
                    child: CategoryHeaderLabel(
                      headerLabel: 'Men',
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                          mainAxisSpacing: 40,
                          crossAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(men.length, (index) {
                            return SubCategoryModel(
                              mainCategoryName: 'Men',
                              subCategoryName: men[index],
                              assetName: 'images/men/men$index.jpg',
                              subCategoryLabel: men[index],
                            );
                          })),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,

            /// this slider bar is custom slider bar used for the side tin bar
            /// in category, it was extracted
            child: SliderBar(
              mainCategoryName: 'men',
            ),
          )
        ],
      ),
    );
  }
}
