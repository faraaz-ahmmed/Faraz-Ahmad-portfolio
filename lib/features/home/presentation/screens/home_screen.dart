
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/home_header.dart';
import '../widgets/hero_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return SingleChildScrollView(
              child: Column(
                children: [
                  HomeHeader(isMobile: isMobile),
                  const SizedBox(height: 40),
                  HeroSection(isMobile: isMobile),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
