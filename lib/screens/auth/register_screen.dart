import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/models/models.dart';
import 'package:internshiplink/screens/auth/login_screen.dart';
import 'package:internshiplink/services/auth_service.dart';
import '../../component/ev_typography.dart';
import 'insert_data.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isHidePassword = true;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
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
                top: 10,
              ),
              width: double.infinity,
              child: Image.asset('assets/images/SignUp.png', fit: BoxFit.cover),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 25, 10, 20),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.60,
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
                      alignment: Alignment.topCenter,
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        'Create Account',
                        style: EVTypography.bold.copyWith(fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: EVColor.neutral20,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: EVColor.neutral80)),
                      child: TextFormField(
                        controller: fullnameController,
                        autofocus: false,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Nama Lengkap',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: EVColor.neutral20,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: EVColor.neutral80)),
                      child: TextFormField(
                        controller: emailController,
                        autofocus: false,
                        obscureText: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: EVColor.neutral20,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                          border: Border.all(color: EVColor.neutral80)),
                      child: TextFormField(
                        controller: passwordController,
                        autofocus: false,
                        obscureText: _isHidePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                _togglePasswordVisibility();
                              },
                              icon: Icon(_isHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.check_box_outline_blank),
                          ),
                          const Text(
                            'I agree to terms of service and privacy policy?',
                            style: TextStyle(
                              color: EVColor.neutral100,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          GetStorage box = GetStorage();

                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            bool result = await AuthService().signup(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              fullname: fullnameController.text,
                            );

                            if (result) {
                              Map<String, dynamic> data =
                                  Map.from(await box.read('userData') as Map);

                              UserModel userData = UserModel.fromJson(data);
                              print(userData.role);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const InsertIntern()));
                            } else {
                              print(null);
                            }
                          } else {
                            debugPrint(
                                'Username, Email dan Password Tidak Boleh Kosong!');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.primary,
                        ),
                        child: const Text(
                          'Sign Up',
                        ),
                      ),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'have an account?',
                            style: TextStyle(
                              color: EVColor.neutral100,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              },
                              child: const Text('login'))
                        ],
                      ),
                    )
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
