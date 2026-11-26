
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final List<String> technologies;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.technologies,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

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
        onEnter: (_) {
          setState(() => isHovered = true);
        },
        onExit: (_) {
          setState(() => isHovered = false);
        },
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
                offset: Offset(
                  0,
                  isHovered ? 10 : 5,
                ),
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
                      duration:
                          const Duration(milliseconds: 350),
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
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
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
                        Expanded(
                          child: Text(
                            widget.description,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Technology Tags
                        Wrap(
                          spacing: 5,
                          runSpacing: 5,
                          children: widget.technologies.map((tech) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(
                                  alpha: 0.15,
                                ),
                                borderRadius:
                                    BorderRadius.circular(6),
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
