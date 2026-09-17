import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // 1. Profile Picture (Far Left)
          ClipOval(
                child: Image.asset(
                  'assets/images/person1.png',
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.person,
                      color: AppTheme.primary,
                    );
                  },
                ),
              ),
            
            SizedBox(width: 12),
            // 2. Logo (Next to Profile)
            Image.asset(
              'assets/images/logo.png',
              // width: 100,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Text(
                  'VSPARK',
                  style: AppTheme.outfitFont.copyWith(
                    color: AppTheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                );
              },
            ),
            
            const Spacer(),
            
           
              // 3. Notification Button
              GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notifications clicked')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.notifications_none_outlined,
                  color: Color(0xFF252525),
                  size: 25,
                ),
              ),
            ),


            // 4. Call Button
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Call clicked')),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.phone_outlined,
                  color: Color(0xFF252525),
                  size: 25,
                ),
              ),
            ),
            
          
          ],
        ),
      ),
    );
  }
}
