import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample Flutter App',
      debugShowCheckedModeBanner: true,
      theme: AppTheme.lightTheme,
      home: const HomePage(),
    );
  }
}
