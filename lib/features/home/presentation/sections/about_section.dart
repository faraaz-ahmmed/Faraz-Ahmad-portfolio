
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'Firebase',
    'REST APIs',
    'UI/UX Design',
    'Responsive Design',
    'Cross-Platform Development',
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
                        'Flutter Developer',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: AppColors.cyan,
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'I am a motivated Computer Science undergraduate '
                        'with a strong passion for mobile application '
                        'development using Flutter. I enjoy building '
                        'modern, responsive, and user-friendly '
                        'cross-platform applications with clean and '
                        'efficient code. I have experience working with '
                        'Dart, Firebase, REST APIs, and UI/UX-focused '
                        'designs to create impactful digital solutions. '
                        'I am always eager to learn new technologies '
                        'and improve my development skills through '
                        'real-world projects. My goal is to contribute '
                        'to innovative teams and develop applications '
                        'that solve meaningful problems.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.9,
                          color: AppColors.textSecondary,
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'I am actively seeking opportunities to grow '
                        'as a professional Flutter Developer in the '
                        'tech industry.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.8,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 28),

                      const Text(
                        'Technologies & Skills',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),

                      const SizedBox(height: 16),

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
                        flex: 4,
                        child: Container(
                          height: 320,
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
                              size: 110,
                              color: AppColors.cyan,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 45),

                      Expanded(
                        flex: 6,
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
