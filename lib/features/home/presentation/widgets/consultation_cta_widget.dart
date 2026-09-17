import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';

class ConsultationCtaWidget extends StatelessWidget {
  const ConsultationCtaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36.0),
      decoration: BoxDecoration(
        color: AppTheme.bgSurface,
        border: Border(
          top: BorderSide(
            color: AppTheme.borderGrey.withOpacity(0.3),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Heading
          Text(
            'Ready to start ?',
            style: AppTheme.outfitFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppTheme.textCharcoal,
            ),
          ),
          const SizedBox(height: 12),
          // Subtitle
          Text(
            'Connect with our expert consultants Today for a\npersonalized Walkthrough',
            textAlign: TextAlign.center,
            style: AppTheme.outfitFont.copyWith(
              color: AppTheme.textGrey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          
          // Consultation Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                context.read<HomeBloc>().add(const BookConsultationEvent());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.crimsonRed,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Free Consultation',
                    style: AppTheme.outfitFont.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
