import 'package:flutter/material.dart';
import 'package:news_app/Settings/Settings_Tab.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/categories/view/widgets/Category_Details.dart';
import 'package:news_app/categories/data/models/Category_Model.dart';
import 'package:news_app/categories/view/widgets/categories_gird.dart';
import 'package:news_app/home/view/widgets/Drawer_Widget.dart';
import 'package:news_app/search/view/screens/News_Seach_Delegate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routename = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  drawerItem item = drawerItem.categories;
  CategoryModel? categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppTheme.white,
          image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        drawer: DrawerWidget(
          itemselection: onItemSelected,
        ),
        appBar: AppBar(
          title: Text('News App'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: IconButton(
                onPressed: () => showSearch(
                    context: context, delegate: NewsSearchDelegate()),
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
        body: categoryModel != null
            ? CategoryDetails(categoryModel!.id)
            : item == drawerItem.categories
                ? CategoriesGrid(
                    ceategorySelected: ceategorySelected,
                  )
                : const SettingsTab(),
      ),
    );
  }

  void onItemSelected(drawerItem selectedItem) {
    item = selectedItem;
    setState(() {});
    Navigator.of(context).pop();
    categoryModel = null;
  }

  void ceategorySelected(sendcategory) {
    categoryModel = sendcategory;
    setState(() {});
  }
}
