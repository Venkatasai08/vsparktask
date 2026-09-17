import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme.dart';
import '../bloc/cost_estimator_bloc.dart';
import '../bloc/cost_estimator_event.dart';
import '../bloc/cost_estimator_state.dart';

class ConstructionQualitySection extends StatelessWidget {
  const ConstructionQualitySection({super.key});

  static const List<Map<String, dynamic>> _qualities = [
    {
      'title': 'Standard',
      'price': '₹1200 / sq.ft',
      'tag': 'Incl.GST',
      'bullets': [
        'Steel- Kamdhenu or Prime gold',
        'Cement- Dalmia',
        '20mm & 40mm',
      ],
    },
    {
      'title': 'Classic',
      'price': '₹1600 / sq.ft',
      'tag': 'Incl.GST',
      'bullets': [
        'Steel-Indus or Jindal Panther',
        'Cement- Dalmia',
        '20mm & 40mm',
      ],
    },
    {
      'title': 'Premium',
      'price': '₹1200 / sq.ft',
      'tag': 'Incl.GST',
      'bullets': [
        'Steel-Indus or Jindal Panther',
        'Cement- Ultra',
        '20mm & 40mm',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CostEstimatorBloc, CostEstimatorState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Construction Quality ?',
                style: AppTheme.outfitFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textCharcoal,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(_qualities.length, (i) {
                  final q = _qualities[i];
                  final isSelected = state.selectedQuality == i;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () => context
                          .read<CostEstimatorBloc>()
                          .add(SelectQualityEvent(i)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        margin: EdgeInsets.only(
                          right: i < _qualities.length - 1 ? 8 : 0,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 10),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.crimsonRed.withValues(alpha: 0.04)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.crimsonRed
                                : AppTheme.borderGrey,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Title
                            Text(
                              q['title'],
                              style: AppTheme.outfitFont.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: isSelected
                                    ? AppTheme.crimsonRed
                                    : AppTheme.textCharcoal,
                              ),
                            ),
                            const SizedBox(height: 2),
                            // Price
                            Text(
                              q['price'],
                              style: AppTheme.outfitFont.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textGrey,
                              ),
                            ),
                            // GST tag
                            Text(
                              q['tag'],
                              style: AppTheme.outfitFont.copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppTheme.textGrey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Bullet points
                            ...List<String>.from(q['bullets']).map((b) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 4),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '• ',
                                      style: AppTheme.outfitFont.copyWith(
                                        fontSize: 10,
                                        color: AppTheme.textGrey,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        b,
                                        style: AppTheme.outfitFont.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppTheme.textGrey,
                                          height: 1.3,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
