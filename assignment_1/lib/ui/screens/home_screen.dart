import 'package:assignment_1/data/dummy_movie_data.dart';
import 'package:flutter/material.dart';
import '../widgets/header_widget.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/category_section_widget.dart';
import '../widgets/featured_carousel_widget.dart';
import '../widgets/movie_section_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const HeaderWidget(),
                const SearchBarWidget(),
                const SizedBox(height: 10),
                const CategorySectionWidget(),
                const FeaturedCarouselWidget(),

                //Trending Movies

                MovieSectionWidget(
                  title: 'Trending Movies',
                  movies: movieData['trendingMovies']!,
                  width: 100,
                  height: 130,
                ),

                //Continue Watching

                MovieSectionWidget(
                  title: 'Continue Watching',
                  movies: movieData['continueWatching']!,
                  width: 200,
                  height: 120,
                  isProgress: true,
                ),

                //Recommended For You

                MovieSectionWidget(
                  title: 'Recommended For You',
                  movies: movieData['recommendedMovies']!,
                  width: 100,
                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
