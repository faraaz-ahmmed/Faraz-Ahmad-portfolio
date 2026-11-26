
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

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
            'Education',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'My academic background and qualifications',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: AppColors.border,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.school_rounded,
                        color: AppColors.cyan,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'University of Agriculture, Peshawar',
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: isMobile ? 17 : 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Computer Science',
                            style: TextStyle(
                              color: AppColors.cyan,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '7th Semester',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                const Divider(color: AppColors.border),
                const SizedBox(height: 18),

                _EducationDetail(
                  icon: Icons.calendar_month_rounded,
                  label: 'Duration',
                  value: 'December 2023 – December 2027',
                ),
                const SizedBox(height: 16),
                _EducationDetail(
                  icon: Icons.grade_rounded,
                  label: 'Grade',
                  value: 'A',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _EducationDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColors.cyan,
          size: 20,
        ),
        const SizedBox(width: 12),
        Text(
          '$label: ',
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}
