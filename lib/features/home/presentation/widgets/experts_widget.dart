import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class ExpertsWidget extends StatelessWidget {
  const ExpertsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 3 Experts configuration — matching PNG exactly
    final List<Map<String, dynamic>> experts = [
      {
        'name': 'Ar. Vikram',
        'role': 'Project Manager',
        'yearsExp': '12+',
        'projects': '45',
        'image': 'assets/images/person2.png',
      },
      {
        'name': 'CH. Sarah',
        'role': 'Architect',
        'yearsExp': '10+',
        'projects': '35',
        'image': 'assets/images/person2.png',
      },
      {
        'name': 'k. S',
        'role': 'Site...',
        'yearsExp': '15+',
        'projects': '60',
        'image': 'assets/images/person2.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Text(
            'Our Experts',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),

          // Horizontally scrollable expert cards
          SizedBox(
            height: 148,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: experts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final exp = experts[index];
                return ExpertCardItem(expert: exp);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ExpertCardItem extends StatelessWidget {
  final Map<String, dynamic> expert;
  const ExpertCardItem({required this.expert});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.borderGrey.withOpacity(0.4),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: avatar + name + role
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular avatar
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppTheme.primary.withOpacity(0.3),
                    width: 1.5,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    expert['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppTheme.bgSurface,
                        child: const Icon(
                          Icons.person_outline,
                          color: AppTheme.primary,
                          size: 18,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 6),
              // Name + role
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      expert['name']!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTheme.outfitFont.copyWith(
                        color: AppTheme.textCharcoal,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      expert['role']!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: AppTheme.outfitFont.copyWith(
                        color: AppTheme.textGrey,
                        fontSize: 9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Stats row: YEARS EXP | Projects — wrapped in bgSurface pill
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.bgSurface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                // Years EXP
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expert['yearsExp']!,
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textCharcoal,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'YEARS EXP',
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textGrey,
                          fontSize: 7.5,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                // Vertical divider
                Container(
                  width: 1,
                  height: 24,
                  color: AppTheme.borderGrey,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                ),
                // Projects
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        expert['projects']!,
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textCharcoal,
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Projects',
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textGrey,
                          fontSize: 7.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // View profile — dark filled button with white text + border
          SizedBox(
            width: double.infinity,
            height: 28,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Profile of ${expert['name']}')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.blackBrown,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                elevation: 0,
                side: const BorderSide(
                  color: AppTheme.blackBrown,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                'View profile',
                style: AppTheme.outfitFont.copyWith(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
