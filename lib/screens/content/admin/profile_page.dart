import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';

class ProfileAdmin extends StatelessWidget {
  const ProfileAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
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
                  const Text(
                    'Abdullah Musyaffa',
                    style: TextStyle(color: EVColor.neutral100),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              width: double.infinity,
              child: const Text(
                'Data User',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      )),
    );
  }
}
