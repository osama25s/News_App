import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/categories/Category_Item.dart';
import 'package:news_app/categories/Category_Model.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const List<CategoryModel> categories = [
      CategoryModel(
        image: 'assets/images/ball.png',
        lable: 'Sports',
        color: Colors.red,
      ),
      CategoryModel(
        image: 'assets/images/Politics.png',
        lable: 'Politics',
        color: Color(0xff003E90),
      ),
      CategoryModel(
        image: 'assets/images/health.png',
        lable: 'Health',
        color: Colors.pink,
      ),
      CategoryModel(
          image: 'assets/images/bussines.png',
          lable: 'Bussines',
          color: Color(0xffCF7E48)),
      CategoryModel(
        image: 'assets/images/environment.png',
        lable: 'Environment',
        color: Colors.blue,
      ),
      CategoryModel(
        image: 'assets/images/science.png',
        lable: 'Science',
        color: Colors.amber,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Pick your category\nof interest',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                return CotegoryItem(
                  indexitem: index,
                  category: categories[index],
                );
              },
              itemCount: 6,
            ),
          ),
        ],
      ),
    );
  }
}
