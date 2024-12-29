import 'package:assignment_1/app/app_colors.dart';
import 'package:flutter/material.dart';

class CategorySectionWidget extends StatelessWidget {
  const CategorySectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['All', 'Action', 'Anime', 'Sci-fi', 'Thriller'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Categories',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'See More',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: categories.map((label) {
            return CategoryChipWidget(label: label, isActive: label == 'All');
          }).toList(),
        ),
      ],
    );
  }
}

class CategoryChipWidget extends StatelessWidget {
  final String label;
  final bool isActive;

  const CategoryChipWidget(
      {required this.label, this.isActive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.themeColor : AppColors.box2Color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.grey,
          fontSize: 14,
        ),
      ),
    );
  }
}
