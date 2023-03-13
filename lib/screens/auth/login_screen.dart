import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/home_screen.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:internshiplink/screens/auth/register_screen.dart';
import 'package:internshiplink/home_admin.dart';
import 'package:internshiplink/services/auth_service.dart';

import '../../component/ev_typography.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isHidePassword = true;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EVColor.primary,
      body: SafeArea(
          child: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 30,
              ),
              width: double.infinity,
              child: Image.asset('assets/images/intro1.png', fit: BoxFit.cover),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                    24, MediaQuery.of(context).size.height * 0.035, 24, 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.50,
                decoration: const BoxDecoration(
                    color: EVColor.neutral10,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(33),
                      topRight: Radius.circular(33),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5,
                          MediaQuery.of(context).size.height * 0.029, 10, 10),
                      child: Text(
                        'LOGIN!',
                        style: EVTypography.bold.copyWith(fontSize: 20),
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter your Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'email'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please Enter your Password';
                        }
                        return null;
                      },
                      controller: passwordController,
                      obscureText: _isHidePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            _togglePasswordVisibility();
                          },
                          icon: Icon(
                            _isHidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          minHeight: 32,
                          minWidth: 32,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.check_box_outline_blank),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        const Text(
                          'Remember Me?',
                          style: TextStyle(
                            color: EVColor.neutral100,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xffe76969),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          GetStorage box = GetStorage();
                          NavigatorState navigator = Navigator.of(context);

                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            bool result = await AuthService().login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );

                            if (result) {
                              Map<String, dynamic> data =
                                  Map.from(await box.read('userData') as Map);

                              UserModel userData = UserModel.fromJson(data);
                              print(userData.role);

                              // TODO: kalo admin arahin ke mana?
                              if (userData.role == 'supervisor' ||
                                  userData.role == 'intern') {
                                navigator.pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const HomePage()),
                                    (route) => false);
                              } else {
                                // TODO: kalo intern dan supervisor arahin ke mana?
                                navigator.pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (_) => const HomePageAdmin()),
                                    (route) => false);
                              }
                            } else if (result == false) {
                              debugPrint('Email atau Password salah!');

                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        content: const Text(
                                            'Email atau Password salah!'),
                                      ));
                            }
                          } else {
                            debugPrint(
                                'Email dan Password Tidak Boleh Kosong!');
                            showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      content: const Text(
                                          'Email atau Password tidak boleh kosong!'),
                                    ));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.primary,
                        ),
                        child: const Text(
                          'Login',
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont have an account?',
                          style: TextStyle(
                            color: EVColor.neutral100,
                            fontSize: 12,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const RegisterPage()));
                            },
                            child: const Text('Sign Up'))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
