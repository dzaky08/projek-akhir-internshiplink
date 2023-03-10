import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/screens/content/detail_intern.dart';

import '../../models/supervisor_model.dart';

class DetailSupervisor extends StatelessWidget {
  const DetailSupervisor({
    required this.supervisorModel,
    super.key,
  });

  final SupervisorModel supervisorModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('profile Supervisor'),
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
                  Text(
                    supervisorModel.user!.name,
                    style: TextStyle(color: EVColor.neutral10, fontSize: 18),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const Text('social media :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.socialMedia)),
                  const SizedBox(height: 10),
                  const Text('hobi :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.hobbies)),
                  const SizedBox(height: 10),
                  const Text('edukasi :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.educations)),
                  const SizedBox(height: 10),
                  const Text('pengalaman kerja :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.workExperiences)),
                  const SizedBox(height: 10),
                  const Text('nomor telpon :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.phoneNumber)),
                  const SizedBox(height: 10),
                  const Text('alamat :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.address)),
                  const Text('skill :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.skills)),
                  const Text('posisi :'),
                  if (supervisorModel.interns != null)
                    Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.position)),
                  const SizedBox(height: 10),
                  const Text('Deskripsi :'),
                  Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: EVColor.neutral50)),
                      child: Text(supervisorModel.description)),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  if (supervisorModel.interns != null)
                    const Text('Daftar Intern yang di bimbing'),
                  SizedBox(
                    height: 10,
                  ),
                  if (supervisorModel.interns != null)
                    Wrap(
                      children: List.generate(
                        supervisorModel.interns!.length,
                        (i) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailIntern(
                                internModel: supervisorModel.interns![i],
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              if (supervisorModel.interns!.isNotEmpty)
                                Wrap(
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.amber),
                                        width:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        height:
                                            (MediaQuery.of(context).size.width -
                                                    40) /
                                                4,
                                        margin: const EdgeInsets.only(right: 5),
                                        child: Center(
                                          child: Text('$i'),
                                          // child: Image.network(
                                          //   supervisorModel
                                          //       .interns![i].selfiePhoto,
                                          //   fit: BoxFit.cover,
                                          // )
                                        )),
                                  ],
                                )
                              else
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber,
                                  ),
                                  child: Center(
                                    child: Text('$i'),
                                  ),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              if (supervisorModel.interns!.isNotEmpty)
                                Wrap(
                                  children: [
                                    Text(supervisorModel.interns![i].user!.name)
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
