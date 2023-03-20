import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/home_admin.dart';
import 'package:internshiplink/models/user_model.dart';
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
    GetStorage box = GetStorage();

    Map<String, dynamic>? data = await box.read('userData') != null
        ? Map.from(await box.read('userData') as Map)
        : null;
    if (data != null) {
      await Future.delayed(const Duration(seconds: 2));
      if (_redirectCalled || !mounted) {
        return;
      }
      UserModel userData = UserModel.fromJson(data);

      _redirectCalled = true;
      final session = supabase.auth.currentSession;
      if (session != null && userData.role == 'intern' ||
          userData.role == 'supervisor') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePage(),
            ));
      } else if (session != null && userData.role == 'admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const HomePageAdmin(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const IntroductionScreen(),
            ));
      }
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

  // @override
  // void initState() {
  //   super.initState();
  //   startTimer();
  // }

  // startTimer() async {
  //   GetStorage box = GetStorage();

  //   Map<String, dynamic> data = Map.from(await box.read('userData') as Map);
  //   UserModel userData = UserModel.fromJson(data);

  //   await Future.delayed(const Duration(seconds: 3));

  //   final session = supabase.auth.currentSession;
  //   if (session != null && userData.role == 'intern' ||
  //       userData.role == 'supervisor') {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => const HomePage(),
  //         ));
  //   } else if (session != null && userData.role == 'admin') {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => const HomePageAdmin(),
  //         ));
  //   } else {
  //     Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => const IntroductionScreen(),
  //         ));
  //   }
  // }

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
