import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class WhyVsparkWidget extends StatelessWidget {
  const WhyVsparkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'On-Time Delivery',
        'icon': Icons.access_time_filled,
        'bgColor': AppTheme.crimsonRed,
      },
      {
        'title': 'Quality',
        'icon': Icons.verified,
        'bgColor': AppTheme.successGreen,
      },
      {
        'title': 'Safe Transactions',
        'icon': Icons.security,
        'bgColor': const Color(0xFFFAB906), // Gold yellow
      },
    ];

    return Container(
      width: double.infinity,
                          margin:const EdgeInsets.symmetric(horizontal:16),

      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration:  BoxDecoration(
        color: AppTheme.whiteOverlay,
        borderRadius:BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          // Section Heading
          Text(
            'Why VSPARK',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 1),
          // Subtitle
          Text(
            'Built on trust, delivered with care',
            style: AppTheme.outfitFont.copyWith(
              color: AppTheme.textGrey,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          
          // Row of columns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: features.map((feat) {
              return Expanded(
                child: Column(
                  children: [
                    // Icon container - Square 44x44, rx=8, solid background
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: feat['bgColor'],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        feat['icon'],
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Title label
                    Text(
                      feat['title'],
                      textAlign: TextAlign.center,
                      style: AppTheme.outfitFont.copyWith(
                        color: AppTheme.textCharcoal,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
