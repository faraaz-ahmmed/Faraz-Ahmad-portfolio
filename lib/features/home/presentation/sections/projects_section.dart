
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
      'githubUrl':
          'https://github.com/faraaz-ahmmed/professional-student-management-system',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
    },
    {
      'title': 'AgeCraft 3D',
      'description':
          'An age calculator application that calculates age in years, months and days.',
      'image': 'assets/images/projects/age_craft.png',
      'githubUrl':
          'https://github.com/faraaz-ahmmed/age-craft-3d',
      'technologies': ['Flutter', 'Dart', 'UI/UX'],
    },
    {
      'title': 'BMI 3D App',
      'description':
          'A BMI calculator application with an interactive 3D-inspired interface.',
      'image': 'assets/images/projects/bmi_3d.png',
      'githubUrl':
          'https://github.com/faraaz-ahmmed/bmi-3d',
      'technologies': ['Flutter', 'Dart', 'Animation'],
    },
    {
      'title': 'Notes 3D App',
      'description':
          'A personal notebook application to create, view, edit and delete notes.',
      'image': 'assets/images/projects/notes_3d.png',
      'githubUrl':
          'https://github.com/faraaz-ahmmed/ToDo_App',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
          const SizedBox(height: 45),

          LayoutBuilder(
            builder: (context, constraints) {
              final width = constraints.maxWidth;

              final columns = width >= 1000
                  ? 3
                  : width >= 650
                      ? 2
                      : 1;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projects.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: 25,
                  mainAxisSpacing: 25,
                  mainAxisExtent: 430,
                ),
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return ProjectCard(
                    title: project['title'] as String,
                    description: project['description'] as String,
                    image: project['image'] as String,
                    githubUrl: project['githubUrl'] as String,
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
