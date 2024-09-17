import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view/widgets/News_Item.dart';
import 'package:news_app/news/view_model/news_states.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/Error_widget.dart';
import 'package:news_app/shared/Loading_Indicator.dart';

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
    return BlocProvider(
      create: (_) => NewsViewModel()..getNews(widget.sourceId),
      child: BlocBuilder<NewsViewModel, NewsStates>(builder: (context, state) {
        if (state is LoadinNews) {
          return const LoadinIndicator();
        } else if (state is ErrorNews) {
          return ErrorIndicator();
        } else if (state is SuccessNews) {
          return ListView.builder(
            itemBuilder: (_, index) => NewsItem(state.newsList[index]),
            itemCount: state.newsList.length,
          );
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
