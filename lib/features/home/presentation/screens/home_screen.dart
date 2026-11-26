
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

import '../sections/about_section.dart';
import '../sections/projects_section.dart';
import '../sections/education_section.dart';

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
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header Section
                  HomeHeader(
                    isMobile: isMobile,
                  ),

                  const SizedBox(height: 40),

                  // Hero Section
                  HeroSection(
                    isMobile: isMobile,
                  ),

                  const SizedBox(height: 60),

                  // About Me Section
                  const AboutSection(),

                  const SizedBox(height: 60),

                  // Projects Section
                  const ProjectsSection(),

                  const SizedBox(height: 60),

                  // Education Section
                  const EducationSection(),

                  const SizedBox(height: 80),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
