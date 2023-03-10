import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';

class HomeAdmin extends StatelessWidget {
  const HomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: EVColor.neutral10),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: const BoxDecoration(color: EVColor.primary),
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
                        height: 5,
                      ),
                      const Text(
                        'admin',
                        style: TextStyle(color: EVColor.neutral10),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_applications_outlined,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('kelola Pengguna')
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Card(
                        child: Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_applications_outlined,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('kelola postingan')
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_applications_outlined,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('kelola Supervisor')
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings_applications_outlined,
                                size: 50,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text('kelola Data Intern')
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
