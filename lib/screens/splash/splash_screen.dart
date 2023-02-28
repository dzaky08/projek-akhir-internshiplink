import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/screens/introduction/introduction_screen.dart';

import '../../home_screen.dart';
import '../../supabase/supabase_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _redirectCalled = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(const Duration(seconds: 3));
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = supabase.auth.currentSession;
    if (session != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ));
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const IntroductionScreen(),
          ));
    }
  }

  @override
  void initState() {
    super.initState();
    _redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColor.primary,
      body: Center(
          child: Image.asset(
        'assets/images/logo1.png',
        height: 200,
        width: 200,
      )),
    );
  }
}
