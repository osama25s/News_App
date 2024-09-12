import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/news/view/widgets/News_Item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/Error_widget.dart';
import 'package:news_app/shared/Loading_Indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList(this.sourceId, {super.key});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final newsviewmodel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    newsviewmodel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => newsviewmodel..getNews(widget.sourceId),
      child: Consumer<NewsViewModel>(builder: (_, newsviewmodel, __) {
        if (newsviewmodel.isloading) {
          return const LoadinIndicator();
        } else if (newsviewmodel.errormessage != null) {
          return ErrorIndicator();
        } else {
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(newsviewmodel.newsList[index]),
            itemCount: newsviewmodel.newsList.length,
          );
        }
      }),
    );
  }
}
