import 'package:assignment_1/app/app_colors.dart';
import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  final Map<String, dynamic> movie;
  final double width;
  final double height;
  final bool isProgress;

  const MovieCardWidget({
    required this.movie,
    super.key,
    required this.width,
    required this.height,
    required this.isProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                Image.asset(
                  movie['image']!,
                  height: height,
                  width: width,
                  fit: BoxFit.fill,
                ),
                if (movie.containsKey('progress')) // Check if progress exists
                  SizedBox(
                    width: width,
                    child: LinearProgressIndicator(
                      value: movie['progress'], // Use dynamic progress value
                      backgroundColor: Colors.grey[800],
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: width,
            child: Text(
              movie['title']!,
              style: TextStyle(
                fontFamily: 'Akatab',
                color: AppColors.whiteColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
