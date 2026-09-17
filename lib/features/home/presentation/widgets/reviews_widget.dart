import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 3 Reviews configuration
    final List<Map<String, String>> reviews = [
      {
        'author': 'Bhargavi K.',
        'text': 'Highly Recommended VSPARK for Dream Home Construction. They delivered exactly what they promised with top-notch quality.',
        'image': 'assets/images/customer1.png',
        'rating': '5',
      },
      {
        'author': 'Ramesh G.',
        'text': 'The Design vs Reality match was incredible. Our house looks exactly like the 3D walkthrough they created!',
        'image': 'assets/images/customer2.png',
        'rating': '5',
      },
      {
        'author': 'Srinivas A.',
        'text': 'Extremely professional team, transparent transactions, and on-time delivery. Best constructors in Hyderabad.',
        'image': 'assets/images/customer3.png',
        'rating': '5',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Text(
            'Customer Reviews',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          
          // Horizontal scrolling reviews list
          SizedBox(
            height: 268,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final rev = reviews[index];
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1. Video Card (300x160)
                      Container(
                        width: 300,
                        height: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.borderGrey.withOpacity(0.3),
                            width: 1,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            children: [
                              // Background image
                              Positioned.fill(
                                child: Image.asset(
                                  rev['image']!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppTheme.bgSurface,
                                      child: const Icon(
                                        Icons.video_collection_outlined,
                                        color: AppTheme.primary,
                                        size: 40,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              // Dark translucent overlay
                              Positioned.fill(
                                child: Container(
                                  color: Colors.black.withOpacity(0.2),
                                ),
                              ),
                              
                              // Centered Play Button (57x57 with paint2_linear gradient)
                              Center(
                                child: Container(
                                  width: 57,
                                  height: 57,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: AppTheme.circleBadgeGradient,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ),
                              
                              // Bottom-right Duration Tag (16:30)
                              Positioned(
                                right: 12,
                                bottom: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    '16:30',
                                    style: AppTheme.outfitFont.copyWith(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      
                      // 2. Stars rating row
                      Row(
                        children: List.generate(5, (idx) {
                          return const Icon(
                            Icons.star,
                            color: Color(0xFFFAB906), // Gold yellow
                            size: 14,
                          );
                        }),
                      ),
                      const SizedBox(height: 6),
                      
                      // 3. Review text
                      Text(
                        rev['text']!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textCharcoal,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      // 4. Reviewer Author
                      Text(
                        '- ${rev['author']!}',
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
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
