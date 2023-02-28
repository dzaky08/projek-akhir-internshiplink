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
              const Text('Nama :'),
              Text(internModel.user!.name),
              const SizedBox(height: 10),
              const Text('Deskripsi :'),
              Text(internModel.schoolName),
              const SizedBox(height: 10),
              const Text('Lainnya :'),
            ],
          ),
        ),
      ),
    );
  }
}
