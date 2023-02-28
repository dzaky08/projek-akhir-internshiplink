import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/screens/auth/login_screen.dart';
import 'package:internshiplink/screens/content/profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountUser extends StatefulWidget {
  const AccountUser({super.key});

  @override
  State<AccountUser> createState() => _AccountUserState();
}

class _AccountUserState extends State<AccountUser> {
  Future<void> _signOut() async {
    // await supabase.auth.signOut();
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (_) => LoginScreen()), (route) => false);
  }

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
                    'Abdullah Musyaffa',
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
                            return const Profile();
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
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('konfirmasi'),
                            content:
                                const Text('Yakin ingin keluar dari akun?'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: _signOut,
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: EVColor.neutral20,
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('konfirmasi'),
                                        content: const Text(
                                            'Yakin ingin keluar dari akun?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: _signOut,
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    ),
                                icon: const Icon(
                                  Icons.logout_outlined,
                                  color: EVColor.neutral100,
                                )),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                                onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text('Konfirmasi'),
                                        content: const Text(
                                            'Yakin ingin keluar dari akun?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: _signOut,
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    ),
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
