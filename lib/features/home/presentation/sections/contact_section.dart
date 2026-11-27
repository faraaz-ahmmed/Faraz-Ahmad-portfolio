
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  static const String email = 'farazahmad5623@gmail.com';

  static const String linkedIn =
      'https://www.linkedin.com/in/faraaz-ahmmed/';

  static const String github =
      'https://github.com/faraaz-ahmmed';

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  Future<void> _copyEmail() async {
    await Clipboard.setData(
      const ClipboardData(text: ContactSection.email),
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Email copied successfully!'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _openLink(String url) async {
    final uri = Uri.tryParse(url);

    if (uri == null || uri.scheme != 'https') {
      return;
    }

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not open the link.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Something went wrong while opening the link.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
            'Get In Touch',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: isMobile ? 30 : 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Let’s connect and build something amazing!',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 30),

          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 20 : 28),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF123B70),
                  Color(0xFF10264A),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: AppColors.cyan.withValues(alpha: 0.3),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.mail_rounded,
                  color: AppColors.cyan,
                  size: 38,
                ),
                const SizedBox(height: 16),

                const Text(
                  'Email Address',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),

                SelectableText(
                  ContactSection.email,
                  style: TextStyle(
                    color: AppColors.cyan,
                    fontSize: isMobile ? 14 : 17,
                  ),
                ),
                const SizedBox(height: 18),

                ElevatedButton.icon(
                  onPressed: _copyEmail,
                  icon: const Icon(Icons.copy_rounded),
                  label: const Text('Copy Email'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),

                const SizedBox(height: 28),
                const Divider(color: AppColors.border),
                const SizedBox(height: 20),

                const Text(
                  'Professional Profiles',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                _SocialLink(
                  icon: Icons.business_rounded,
                  title: 'LinkedIn',
                  subtitle: 'Connect with me professionally',
                  onTap: () => _openLink(ContactSection.linkedIn),
                ),

                const SizedBox(height: 14),

                _SocialLink(
                  icon: Icons.code_rounded,
                  title: 'GitHub',
                  subtitle: 'Explore my Flutter projects',
                  onTap: () => _openLink(ContactSection.github),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SocialLink extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SocialLink({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 2),
              Icon(
                icon,
                color: AppColors.cyan,
                size: 28,
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.open_in_new_rounded,
                color: AppColors.cyan,
                size: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
