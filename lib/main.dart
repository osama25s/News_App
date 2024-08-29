import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';

void main() {
  runApp(const News_App());
}

class News_App extends StatelessWidget {
  const News_App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(412, 870),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              HomeScreen.routename: (context) => const HomeScreen(),
            },
            theme: AppTheme.lightTeme,
            themeMode: ThemeMode.light,
          );
        });
  }
}
