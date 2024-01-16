import 'package:ecommerce_predict/utilities/categ_list.dart';
import 'package:flutter/material.dart';

import '../../widget/categorywidget_for_category.dart';

class EquipmentCategory extends StatelessWidget {
  const EquipmentCategory({Key? key}) : super(key: key);

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
                      headerLabel: 'Equipments',
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
                          children:
                              List.generate(equipments.length - 1, (index) {
                            return SubCategoryModel(
                              mainCategoryName: 'equipments',
                              subCategoryName: equipments[index + 1],
                              //// TODO(musefiu_ojo_amos): image
                              assetName: 'images/equipments/equi$index.jpeg',
                              subCategoryLabel: equipments[index + 1],
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
              mainCategoryName: 'equipments',
            ),
          )
        ],
      ),
    );
  }
}
