import 'package:flutter/material.dart';
import 'package:news_app/model/CategoryData.dart';

class ItemWidget extends StatelessWidget {
  final CategoryData categoryData;
  final int index;

  final void Function(CategoryData) onCategoryClicked;

  const ItemWidget(
      {super.key,
      required this.categoryData,
      required this.index,
      required this.onCategoryClicked});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClicked(categoryData);
      },
      child: Container(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          decoration: BoxDecoration(
            color: categoryData.CategoryBackgroundColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomRight: index % 2 == 0
                  ? const Radius.circular(0)
                  : const Radius.circular(25),
              bottomLeft: index % 2 == 0
                  ? const Radius.circular(25)
                  : const Radius.circular(0),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(categoryData.CategoryIcon),
              ),
              Text(
                categoryData.CategoryName,
                style: TextStyle(
                    fontFamily: "Exo",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          )),
    );
  }
}
