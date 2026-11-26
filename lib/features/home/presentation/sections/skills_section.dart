
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'icon': Icons.phone_android_rounded},
    {'name': 'Dart', 'icon': Icons.code_rounded},
    {'name': 'Firebase', 'icon': Icons.local_fire_department_rounded},
    {'name': 'REST APIs', 'icon': Icons.api_rounded},
    {'name': 'UI/UX Design', 'icon': Icons.palette_rounded},
    {'name': 'Responsive Design', 'icon': Icons.devices_rounded},
    {'name': 'Cross-Platform Development', 'icon': Icons.layers_rounded},
    {'name': 'Git & GitHub', 'icon': Icons.code_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Skills',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Technologies and tools I work with',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: skills.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 115,
            ),
            itemBuilder: (context, index) {
              final skill = skills[index];

              return Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      skill['icon'] as IconData,
                      color: AppColors.cyan,
                      size: 30,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      skill['name'] as String,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
