import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/categories/Sources_Tabs.dart';
import 'package:news_app/widgets/Error_widget.dart';
import 'package:news_app/widgets/Loading_Indicator.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.Id, {super.key});
  final String Id;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSources(widget.Id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadinIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final sourse = snapshot.data?.sources ?? [];
          return SourcesTabs(sourse);
        }
      },
    );
  }
}
