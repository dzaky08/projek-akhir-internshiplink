import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/supervisor_model.dart';

import 'edit_profile_supervisor_page.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  SupervisorModel? supervisorModel;

  void getSupervisor() async {
    GetStorage box = GetStorage();
    Map<String, dynamic> data =
        Map.from(await box.read('supervisorData') as Map);

    SupervisorModel supervisorData = SupervisorModel.fromJson(data);
    setState(() {
      supervisorModel = supervisorData;
    });
  }

  @override
  void initState() {
    getSupervisor();
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
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: const BoxDecoration(color: EVColor.primary),
              child: Column(
                children: [
                  if (supervisorModel != null)
                    Wrap(
                      children: [
                        ClipRRect(
                          child: Image.network(
                            'https://alugtuykheujjvjwetfc.supabase.co/storage/v1/object/public/${supervisorModel!.photo}.png',
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const EditProfileSupervisor()));
                            },
                            icon: const Icon(Icons.edit_outlined)),
                      ],
                    ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (supervisorModel?.user?.id != null)
                    Text(supervisorModel!.user!.name)
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
                  const SizedBox(height: 10),
                  const Text('social media :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.socialMedia)),
                  const SizedBox(height: 10),
                  const Text('hobi :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.hobbies)),
                  const SizedBox(height: 10),
                  const Text('edukasi :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.educations)),
                  const SizedBox(height: 10),
                  const Text('pengalaman kerja :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.workExperiences)),
                  const SizedBox(height: 10),
                  const Text('nomor telpon :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.phoneNumber)),
                  const SizedBox(height: 10),
                  const Text('alamat :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.address)),
                  const Text('skill :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.skills)),
                  const Text('posisi :'),
                  if (supervisorModel?.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel!.position)),
                  const SizedBox(height: 10),
                  const Text('Deskripsi :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(supervisorModel!.description)),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
