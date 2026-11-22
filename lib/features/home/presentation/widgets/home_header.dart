
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  final bool isMobile;

  const HomeHeader({
    super.key,
    required this.isMobile,
  });

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
            Wrap(
              spacing: 24,
              children: [
                _navItem('Home'),
                _navItem('About'),
                _navItem('Skills'),
                _navItem('Projects'),
                _navItem('Contact'),
              ],
            )
          else
            const Icon(
              Icons.menu,
              color: AppColors.textPrimary,
              size: 30,
            ),
        ],
      ),
    );
  }

  Widget _navItem(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.textSecondary,
        fontSize: 14,
      ),
    );
  }
}
