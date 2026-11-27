
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onBackToTop;

  const FooterSection({
    super.key,
    required this.onBackToTop,
  });

  static const String linkedIn =
      'https://www.linkedin.com/in/faraaz-ahmmed/';

  static const String github =
      'https://github.com/faraaz-ahmmed';

  Future<void> _openLink(
    BuildContext context,
    String url,
  ) async {
    final uri = Uri.tryParse(url);

    if (uri == null || uri.scheme != 'https') {
      return;
    }

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the link.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to open the link.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 600;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(
        top: 40,
        left: isMobile ? 0 : 20,
        right: isMobile ? 0 : 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 60,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0A1D3A),
        border: Border(
          top: BorderSide(
            color: AppColors.border,
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          if (isMobile)
            _buildMobileLayout(context)
          else
            _buildDesktopLayout(context),

          const SizedBox(height: 25),

          const Divider(
            color: AppColors.border,
            height: 1,
          ),

          const SizedBox(height: 20),

          Text(
            '© 2026 Faraz Ahmad. All rights reserved.',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Built with Flutter 💙',
            style: TextStyle(
              color: AppColors.cyan,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildBrand(),

        Row(
          children: [
            _SocialButton(
              icon: Icons.code_rounded,
              label: 'GitHub',
              onTap: () => _openLink(context, github),
            ),
            const SizedBox(width: 12),
            _SocialButton(
              icon: Icons.business_rounded,
              label: 'LinkedIn',
              onTap: () => _openLink(context, linkedIn),
            ),
            const SizedBox(width: 20),
            _BackToTopButton(
              onTap: onBackToTop,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBrand(),

        const SizedBox(height: 24),

        Wrap(
          alignment: WrapAlignment.center,
          spacing: 12,
          runSpacing: 12,
          children: [
            _SocialButton(
              icon: Icons.code_rounded,
              label: 'GitHub',
              onTap: () => _openLink(context, github),
            ),
            _SocialButton(
              icon: Icons.business_rounded,
              label: 'LinkedIn',
              onTap: () => _openLink(context, linkedIn),
            ),
          ],
        ),

        const SizedBox(height: 18),

        _BackToTopButton(
          onTap: onBackToTop,
        ),
      ],
    );
  }

  Widget _buildBrand() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Faraz Ahmad',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        const Text(
          'Flutter Developer',
          style: TextStyle(
            color: AppColors.cyan,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Building modern and user-friendly mobile applications.',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 17),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.cyan,
        side: const BorderSide(
          color: AppColors.border,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class _BackToTopButton extends StatelessWidget {
  final VoidCallback onTap;

  const _BackToTopButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: const Icon(
        Icons.keyboard_arrow_up_rounded,
        size: 20,
      ),
      label: const Text('Back to Top'),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.cyan,
      ),
    );
  }
}
