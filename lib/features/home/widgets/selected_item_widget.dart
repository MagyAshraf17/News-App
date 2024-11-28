import 'package:flutter/material.dart';
import 'package:news_app/core/cofigrations/colors.dart';
import 'package:news_app/data/data_source/api_manager.dart';
import 'package:news_app/features/home/widgets/category_view_details_widget.dart';
import 'package:news_app/model/CategoryData.dart';
import 'package:news_app/model/source_model.dart';

class SelectedItemWidget extends StatelessWidget {
  final CategoryData categoryData;

  const SelectedItemWidget({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.fetchSourcesList(categoryData.CategoryID),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Text("error Fetching");
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorPalette.primaryColor,
              ),
            );
          }
          List<Source> sourcesList = snapshot.data ?? [];
          return CategoryViewDetailsWidget(sourceList: sourcesList);
        });
  }
}
