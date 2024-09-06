import 'package:flutter/material.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Something went wrong',
        style:
            Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
      ),
    );
  }
}
