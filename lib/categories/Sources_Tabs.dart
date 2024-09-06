import 'package:flutter/material.dart';
import 'package:news_app/categories/Tab_Widget.dart';
import 'package:news_app/models/Source.dart';
import 'package:news_app/news/News_Item.dart';
import 'package:news_app/news/News_List.dart';

class SourcesTabs extends StatefulWidget {
  const SourcesTabs(this.source, {super.key});
  final List<Source> source;
  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedIdex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.source.length,
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
              tabs: widget.source
                  .map(
                    (item) => TabWidget(
                      isSelected: widget.source.indexOf(item) == selectedIdex,
                      sourse: item.name ?? '',
                    ),
                  )
                  .toList()),
        ),
        Expanded(child: NewsList(widget.source[selectedIdex].id ?? '')),
      ],
    );
  }
}
