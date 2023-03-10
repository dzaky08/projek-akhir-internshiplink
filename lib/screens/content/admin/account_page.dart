import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/screens/auth/login_screen.dart';
import 'package:internshiplink/screens/content/admin/editprofile_page.dart';
import '../../../services/auth_service.dart';

class AccountAdmin extends StatefulWidget {
  const AccountAdmin({super.key});

  @override
  State<AccountAdmin> createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<AccountAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(0),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: const BoxDecoration(color: EVColor.primary),
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/profile3.jpeg',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'admin',
                    style: TextStyle(color: EVColor.neutral10, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const ProfileAdmin();
                          }));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.neutral20,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.person_outline,
                              color: EVColor.secondary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Profile Saya',
                              style: TextStyle(color: EVColor.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.neutral20,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.notifications_none_outlined,
                              color: EVColor.secondary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Notifikasi',
                              style: TextStyle(color: EVColor.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.neutral20,
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.lock_outline,
                              color: EVColor.secondary,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Keamanan',
                              style: TextStyle(color: EVColor.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          NavigatorState navigator = Navigator.of(context);

                          bool result = await AuthService().logout();

                          if (result) {
                            navigator.pushReplacement(
                              MaterialPageRoute(
                                builder: (_) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.neutral20,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  NavigatorState navigator =
                                      Navigator.of(context);

                                  bool result = await AuthService().logout();

                                  if (result) {
                                    navigator.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  color: EVColor.neutral100,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () async {
                                  NavigatorState navigator =
                                      Navigator.of(context);

                                  bool result = await AuthService().logout();

                                  if (result) {
                                    navigator.pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => const LoginScreen(),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(color: EVColor.neutral100),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
