import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';

class TrendingDesignsWidget extends StatefulWidget {
  const TrendingDesignsWidget({super.key});

  @override
  State<TrendingDesignsWidget> createState() => _TrendingDesignsWidgetState();
}

class _TrendingDesignsWidgetState extends State<TrendingDesignsWidget> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 6 Trending designs with varying data
    final List<Map<String, dynamic>> designs = [
      {
        'image': 'assets/images/3d/3dbuilding1.png',
        'sqft': '875 sq. ft.',
        'type': '2 BHK',
        'floors': 'Ground Floor',
        'budget': '17.50 lacs',
      },
      {
        'image': 'assets/images/3d/3dbuilding2.png',
        'sqft': '1,250 sq. ft.',
        'type': '3 BHK',
        'floors': 'G + 1 Floor',
        'budget': '26.80 lacs',
      },
      {
        'image': 'assets/images/3d/3dbuilding3.png',
        'sqft': '1,800 sq. ft.',
        'type': '4 BHK',
        'floors': 'Duplex G+1',
        'budget': '42.50 lacs',
      },
      {
        'image': 'assets/images/3d/3dbuilding4.png',
        'sqft': '950 sq. ft.',
        'type': '2 BHK',
        'floors': 'Ground Floor',
        'budget': '19.20 lacs',
      },
      {
        'image': 'assets/images/3d/3dbuilding5.png',
        'sqft': '1,500 sq. ft.',
        'type': '3 BHK',
        'floors': 'G + 1 Floor',
        'budget': '32.00 lacs',
      },
      {
        'image': 'assets/images/3d/3dbuilding6.png',
        'sqft': '2,400 sq. ft.',
        'type': '5 BHK',
        'floors': 'Triplex G+2',
        'budget': '65.00 lacs',
      },
    ];

    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final activeIndex = state.trendingPageIndex;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Heading
              Text(
                'Trending Designs',
                style: AppTheme.lightTheme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),

              // Slide Card Container
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 240,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (idx) {
                        context.read<HomeBloc>().add(
                          ChangeTrendingPageEvent(idx),
                        );
                      },
                      itemCount: designs.length,
                      itemBuilder: (context, index) {
                        final item = designs[index];
                        return Container(
                          width: double.infinity,
                          height: 240,
                          margin: const EdgeInsets.symmetric(horizontal: 8),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppTheme.borderGrey.withOpacity(0.4),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.02),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                // Left column (Specs)
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Badge
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppTheme.bgSurface,
                                          borderRadius: BorderRadius.circular(
                                            30,
                                          ),
                                        ),
                                        child: Text(
                                          '3D Design',
                                          style: AppTheme.outfitFont.copyWith(
                                            color: AppTheme.blackBrown,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      // Specs bottom
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Area',
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.crimsonRed,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            item['sqft'],
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.textCharcoal,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Type',
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.crimsonRed,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            item['type'],
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.textCharcoal,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                // Center Column (3D Image - Square, Increased Size, Transparent Background)
                                Expanded(
                                  flex: 4,
                                  child: Center(
                                    child: SizedBox(
                                      height: 180,
                                      width: 208,
                                      child: Image.asset(
                                        item['image'],
                                        fit: BoxFit.contain,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return const Icon(
                                                Icons.home_outlined,
                                                size: 80,
                                                color: AppTheme.primary,
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                ),

                                // Right Column (Specs)
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Floors',
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.crimsonRed,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            item['floors'],
                                            textAlign: TextAlign.end,
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.textCharcoal,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Est budget',
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.crimsonRed,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            item['budget'],
                                            textAlign: TextAlign.end,
                                            style: AppTheme.outfitFont.copyWith(
                                              color: AppTheme.textCharcoal,
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(designs.length, (idx) {
                        final isActive = idx == activeIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: isActive ? 12 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isActive
                                ? AppTheme.crimsonRed
                                : AppTheme.dividerGrey,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),

              // Page Indicators Row
            ],
          ),
        );
      },
    );
  }
}
