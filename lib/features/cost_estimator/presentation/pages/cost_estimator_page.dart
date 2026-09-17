import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme.dart';
import '../bloc/cost_estimator_bloc.dart';
import '../bloc/cost_estimator_event.dart';
import '../widgets/building_type_section.dart';
import '../widgets/plot_details_section.dart';
import '../widgets/construction_quality_section.dart';
import '../widgets/location_section.dart';

class CostEstimatorPage extends StatelessWidget {
  const CostEstimatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CostEstimatorBloc(),
      child: const _CostEstimatorView(),
    );
  }
}

class _CostEstimatorView extends StatelessWidget {
  const _CostEstimatorView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ── App Bar ──────────────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back,
            color: AppTheme.textCharcoal,
            size: 22,
          ),
        ),
        title: Text(
          'Cost Estimator',
          style: AppTheme.outfitFont.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppTheme.textCharcoal,
          ),
        ),
        titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppTheme.borderGrey.withValues(alpha: 0.5),
          ),
        ),
      ),

      // ── Floating "Calculate Estimate" button on Z-axis ───────────────
      // Scaffold renders floatingActionButton above the body on the Z-axis
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              context
                  .read<CostEstimatorBloc>()
                  .add(const CalculateEstimateEvent());
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calculating your estimate…')),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.crimsonRed,
              foregroundColor: Colors.white,
              // Shadow gives visual depth confirming it's on the Z-axis
              elevation: 6,
              shadowColor: AppTheme.crimsonRed.withValues(alpha: 0.45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Calculate Estimate',
                  style: AppTheme.outfitFont.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),

      // ── Body: purely scrollable content, no button in the flow ───────
      body: SingleChildScrollView(
        // Bottom padding so last card isn't hidden behind the floating button
        padding: const EdgeInsets.only(bottom: 96),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            BuildingTypeSection(),
            PlotDetailsSection(),
            ConstructionQualitySection(),
            LocationSection(),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
