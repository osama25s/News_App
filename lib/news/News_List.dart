import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/models/news_response/news_response.dart';
import 'package:news_app/news/News_Item.dart';
import 'package:news_app/widgets/Error_widget.dart';
import 'package:news_app/widgets/Loading_Indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadinIndicator();
        } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
