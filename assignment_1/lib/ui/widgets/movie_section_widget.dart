import 'package:assignment_1/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'movie_card_widget.dart';

class MovieSectionWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> movies;
  final double width;
  final double height;
  final bool isProgress;

  const MovieSectionWidget({
    required this.title,
    required this.movies,
    super.key,
    required this.width,
    required this.height,
    this.isProgress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Akatab',
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
        const SizedBox(height: 20),
        SizedBox(
          height: height + 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCardWidget(
                movie: movies[index],
                width: width,
                height: height,
                isProgress: isProgress,
              );
            },
          ),
        ),
      ],
    );
  }
}
