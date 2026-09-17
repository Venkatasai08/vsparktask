import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class PackagesWidget extends StatelessWidget {
  const PackagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 3 Packages configurations
    final List<Map<String, dynamic>> packages = [
      {
        'name': 'Standard',
        'rate': '₹1,200',
        'isPremium': false,
        'features': [
          'Standard Vitrified Flooring',
          'Basic Electrical & Plumbing',
          'Normal Building Elevation',
          'Modular Kitchen Provision',
          '3 Years Structural Warranty',
        ],
      },
      {
        'name': 'Premium',
        'rate': '₹1,650',
        'isPremium': true,
        'features': [
          'Premium Flooring & Tiles',
          'Smart Home Provisions',
          'Designer Building Elevation',
          'Designer Modular Kitchen',
          '5 Years Structural Warranty',
        ],
      },
      {
        'name': 'Luxury',
        'rate': '₹2,100',
        'isPremium': false,
        'features': [
          'Italian Marble Flooring',
          'Smart Home Automation',
          'Modern Facade/Elevation',
          'Premium German Modular Kitchen',
          '10 Years Structural Warranty',
        ],
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Text(
            'Construction Packages',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          
          // Horizontal scrolling packages list
          SizedBox(
            height: 270,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: packages.length,
              itemBuilder: (context, index) {
                final pkg = packages[index];
                final isPrem = pkg['isPremium'] as bool;
                
                return Container(
                  width: 220,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: isPrem ? null : Colors.white,
                    gradient: isPrem ? AppTheme.packageGradient : null,
                    borderRadius: BorderRadius.circular(20),
                    border: isPrem
                        ? null
                        : Border.all(
                            color: AppTheme.borderGrey.withOpacity(0.4),
                            width: 1,
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(isPrem ? 0.1 : 0.02),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Package name & Rate
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pkg['name'],
                              style: AppTheme.outfitFont.copyWith(
                                color: isPrem ? Colors.white : AppTheme.textCharcoal,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: [
                                Text(
                                  pkg['rate'],
                                  style: AppTheme.outfitFont.copyWith(
                                    color: isPrem ? AppTheme.primary : AppTheme.primary,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  ' / sqft',
                                  style: AppTheme.outfitFont.copyWith(
                                    color: isPrem ? Colors.white.withOpacity(0.7) : AppTheme.textGrey,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                        // Features list
                        Column(
                          children: (pkg['features'] as List<String>).map((feat) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.check_circle_outline,
                                    color: isPrem ? Colors.white : AppTheme.primary,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      feat,
                                      style: AppTheme.outfitFont.copyWith(
                                        color: isPrem ? Colors.white.withOpacity(0.9) : AppTheme.textCharcoal,
                                        fontSize: 10.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                        
                        // Action Button
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Details for ${pkg['name']} package')),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: isPrem ? Colors.white : AppTheme.bgSurface,
                              borderRadius: BorderRadius.circular(30),
                              border: isPrem
                                  ? null
                                  : Border.all(
                                      color: AppTheme.primary.withOpacity(0.3),
                                      width: 1,
                                    ),
                            ),
                            child: Center(
                              child: Text(
                                'View Details',
                                style: AppTheme.outfitFont.copyWith(
                                  color: isPrem ? AppTheme.secondary : AppTheme.primary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
