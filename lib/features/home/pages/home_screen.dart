import 'package:flutter/material.dart';
import 'package:news_app/core/cofigrations/colors.dart';
import 'package:news_app/features/home/widgets/custom_drawer_widget.dart';
import 'package:news_app/features/home/widgets/item_widget.dart';
import 'package:news_app/features/home/widgets/selected_item_widget.dart';
import 'package:news_app/model/CategoryData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryData> CategoryDataList = [
    CategoryData(
      CategoryName: "sports",
      CategoryID: "sports",
      CategoryBackgroundColor: const Color(0xFFC91C22),
      CategoryIcon: "assets/ball.png",
    ),
    CategoryData(
      CategoryName: "health",
      CategoryID: "health",
      CategoryBackgroundColor: const Color(0xFFED1E79),
      CategoryIcon: "assets/health.png",
    ),
    CategoryData(
      CategoryName: "environment",
      CategoryID: "environment",
      CategoryBackgroundColor: const Color(0xFF4882CF),
      CategoryIcon: "assets/environment.png",
    ),
    CategoryData(
      CategoryName: "politics",
      CategoryID: "politics",
      CategoryBackgroundColor: const Color(0xFF003E90),
      CategoryIcon: "assets/Politics.png",
    ),
    CategoryData(
      CategoryName: "business",
      CategoryID: "business",
      CategoryBackgroundColor: const Color(0xFFCF7E48),
      CategoryIcon: "assets/bussines.png",
    ),
    CategoryData(
      CategoryName: "science",
      CategoryID: "science",
      CategoryBackgroundColor: const Color(0xFFF2D352),
      CategoryIcon: "assets/science.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage('assets/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          title: Text(selectedCategoryData == null
              ? 'New App'
              : selectedCategoryData!.CategoryName),
          actions: [
            if (selectedCategoryData != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        drawer: CustomDrawerWidget(
            onCategoryChangedClicked: onCategoryChangedClicked),
        body: selectedCategoryData == null
            ? Column(
                children: [
                  Container(
                    child: const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(" Pick your category of intersts",
                          style: TextStyle(
                            fontFamily: "Exo",
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(30),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 20,
                              childAspectRatio: 0.90),
                      itemBuilder: (context, index) => ItemWidget(
                        index: index,
                        categoryData: CategoryDataList[index],
                        onCategoryClicked: onCategoryClicked,
                      ),
                      itemCount: CategoryDataList.length,
                    ),
                  )
                ],
              )
            : SelectedItemWidget(categoryData: selectedCategoryData!),
      ),
    );
  }

  CategoryData? selectedCategoryData;

  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }

  void onCategoryChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}
