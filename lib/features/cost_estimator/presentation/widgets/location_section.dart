import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme.dart';
import '../bloc/cost_estimator_bloc.dart';
import '../bloc/cost_estimator_event.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({super.key});

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focus = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(() => setState(() => _isFocused = _focus.hasFocus));
  }

  @override
  void dispose() {
    _controller.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Location',
            style: AppTheme.outfitFont.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textCharcoal,
            ),
          ),
          const SizedBox(height: 12),
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isFocused
                    ? AppTheme.crimsonRed
                    : AppTheme.borderGrey,
                width: _isFocused ? 1.5 : 1,
              ),
            ),
            child: Row(
              children: [
                const SizedBox(width: 14),
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                  color: _isFocused
                      ? AppTheme.crimsonRed
                      : AppTheme.textGrey,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focus,
                    style: AppTheme.outfitFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.textCharcoal,
                    ),
                    decoration: InputDecoration(
                      hintText: 'e.g. Lippal, Hyderabad',
                      hintStyle: AppTheme.outfitFont.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppTheme.textGrey.withValues(alpha: 0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onChanged: (val) => context
                        .read<CostEstimatorBloc>()
                        .add(ChangeLocationEvent(val)),
                    textInputAction: TextInputAction.done,
                  ),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
