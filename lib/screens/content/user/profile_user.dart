import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:internshiplink/screens/content/user/edit_profile_intern_page.dart';

class ProfileIntern extends StatefulWidget {
  const ProfileIntern({
    super.key,
  });

  @override
  State<ProfileIntern> createState() => _ProfileInternState();
}

class _ProfileInternState extends State<ProfileIntern> {
  InternModel? internModel;

  void getIntern() async {
    GetStorage box = GetStorage();
    Map<String, dynamic> data = Map.from(await box.read('internData') as Map);

    InternModel internData = InternModel.fromJson(data);
    setState(() {
      internModel = internData;
    });
  }

  @override
  void initState() {
    getIntern();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: EVColor.primary,
        elevation: 0,
      ),
      body: internModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.2,
                        decoration: const BoxDecoration(color: EVColor.primary),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                'https://alugtuykheujjvjwetfc.supabase.co/storage/v1/object/public/${internModel?.selfiePhoto}',
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      // const Positioned(
                      //     left: 74,
                      //     top: 90,
                      //     right: 0,
                      //     child: CircleAvatar(
                      //       backgroundColor: EVColor.neutral10,
                      //       radius: 13,
                      //     )),
                      Positioned(
                        left: 300,
                        top: 0,
                        right: 0,
                        bottom: 0,
                        child: IconButton(
                          onPressed: () async {
                            print(0);
                            GetStorage box = GetStorage();
                            NavigatorState navigator = Navigator.of(context);
                            Map<String, dynamic> data =
                                Map.from(await box.read('userData') as Map);
                            print('1');
                            UserModel userData = UserModel.fromJson(data);
                            print(userData.role);
                            print('2');
                            //
                            bool? result = await navigator.push(
                                MaterialPageRoute(
                                    builder: (_) => const EditProfileIntern()));
                            if (result != null) {
                              setState(() {
                                getIntern();
                              });
                            }
                            //
                          },
                          icon: const Icon(
                            Icons.edit_outlined,
                            color: EVColor.neutral10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (internModel!.id != null) const Text('NIS :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.identity)),
                        const SizedBox(height: 10),
                        const Text('tempat lahir :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.birthPlace)),
                        const SizedBox(height: 10),
                        const Text('Tanggal Lahir :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.birthDate)),
                        const SizedBox(height: 10),
                        const Text('nomor telpon :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.phoneNumber)),
                        const SizedBox(height: 10),
                        const Text('sekolah :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.schoolName)),
                        const SizedBox(height: 10),
                        const Text('Jurusan :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.vocation)),
                        const SizedBox(height: 10),
                        const Text('tanggal mulai :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.startDate)),
                        const SizedBox(height: 10),
                        const Text('tanggal selesai :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.finishDate)),
                        const SizedBox(height: 10),
                        const Text('brand motor :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.motorcycleBrand)),
                        const SizedBox(height: 10),
                        const Text('plat nomor motor :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.motorcycleNumberPlate)),
                        const SizedBox(height: 10),
                        const Text('nama pembimbing sekolah :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.schoolSupervisorName)),
                        const SizedBox(height: 10),
                        const Text('nomor telpon supervisor :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child:
                                Text(internModel!.schoolSupervisorPhoneNumber)),
                        const SizedBox(height: 10),
                        const Text('parent name :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.parentName)),
                        const SizedBox(height: 10),
                        const Text('nomor telpon orang tua :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.parentPhoneNumber)),
                        const SizedBox(height: 10),
                        const Text('agama :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.religion)),
                        const SizedBox(height: 10),
                        const Text('golongan darah :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.bloodType)),
                        const SizedBox(height: 10),
                        const Text('alamat :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.address)),
                        const SizedBox(height: 10),
                        const Text('social media :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.socialMedia)),
                        const SizedBox(height: 10),
                        const Text('penyakit bawaan :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.congenitalDisease)),
                        const SizedBox(height: 10),
                        const Text('hobi :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.hobbies)),
                        const SizedBox(height: 10),
                        const Text('skill :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.skills)),
                        const SizedBox(height: 10),
                        const Text('judul projek akhir :'),
                        Container(
                            padding: const EdgeInsets.all(10),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: EVColor.neutral50)),
                            child: Text(internModel!.projekAkhir)),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            )),
    );
  }
}
