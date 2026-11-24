
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'PSMS Management App',
      'description':
          'A student and school management application with attendance, courses and student records.',
      'image': 'assets/images/projects/psms.png',
      'technologies': ['Flutter', 'Firebase', 'Dart'],
    },
    {
      'title': 'Notes 3D App',
      'description':
          'A modern notes application with a clean interface for saving and managing personal notes.',
      'image': 'assets/images/projects/notes_3d.png',
      'technologies': ['Flutter', 'Dart', 'UI/UX'],
    },
    {
      'title': 'BMI 3D App',
      'description':
          'A BMI calculator application with an interactive interface and animated components.',
      'image': 'assets/images/projects/bmi_3d.png',
      'technologies': ['Flutter', 'Dart', 'Animation'],
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

              final int columns = width >= 1000
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
                    title: project['title'],
                    description: project['description'],
                    image: project['image'],
                    technologies:
                        List<String>.from(project['technologies']),
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
