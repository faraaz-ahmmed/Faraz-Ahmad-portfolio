
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final bool isMobile;
  final ValueChanged<String> onNavigate;

  const HomeHeader({
    super.key,
    required this.isMobile,
    required this.onNavigate,
  });

  static const List<String> navigationItems = [
    'Home',
    'About',
    'Skills',
    'Projects',
    'Education',
    'Experience',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'FA.',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.cyan,
            ),
          ),

          if (!isMobile)
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 20,
                runSpacing: 12,
                children: navigationItems.map((item) {
                  return _navItem(item);
                }).toList(),
              ),
            )
          else
            PopupMenuButton<String>(
              icon: const Icon(
                Icons.menu_rounded,
                color: AppColors.textPrimary,
                size: 30,
              ),
              color: AppColors.surface,
              onSelected: onNavigate,
              itemBuilder: (context) {
                return navigationItems.map((item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  );
                }).toList();
              },
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return InkWell(
      onTap: () => onNavigate(title),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
