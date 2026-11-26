
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

import '../sections/about_section.dart';
import '../sections/projects_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/contact_section.dart';


import '../widgets/home_header.dart';
import '../widgets/hero_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(String section) {
    GlobalKey? targetKey;

    switch (section) {
      case 'Home':
        targetKey = _homeKey;
        break;

      case 'About':
      case 'Skills':
        targetKey = _aboutKey;
        break;

      case 'Projects':
        targetKey = _projectsKey;
        break;

      case 'Education':
        targetKey = _educationKey;
        break;

      case 'Experience':
        targetKey = _experienceKey;
        break;

      case 'Contact':
        targetKey = _contactKey;
        break;
    }

    final targetContext = targetKey?.currentContext;

    if (targetContext != null) {
      Scrollable.ensureVisible(
        targetContext,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

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
                  // Header
                  HomeHeader(
                    isMobile: isMobile,
                    onNavigate: _scrollToSection,
                  ),

                  const SizedBox(height: 40),

                  // Hero Section
                  KeyedSubtree(
                    key: _homeKey,
                    child: HeroSection(
                      isMobile: isMobile,
                    ),
                  ),

                  const SizedBox(height: 60),

                  // About Section
                  KeyedSubtree(
                    key: _aboutKey,
                    child: const AboutSection(),
                  ),

                  const SizedBox(height: 60),

                  // Projects Section
                  KeyedSubtree(
                    key: _projectsKey,
                    child: const ProjectsSection(),
                  ),

                  const SizedBox(height: 60),

                  // Education Section
                  KeyedSubtree(
                    key: _educationKey,
                    child: const EducationSection(),
                  ),

                  const SizedBox(height: 60),

                  // Experience Section
                  KeyedSubtree(
                    key: _experienceKey,
                    child: const ExperienceSection(),
                  ),

                  const SizedBox(height: 60),

                  // Contact Section
                  KeyedSubtree(
                    key: _contactKey,
                    child: const ContactSection(),
                  ),

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
