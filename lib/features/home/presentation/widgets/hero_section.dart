
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onViewProjects;
  final VoidCallback onContactMe;

  const HeroSection({
    super.key,
    required this.isMobile,
    required this.onViewProjects,
    required this.onContactMe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 30,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: isMobile ? 0 : 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "HELLO, I'M",
                  style: TextStyle(
                    color: AppColors.cyan,
                    letterSpacing: 3,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Faraz Ahmad',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: AppColors.cyan,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'I build modern, responsive and '
                  'user-friendly mobile and web applications '
                  'using Flutter and Dart.',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 30),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    ElevatedButton(
                      onPressed: onViewProjects,
                      child: const Text('View Projects'),
                    ),
                    OutlinedButton(
                      onPressed: onContactMe,
                      child: const Text('Contact Me'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (!isMobile) const SizedBox(width: 50),
          if (isMobile) const SizedBox(height: 35),
          SizedBox(
            width: isMobile ? 240 : 320,
            height: isMobile ? 280 : 360,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/profile.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stack) {
                  return const ColoredBox(
                    color: AppColors.surface,
                    child: Icon(
                      Icons.person,
                      size: 100,
                      color: AppColors.cyan,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
