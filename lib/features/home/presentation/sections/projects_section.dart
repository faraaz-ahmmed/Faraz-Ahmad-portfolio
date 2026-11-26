
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'PSMS Management App',
      'description':
          'A student management system with attendance, courses, student records and administration.',
      'image': 'assets/images/projects/psms_icon.png',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
    },
    {
      'title': 'AgeCraft 3D',
      'description':
          'An age calculator application that calculates age in years, months and days.',
      'image': 'assets/images/projects/age_craft.png',
      'technologies': ['Flutter', 'Dart', 'UI/UX'],
    },
    {
      'title': 'BMI 3D App',
      'description':
          'A BMI calculator application featuring an interactive 3D-inspired user interface.',
      'image': 'assets/images/projects/bmi_3d.png',
      'technologies': ['Flutter', 'Dart', 'Animation'],
    },
    {
      'title': 'Notes 3D App',
      'description':
          'A personal notebook application to create, view, edit and delete notes using Firebase.',
      'image': 'assets/images/projects/notes_3d.png',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 70,
      ),
      child: Column(
        children: [
          const Text(
            'My Projects',
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Some of my recent Flutter development work.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),

          const SizedBox(height: 40),

          LayoutBuilder(
            builder: (context, constraints) {
              // Desktop: 4 columns
              // Tablet: 2 columns
              // Mobile: 1 column
              final screenWidth = MediaQuery.sizeOf(context).width;

              final int columns;

              if (screenWidth >= 1000) {
                columns = 4;
              } else if (screenWidth >= 600) {
                columns = 2;
              } else {
                columns = 1;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 400,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return ProjectCard(
                    title: project['title'] as String,
                    description: project['description'] as String,
                    image: project['image'] as String,
                    technologies: List<String>.from(
                      project['technologies'] as List,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
