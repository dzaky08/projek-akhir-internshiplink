import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/models.dart';

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
        title: const Text('Detail Intern'),
        backgroundColor: EVColor.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Image.network(
                      'https://alugtuykheujjvjwetfc.supabase.co/storage/v1/object/public/${internModel.selfiePhoto}',
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    internModel.user!.name,
                    style:
                        const TextStyle(color: EVColor.neutral10, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (internModel.id != null) const Text('NIS :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.identity)),
                  const SizedBox(height: 10),
                  const Text('tempat lahir :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.birthPlace)),
                  const SizedBox(height: 10),
                  const Text('Tanggal Lahir :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.birthDate)),
                  const SizedBox(height: 10),
                  const Text('nomor telpon :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.phoneNumber)),
                  const SizedBox(height: 10),
                  const Text('sekolah :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.schoolName)),
                  const SizedBox(height: 10),
                  const Text('Jurusan :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.vocation)),
                  const SizedBox(height: 10),
                  const Text('tanggal mulai :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.startDate)),
                  const SizedBox(height: 10),
                  const Text('tanngal selesai :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.finishDate)),
                  const SizedBox(height: 10),
                  const Text('brand motor :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.motorcycleBrand)),
                  const SizedBox(height: 10),
                  const Text('plat nomor motor :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.motorcycleNumberPlate)),
                  const SizedBox(height: 10),
                  const Text('nama pembimbing sekolah :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.schoolSupervisorName)),
                  const SizedBox(height: 10),
                  const Text('nomor telpon supervisor :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.schoolSupervisorPhoneNumber)),
                  const SizedBox(height: 10),
                  const Text('parent name :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.parentName)),
                  const SizedBox(height: 10),
                  const Text('nomor telpon orang tua :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.parentPhoneNumber)),
                  const SizedBox(height: 10),
                  const Text('agama :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.religion)),
                  const SizedBox(height: 10),
                  const Text('golongan darah :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.bloodType)),
                  const SizedBox(height: 10),
                  const Text('alamat :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.address)),
                  const SizedBox(height: 10),
                  const Text('social media :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.socialMedia)),
                  const SizedBox(height: 10),
                  const Text('penyakit bawaan :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.congenitalDisease)),
                  const SizedBox(height: 10),
                  const Text('hobi :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.hobbies)),
                  const SizedBox(height: 10),
                  const Text('skill :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.skills)),
                  const SizedBox(height: 10),
                  const Text('judul projek akhir :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(internModel.projekAkhir)),
                  const SizedBox(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
