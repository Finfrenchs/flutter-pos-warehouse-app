import 'package:flutter/material.dart';

import '../../../core/core.dart';

class MenuCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const MenuCard({
    super.key,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 50.0,
              width: 50.0,
            ),
            const SpaceHeight(8.0),
            Text(title),
          ],
        ),
      ),
    );
  }
}
