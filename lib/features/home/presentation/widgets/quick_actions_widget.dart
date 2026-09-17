import 'package:flutter/material.dart';
import '../../../../core/theme.dart';
import '../../../cost_estimator/presentation/pages/cost_estimator_page.dart';

class QuickActionsWidget extends StatelessWidget {
  const QuickActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the quick actions list
    final List<Map<String, dynamic>> actions = [
      {
        'title': 'Blogs &\nArticles',
        'icon': "blogs.png",

      },
      {
        'title': 'Cost\nEstimator',
        'icon': "cost.png",
   // Light green tint
      },
      {
        'title': 'Designs',
        'icon': "designs.png",
   // Light amber tint
      },
      {
        'title': 'Elevations',
        'icon': "elevations.png",
      // Light blue tint
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Quick Actions',
                style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Build Journey clicked')),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Build Journey',
                      style: AppTheme.outfitFont.copyWith(
                        color: AppTheme.crimsonRed,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                   
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          // Row of Columns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start  ,
            children: actions.map((act) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (act['title'] == 'Cost\nEstimator') {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CostEstimatorPage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '${act['title'].replaceAll('\n', ' ')} clicked')),
                      );
                    }
                  },
                  child: Column(
                    children: [
                      // Circular Icon Container (64x64, fill #F6F6F6, border #D1D1D1)
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppTheme.bgSurface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppTheme.borderGrey,
                            width: 0.3,
                          ),
                        ),
                        child: Image.asset(
                          'assets/icons/${act['icon']}',
                          color: AppTheme.textCharcoal,
                          width: 26,
                          height: 26,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Text Label
                      Text(
                        act['title'],
                        textAlign: TextAlign.center,
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textCharcoal,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
