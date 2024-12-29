import 'package:assignment_1/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FeaturedCarouselWidget extends StatelessWidget {
  const FeaturedCarouselWidget({super.key});

  final List<String> carouselImages = const [
    'assets/images/slideimage.png',
    'assets/images/slideimage.png',
    'assets/images/slideimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

    return Column(
      children: [
        ValueListenableBuilder<int>(
          valueListenable: selectedIndex,
          builder: (context, value, _) {
            return Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    viewportFraction: 0.95,
                    onPageChanged: (index, _) => selectedIndex.value = index,
                  ),
                  items: carouselImages.map((image) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(image, fit: BoxFit.cover),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    carouselImages.length,
                    (index) => Container(
                      width: 9,
                      height: 9,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: selectedIndex.value == index
                            ? AppColors.whiteColor
                            : AppColors.dotNotActiveColors,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
