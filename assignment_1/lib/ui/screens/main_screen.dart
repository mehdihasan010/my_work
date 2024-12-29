import 'package:assignment_1/app/app_assets.dart';
import 'package:assignment_1/app/app_colors.dart';
import 'package:assignment_1/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of widget pages

  final List<Widget> _pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.bottomBarColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(AppAssets.iconsHome, 0),
                _buildNavItem(AppAssets.iconsMonitorIcon, 1),
                _buildNavItem(AppAssets.iconsDownload, 2),
                _buildNavItem(AppAssets.iconsProfileIcon, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(String svgAsset, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SvgPicture.asset(
        svgAsset,
        // ignore: deprecated_member_use
        color: _selectedIndex == index
            ? AppColors.themeColor
            : AppColors.greyColor,
        height: 28,
        width: 28,
      ),
    );
  }
}
