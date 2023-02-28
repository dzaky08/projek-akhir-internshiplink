import 'package:flutter/material.dart';
import 'package:internshiplink/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString("email");
  print(email);

  await Supabase.initialize(
    url: 'https://alugtuykheujjvjwetfc.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFsdWd0dXlraGV1amp2andldGZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzQ1NDM1MjMsImV4cCI6MTk5MDExOTUyM30.JPl5RPqPizEykKrTin7TR5sVsRffcThhSmNlsxNWciA',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntershipLink',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
