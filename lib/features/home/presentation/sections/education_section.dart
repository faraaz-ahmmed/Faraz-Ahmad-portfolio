
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
            'My academic journey and qualifications',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),

          _EducationCard(
            icon: Icons.school_rounded,
            title: 'Bachelor of Science',
            subtitle: 'Computer Science',
            institute: 'University of Agriculture, Peshawar',
            duration: 'December 2023 – December 2027',
            status: '7th Semester',
            colors: [
              const Color(0xFF123B70),
              const Color(0xFF10264A),
            ],
          ),

          const SizedBox(height: 20),

          _EducationCard(
            icon: Icons.menu_book_rounded,
            title: 'Intermediate (FA)',
            subtitle: 'Pre-Engineering',
            institute: 'Oxford Group of Colleges, Kohat',
            duration: '2021 – 2023',
            status: 'Completed',
            colors: [
              const Color(0xFF174B55),
              const Color(0xFF102F42),
            ],
          ),

          const SizedBox(height: 20),

          _EducationCard(
            icon: Icons.cast_for_education_rounded,
            title: 'Matriculation',
            subtitle: 'Secondary School Education',
            institute: 'Government High School  Babri Banda, Kohat',
            duration: '2019 – 2021',
            status: 'Completed',
            colors: [
              const Color(0xFF44336D),
              const Color(0xFF202044),
            ],
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String institute;
  final String duration;
  final String status;
  final List<Color> colors;

  const _EducationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.institute,
    required this.duration,
    required this.status,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.cyan.withValues(alpha: 0.25),
        ),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.25),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
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
                      title,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.cyan,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 22),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.location_on_rounded,
                color: AppColors.cyan,
                size: 19,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  institute,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              const Icon(
                Icons.calendar_month_rounded,
                color: AppColors.cyan,
                size: 19,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  duration,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.cyan.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.cyan.withValues(alpha: 0.35),
                ),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: AppColors.cyan,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
