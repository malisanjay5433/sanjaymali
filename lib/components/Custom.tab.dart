import 'package:flutter/material.dart';
import 'package:sanjaymali/helper/app.colors.dart';
import 'package:sanjaymali/helper/app.style.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        title,
        style: AppTextStyles.veryNormalStyle(),
      ),
    );
  }
}
