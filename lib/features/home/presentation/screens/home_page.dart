import 'package:flutter/material.dart';
import 'package:flutter_dev_test/constants/text_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'home',
          style: Theme.of(context).textTheme.labelLarge!.copyWith(color: TextColors.secondary),
        ),
      ),
    );
  }
}
