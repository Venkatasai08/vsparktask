import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/header_widget.dart';
import '../widgets/promo_banner_widget.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/explore_services_widget.dart';
import '../widgets/trending_designs_widget.dart';
import '../widgets/why_vspark_widget.dart';
import '../widgets/our_projects_widget.dart';
import '../widgets/packages_widget.dart';
import '../widgets/experts_widget.dart';
import '../widgets/reviews_widget.dart';
import '../widgets/consultation_cta_widget.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const double _navBarHeight = 68.0;
  static const double _navBarBottomMargin = 16.0;
  static const double _navBarHorizontalMargin = 16.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        extendBody: true,
        body: BlocListener<HomeBloc, HomeState>(
          listenWhen: (prev, current) =>
              prev.showConsultationSuccess != current.showConsultationSuccess,
          listener: (context, state) {
            if (state.showConsultationSuccess) {
              context.read<HomeBloc>().add(const ResetConsultationSuccessEvent());
              showDialog(
                context: context,
                builder: (dialogCtx) => AlertDialog(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  title: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: AppTheme.successGreen,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Success',
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.textCharcoal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  content: Text(
                    'Thank you for your interest! One of our expert consultants from VSPARK will contact you shortly.',
                    style: AppTheme.outfitFont.copyWith(
                      color: AppTheme.textGrey,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(dialogCtx),
                      child: Text(
                        'Close',
                        style: AppTheme.outfitFont.copyWith(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final activeTab = state.navIndex;

              return Column(
                children: [
                  const HeaderWidget(),
                  Expanded(
                    child: Stack(
                      children: [
                        // ── Scrollable page content ──────────────────────────
                        activeTab == 0
                            ? RefreshIndicator(
                                color: AppTheme.primary,
                                onRefresh: () async {
                                  await Future.delayed(
                                      const Duration(milliseconds: 800));
                                },
                                child: SingleChildScrollView(
                                  physics: const AlwaysScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(
                                    bottom:
                                        _navBarHeight + _navBarBottomMargin + 12,
                                  ),
                                  child: const Column(
                                    children: [
                                      PromoBannerWidget(),
                                      QuickActionsWidget(),
                                      ExploreServicesWidget(),
                                      TrendingDesignsWidget(),
                                      WhyVsparkWidget(),
                                      OurProjectsWidget(),
                                      PackagesWidget(),
                                      ExpertsWidget(),
                                      ReviewsWidget(),
                                      ConsultationCtaWidget(),
                                    ],
                                  ),
                                ),
                              )
                            : _buildPlaceholderPage(activeTab),

                        // ── Floating glassmorphic bottom nav bar ─────────────
                        Positioned(
                          left: _navBarHorizontalMargin,
                          right: _navBarHorizontalMargin,
                          bottom: _navBarBottomMargin,
                          child: _buildFloatingNavBar(context, activeTab),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderPage(int tabIndex) {
    String title = '';
    String subtitle = '';
    IconData icon = Icons.info;

    switch (tabIndex) {
      case 1:
        title = 'My Projects';
        subtitle = 'Keep tracking your projects with VSPARK.';
        icon = Icons.home_work_outlined;
        break;
      case 2:
        title = 'My Documents';
        subtitle = 'All your project documents will appear here.';
        icon = Icons.folder_open_outlined;
        break;
      case 3:
        title = 'More Settings';
        subtitle = 'Explore more features and settings.';
        icon = Icons.grid_view_outlined;
        break;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 64, color: AppTheme.primary.withValues(alpha: 0.5)),
          const SizedBox(height: 16),
          Text(
            title,
            style: AppTheme.lightTheme.textTheme.headlineMedium?.copyWith(
              color: AppTheme.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTheme.outfitFont.copyWith(
              color: AppTheme.textGrey.withValues(alpha: 0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingNavBar(BuildContext context, int activeTab) {
    final List<Map<String, dynamic>> items = [
      {
        'label': 'Home',
        'icon': Icons.home_outlined,
        'activeIcon': Icons.home_filled,
      },
      {
        'label': 'My Projects',
        'icon': Icons.home_work_outlined,
        'activeIcon': Icons.home_work,
      },
      {
        'label': 'Documents',
        'icon': Icons.description_outlined,
        'activeIcon': Icons.description,
      },
      {
        'label': 'More',
        'icon': Icons.grid_view_outlined,
        'activeIcon': Icons.grid_view,
      },
    ];

    return SafeArea(
      top: false,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            height: _navBarHeight,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.4),
                width: 1.2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.10),
                  blurRadius: 24,
                  spreadRadius: 0,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.04),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (idx) {
                final item = items[idx];
                final isActive = idx == activeTab;

                return Expanded(
                  child: GestureDetector(
                    onTap: () =>
                        context.read<HomeBloc>().add(ChangeTabEvent(idx)),
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      // width: 80,
                      height: _navBarHeight,
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOutCubic,
                        // padding: const EdgeInsets.symmetric(
                        //   horizontal: 12,
                        //   vertical: 6,
                        // ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? AppTheme.crimsonRed.withValues(alpha: 0.12)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: Icon(
                                isActive
                                    ? item['activeIcon']
                                    : item['icon'],
                                key: ValueKey(isActive),
                                color: isActive
                                    ? AppTheme.crimsonRed
                                    : AppTheme.textGrey.withValues(alpha: 0.65),
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 3),
                            AnimatedDefaultTextStyle(
                              duration: const Duration(milliseconds: 200),
                              style: AppTheme.outfitFont.copyWith(
                                color: isActive
                                    ? AppTheme.crimsonRed
                                    : AppTheme.textGrey.withValues(alpha: 0.65),
                                fontSize: 10,
                                fontWeight: isActive
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                              child: Text(item['label']),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
