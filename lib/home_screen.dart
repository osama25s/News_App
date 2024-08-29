import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/categories_gird.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routename = '/';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('News App'),
        ),
        body: const CategoriesGrid(),
      ),
    );
  }
}
