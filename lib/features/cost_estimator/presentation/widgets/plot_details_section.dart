import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme.dart';
import '../bloc/cost_estimator_bloc.dart';
import '../bloc/cost_estimator_event.dart';
import '../bloc/cost_estimator_state.dart';

class PlotDetailsSection extends StatelessWidget {
  const PlotDetailsSection({super.key});

  static const double _min = 250;
  static const double _max = 4000;

  static const List<String> _floors = ['G', 'G+1', 'G+2', 'G+3'];
  static const List<String> _facings = ['North', 'South', 'East', 'West'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CostEstimatorBloc, CostEstimatorState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section header
              Text(
                'Plot & Construction Details ?',
                style: AppTheme.outfitFont.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textCharcoal,
                ),
              ),
              const SizedBox(height: 12),

              // ── Plot Area Card ───────────────────────────────────────
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Plot Area',
                          style: AppTheme.outfitFont.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textGrey,
                          ),
                        ),
                        Text(
                          'Built-up per floor',
                          style: AppTheme.outfitFont.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    // Slider with house icon thumb via SliderTheme
                    SliderTheme(
                      data: SliderThemeData(
                        activeTrackColor: AppTheme.crimsonRed,
                        inactiveTrackColor:
                            AppTheme.borderGrey.withValues(alpha: 0.5),
                        trackHeight: 4,
                        thumbColor: AppTheme.crimsonRed,
                        thumbShape: _HouseThumbShape(),
                        overlayColor:
                            AppTheme.crimsonRed.withValues(alpha: 0.12),
                        overlayShape: const RoundSliderOverlayShape(
                            overlayRadius: 16),
                      ),
                      child: Slider(
                        value: state.plotArea,
                        min: _min,
                        max: _max,
                        divisions: 370,
                        onChanged: (val) => context
                            .read<CostEstimatorBloc>()
                            .add(ChangePlotAreaEvent(val)),
                      ),
                    ),

                    // Min/Max labels
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_min.toInt()}',
                          style: AppTheme.outfitFont.copyWith(
                            fontSize: 11,
                            color: AppTheme.textGrey,
                          ),
                        ),
                        Text(
                          '${_max.toInt()}',
                          style: AppTheme.outfitFont.copyWith(
                            fontSize: 11,
                            color: AppTheme.textGrey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // Sq.ft input field
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppTheme.borderGrey,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            '${state.plotArea.toInt()}',
                            style: AppTheme.outfitFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.textCharcoal,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Sq.ft',
                            style: AppTheme.outfitFont.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.textGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ── Number of Floors Card ────────────────────────────────
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Number of Floors',
                      style: AppTheme.outfitFont.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textGrey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: List.generate(_floors.length, (i) {
                        final isSelected = state.selectedFloor == i;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => context
                                .read<CostEstimatorBloc>()
                                .add(SelectFloorEvent(i)),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: EdgeInsets.only(
                                  right: i < _floors.length - 1 ? 8 : 0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppTheme.crimsonRed.withValues(alpha: 0.06)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? AppTheme.crimsonRed
                                      : AppTheme.borderGrey,
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _floors[i],
                                style: AppTheme.outfitFont.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppTheme.crimsonRed
                                      : AppTheme.textCharcoal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ── Facing Direction Card ────────────────────────────────
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Facing Direction',
                      style: AppTheme.outfitFont.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: AppTheme.textGrey,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: List.generate(_facings.length, (i) {
                        final isSelected = state.selectedFacing == i;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => context
                                .read<CostEstimatorBloc>()
                                .add(SelectFacingEvent(i)),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 180),
                              margin: EdgeInsets.only(
                                  right: i < _facings.length - 1 ? 8 : 0),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppTheme.crimsonRed.withValues(alpha: 0.06)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: isSelected
                                      ? AppTheme.crimsonRed
                                      : AppTheme.borderGrey,
                                  width: isSelected ? 1.5 : 1,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                _facings[i],
                                style: AppTheme.outfitFont.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppTheme.crimsonRed
                                      : AppTheme.textCharcoal,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderGrey, width: 1),
      ),
      child: child,
    );
  }
}

// Custom house-shaped thumb for the slider
class _HouseThumbShape extends SliderComponentShape {
  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) =>
      const Size(20, 20);

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;

    // Draw a red filled circle as the thumb
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? AppTheme.crimsonRed
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 10, paint);

    // White border ring
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, 10, borderPaint);

    // Draw a tiny house icon inside using TextPainter with emoji
    final tp = TextPainter(
      text: const TextSpan(
        text: '🏠',
        style: TextStyle(fontSize: 10),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset(center.dx - tp.width / 2, center.dy - tp.height / 2),
    );
  }
}
