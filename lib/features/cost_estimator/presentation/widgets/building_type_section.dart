import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme.dart';
import '../bloc/cost_estimator_bloc.dart';
import '../bloc/cost_estimator_event.dart';
import '../bloc/cost_estimator_state.dart';

class BuildingTypeSection extends StatelessWidget {
  const BuildingTypeSection({super.key});

  static const List<Map<String, String>> _types = [
    {'label': 'Home', 'icon': 'assets/icons/home.png'},
    {'label': 'Apartment', 'icon': 'assets/icons/apartments.png'},
    {'label': 'Villa', 'icon': 'assets/icons/villas.png'},
    {'label': 'Commercial', 'icon': 'assets/icons/commercial.png'},
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
                'What Are Your Building ?',
                style: AppTheme.outfitFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textCharcoal,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: List.generate(_types.length, (i) {
                  final isSelected = state.selectedBuildingType == i;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => context
                          .read<CostEstimatorBloc>()
                          .add(SelectBuildingTypeEvent(i)),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: i < _types.length - 1 ? 8 : 0,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 4),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.crimsonRed.withValues(alpha: 0.06)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.crimsonRed
                                : AppTheme.borderGrey,
                            width: isSelected ? 1.5 : 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              _types[i]['icon']!,
                              width: 36,
                              height: 36,
                              fit: BoxFit.contain,
                              errorBuilder: (ctx, err, st) => Icon(
                                Icons.home_outlined,
                                color: isSelected
                                    ? AppTheme.crimsonRed
                                    : AppTheme.textGrey,
                                size: 32,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _types[i]['label']!,
                              textAlign: TextAlign.center,
                              style: AppTheme.outfitFont.copyWith(
                                fontSize: 11,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                color: isSelected
                                    ? AppTheme.crimsonRed
                                    : AppTheme.textCharcoal,
                              ),
                            ),
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
