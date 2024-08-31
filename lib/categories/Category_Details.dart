import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails(this.Id, {super.key});
  final String Id;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(Id),
      ),
    );
  }
}
