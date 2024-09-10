import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/search/data/data_source/seaech_data_source.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/news/view/widgets/News_Item.dart';
import 'package:news_app/shared/Error_widget.dart';
import 'package:news_app/shared/Loading_Indicator.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: Icon(
          Icons.search,
          size: 28,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          "enter something to search",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return FutureBuilder(
      future: SearchDataSource.getsearchNews(query),
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

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(
        child: Text(
          "Suggestions",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }
    return FutureBuilder(
      future: SearchDataSource.getsearchNews(query),
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

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        primaryColor: AppTheme.primary,
        textTheme: TextTheme(
          titleLarge: TextStyle(
              color: AppTheme.navy,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700),
          titleMedium: GoogleFonts.exo(
              color: AppTheme.white,
              fontSize: 22.sp,
              fontWeight: FontWeight.w400),
          titleSmall: GoogleFonts.poppins(
              color: AppTheme.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: AppTheme.white),
          backgroundColor: AppTheme.primary,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: AppTheme.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
          ),
          centerTitle: true,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppTheme.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
        ));
  }
}
