import 'package:flutter/material.dart';

import 'screens/landing_page.dart';
import 'theme/promo_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PromoApp());
}

class PromoApp extends StatelessWidget {
  const PromoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '소통사주 앱 출시 전 프로모',
      theme: PromoTheme.build(),
      home: const LandingPage(),
    );
  }
}
