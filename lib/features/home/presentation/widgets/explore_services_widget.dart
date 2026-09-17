import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class ExploreServicesWidget extends StatelessWidget {
  const ExploreServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {
        'title': 'Home Construction',
        'icon': "home.png",
      },
      {
        'title': 'Apartment Construction',
        'icon': "apartments.png"
      },
      {
        'title': 'Villas Construction',
        'icon': "villas.png",
      },
      {
        'title': 'Commercial Buildings',
        'icon': "commercial.png",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Heading
          Text(
            'Explore Services',
            style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 16),
          
          // 4 Service Columns Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: services.map((srv) {
              return GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${srv['title']} ${srv['subtitle']} clicked')),
                  );
                },
                child: Container(
                  width: 85,
                  height: 126,
                  decoration: BoxDecoration(
                    color: AppTheme.bgSurface,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppTheme.borderGrey,
                      width: 0.3,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      // Inner 64x64 container for the icon
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppTheme.bgSurface,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.borderGrey,
                            width: 0.3,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/${srv['icon']}',
                            color: Colors.black,
                            width: 32,
                            height: 32,
                          ),
                        ),
                      ),
                      
                      // Label centered in the remaining height
                      Expanded(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                srv['title'],
                                textAlign: TextAlign.center,
                                style: AppTheme.outfitFont.copyWith(
                                  color: AppTheme.textCharcoal,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                ),
                              ),
                              
                            ],
                          ),
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
