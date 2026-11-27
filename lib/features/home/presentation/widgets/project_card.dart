
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final String githubUrl;
  final List<String> technologies;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.githubUrl,
    required this.technologies,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  Future<void> _openGithub() async {
    final uri = Uri.tryParse(widget.githubUrl);

    if (uri == null || !uri.hasAuthority) {
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
            content: Text('Could not open GitHub repository.'),
          ),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Unable to open GitHub repository.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 25 * (1 - value)),
            child: child,
          ),
        );
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          transform: Matrix4.identity()
            ..translateByDouble(
              0.0,
              isHovered ? -6.0 : 0.0,
              0.0,
              1.0,
            )
            ..scaleByDouble(
              isHovered ? 1.02 : 1.0,
              isHovered ? 1.02 : 1.0,
              1.0,
              1.0,
            ),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isHovered
                  ? AppColors.cyan
                  : AppColors.border,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(
                  alpha: isHovered ? 0.25 : 0.12,
                ),
                blurRadius: isHovered ? 20 : 10,
                offset: Offset(0, isHovered ? 10 : 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Image
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    width: double.infinity,
                    child: AnimatedScale(
                      scale: isHovered ? 1.06 : 1.0,
                      duration: const Duration(milliseconds: 350),
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return Container(
                            color: AppColors.background,
                            child: const Center(
                              child: Icon(
                                Icons.image_not_supported_outlined,
                                size: 40,
                                color: AppColors.cyan,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // Project Details
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          widget.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            height: 1.5,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Technology Tags
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: widget.technologies.map((tech) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                tech,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColors.cyan,
                                ),
                              ),
                            );
                          }).toList(),
                        ),

                        const Spacer(),

                        // GitHub Button
                        SizedBox(
                          width: double.infinity,
                          height: 36,
                          child: OutlinedButton.icon(
                            onPressed: _openGithub,
                            icon: const Icon(
                              Icons.code_rounded,
                              size: 17,
                            ),
                            label: const Text(
                              'View on GitHub',
                              style: TextStyle(fontSize: 12),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColors.cyan,
                              side: const BorderSide(
                                color: AppColors.cyan,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
