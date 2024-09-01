import 'package:flutter/material.dart';
import 'package:news_app/categories/Tab_Widget.dart';
import 'package:news_app/news/News_Item.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.Id, {super.key});
  final String Id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final sourse = List.generate(6, (index) => 'Sourse$index');
  int selectedIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: sourse.length,
          child: TabBar(
              padding: EdgeInsets.zero,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              dividerColor: Colors.transparent,
              onTap: (index) {
                selectedIdex = index;
                setState(() {});
              },
              tabs: sourse
                  .map(
                    (item) => TabWidget(
                      isSelected: sourse.indexOf(item) == selectedIdex,
                      sourse: item,
                    ),
                  )
                  .toList()),
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (_, index) => const NewsItem(),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
