import 'package:flutter/material.dart';

import '../../models/intern_model.dart';

class DetailIntern extends StatelessWidget {
  final InternModel internModel;

  const DetailIntern({
    required this.internModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('profile Supervisor'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  children: [
                    const Text('Nama :'),
                    Text(internModel.identity),
                    const SizedBox(height: 10),
                    const Text('Deskripsi :'),
                    Text(internModel.birthPlace),
                    Text(internModel.birthDate),
                    Text(internModel.religion),
                    Text(internModel.bloodType),
                    Text(internModel.vocation),
                    Text(internModel.hobbies),
                    Text(internModel.address),
                    const SizedBox(height: 10),
                    const Text('Lainnya :'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
