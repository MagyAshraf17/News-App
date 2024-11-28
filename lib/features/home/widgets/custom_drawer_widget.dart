import 'package:flutter/material.dart';
import 'package:news_app/core/cofigrations/colors.dart';

class CustomDrawerWidget extends StatelessWidget {
  final void Function() onCategoryChangedClicked;

  const CustomDrawerWidget({super.key, required this.onCategoryChangedClicked});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      width: mediaQuery.size.width * 0.7,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: mediaQuery.size.height * 0.2,
            alignment: Alignment.center,
            color: ColorPalette.primaryColor,
            child: const Text(
              'News App ',
              style: TextStyle(
                  backgroundColor: ColorPalette.primaryColor,
                  fontFamily: "Exo",
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          InkWell(
            onTap: () {
              onCategoryChangedClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 40,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(
                        fontFamily: "Exo",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              onCategoryChangedClicked();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                        fontFamily: "Exo",
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
