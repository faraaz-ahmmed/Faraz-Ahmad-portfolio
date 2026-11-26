
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'Cloud Firestore',
    'Responsive UI',
    'UI/UX Design',
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
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Get to know me and my development journey.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 45),

              LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 700;

                  final aboutContent = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hello, I am a Flutter Developer',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cyan,
                        ),
                      ),
                      const SizedBox(height: 18),
                      const Text(
                        'I am a Flutter developer interested in '
                        'building modern, responsive and user-friendly '
                        'mobile and web applications. I work with '
                        'Flutter, Dart and Firebase to develop '
                        'functional applications with clean UI.',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.8,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Text(
                        'My Skills',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: skills.map((skill) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(
                                alpha: 0.15,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.border,
                              ),
                            ),
                            child: Text(
                              skill,
                              style: const TextStyle(
                                color: AppColors.cyan,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );

                  if (isMobile) {
                    return aboutContent;
                  }

                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          height: 300,
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.border,
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.code_rounded,
                              size: 100,
                              color: AppColors.cyan,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 45),
                      Expanded(
                        child: aboutContent,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
