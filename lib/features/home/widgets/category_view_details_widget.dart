import 'package:flutter/material.dart';
import 'package:news_app/data/data_source/api_articals.dart';
import 'package:news_app/features/home/widgets/tab_item_widget.dart';
import 'package:news_app/model/artical_model.dart';
import 'package:news_app/model/source_model.dart';

import '../../../core/cofigrations/colors.dart';

class CategoryViewDetailsWidget extends StatefulWidget {
  final List<Source> sourceList;

  const CategoryViewDetailsWidget({super.key, required this.sourceList});

  @override
  State<CategoryViewDetailsWidget> createState() =>
      _CategoryViewDetailsWidgetState();
}

class _CategoryViewDetailsWidgetState extends State<CategoryViewDetailsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sourceList.length,
          child: TabBar(
              tabAlignment: TabAlignment.start,
              indicatorPadding: EdgeInsets.zero,
              isScrollable: true,
              padding: const EdgeInsets.symmetric(vertical: 10),
              labelPadding: const EdgeInsets.symmetric(horizontal: 6),
              indicator: const BoxDecoration(),
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: widget.sourceList
                  .map((source) => TabItemWidget(
                        source: source,
                        isSelected:
                            selectedIndex == widget.sourceList.indexOf(source),
                      ))
                  .toList()),
        ),
        FutureBuilder<List<Article>>(
          future: widget.sourceList.isEmpty
              ? null
              : ApiArticles.fetchSourcesList(
                  widget.sourceList[selectedIndex].id,
                ),
          builder: (context, snapshot) {
            if (snapshot.hasError) return const Text("error Fetching");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorPalette.primaryColor,
                ),
              );
            }
            List<Article> articlesList = snapshot.data ?? [];

            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Text(
                  articlesList[index].description,
                ),
                itemCount: articlesList.length,
              ),
            );
          },
        ),
      ],
    );
  }
}
