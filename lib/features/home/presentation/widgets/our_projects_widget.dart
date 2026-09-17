import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class OurProjectsWidget extends StatelessWidget {
  const OurProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 3 Projects mapping design & built images
    final List<Map<String, String>> projects = [
      {
        'location': 'Sanga Reddy',
        'city': 'Hyderabad',
        'design': 'assets/images/design1.png',
        'reality': 'assets/images/building1.png',
      },
      {
        'location': 'Ghatkesar',
        'city': 'Hyderabad',
        'design': 'assets/images/design2.png',
        'reality': 'assets/images/building2.png',
      },
      {
        'location': 'Kondapur',
        'city': 'Hyderabad',
        'design': 'assets/images/desing3.png', // matches typo 'desing3.png'
        'reality': 'assets/images/building3.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Our Projects',
                style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('View All Projects clicked')),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'View All',
                      style: AppTheme.outfitFont.copyWith(
                        color: AppTheme.crimsonRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Horizontal scrolling list
          SizedBox(
            height: 157,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final proj = projects[index];
                return Container(
                  width: 180,
                  margin: const EdgeInsets.only(right: 16),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppTheme.borderGrey.withOpacity(0.5),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Double Image Card (Design vs Reality)
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.borderGrey.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Row(
                            children: [
                              // Left Image (Design)
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        proj['design']!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: AppTheme.bgSurface,
                                                child: const Icon(
                                                  Icons.architecture,
                                                  color: AppTheme.primary,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                    // "Design" Tag
                                    Positioned(
                                      left: 6,
                                      top: 6,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          'DESIGN',
                                          style: AppTheme.outfitFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Vertical Divider line
                              Container(width: 1, color: Colors.white),
                              // Right Image (Reality/Built)
                              Expanded(
                                child: Stack(
                                  children: [
                                    Positioned.fill(
                                      child: Image.asset(
                                        proj['reality']!,
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                color: AppTheme.bgSurface,
                                                child: const Icon(
                                                  Icons.home,
                                                  color: AppTheme.primary,
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                    // "Built" Tag
                                    Positioned(
                                      right: 6,
                                      top: 6,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.successGreen
                                              .withOpacity(0.85),
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Text(
                                          'REALITY',
                                          style: AppTheme.outfitFont.copyWith(
                                            color: Colors.white,
                                            fontSize: 8,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Location texts
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(width: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                proj['location']!,
                                style: AppTheme.outfitFont.copyWith(
                                  color: AppTheme.textCharcoal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                proj['city']!,
                                style: AppTheme.outfitFont.copyWith(
                                  color: AppTheme.textGrey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppTheme.crimsonRed,
                                width: 0.5,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size:10,
                              color: AppTheme.crimsonRed,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
