
import 'package:flutter/material.dart';

import '../sections/about_section.dart';
import '../sections/projects_section.dart';
import '../sections/education_section.dart';
import '../sections/experience_section.dart';
import '../sections/contact_section.dart';
import '../sections/footer_section.dart';

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

  Future<void> _scrollToSection(String section) async {
    final Map<String, GlobalKey> sectionKeys = {
      'Home': _homeKey,
      'About': _aboutKey,
      'Skills': _aboutKey,
      'Projects': _projectsKey,
      'Education': _educationKey,
      'Experience': _experienceKey,
      'Contact': _contactKey,
    };

    final key = sectionKeys[section];
    final targetContext = key?.currentContext;

    if (targetContext == null) return;

    await Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOut,
      alignment: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  HeroSection(
                    key: _homeKey,
                    isMobile: isMobile,
                    onViewProjects: () {
                      _scrollToSection('Projects');
                    },
                    onContactMe: () {
                      _scrollToSection('Contact');
                    },
                  ),

                  const SizedBox(height: 60),

                  // About Section
                  AboutSection(
                    key: _aboutKey,
                  ),

                  const SizedBox(height: 60),

                  // Projects Section
                  ProjectsSection(
                    key: _projectsKey,
                  ),

                  const SizedBox(height: 60),

                  // Education Section
                  EducationSection(
                    key: _educationKey,
                  ),

                  const SizedBox(height: 60),

                  // Experience Section
                  ExperienceSection(
                    key: _experienceKey,
                  ),

                  const SizedBox(height: 60),

                  // Contact Section
                  ContactSection(
                    key: _contactKey,
                  ),

                  const SizedBox(height: 40),

                  // Footer Section
                  FooterSection(
                    onBackToTop: () {
                      _scrollToSection('Home');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
