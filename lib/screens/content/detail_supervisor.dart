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
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.23,
                decoration: BoxDecoration(color: EVColor.primary),
                child: Column(),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nama :'),
                    if (supervisorModel.user != null)
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: EVColor.neutral50)),
                          child: Text(supervisorModel.user!.name)),
                    const SizedBox(height: 10),
                    const Text('Deskripsi :'),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: EVColor.neutral50)),
                        child: Text(supervisorModel.description)),
                    const SizedBox(height: 10),
                    const Text('Lainnya :'),
                    const SizedBox(height: 20),
                    if (supervisorModel.interns != null)
                      const Text('Daftar Intern yang di bimbing'),
                    if (supervisorModel.interns != null)
                      Row(
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
                                          decoration: BoxDecoration(
                                              color: Colors.amber),
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  58) /
                                              3,
                                          height: (MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  58) /
                                              3,
                                          margin:
                                              const EdgeInsets.only(right: 5),
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
                                      Text(supervisorModel
                                          .interns![i].user!.name)
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
      ),
    );
  }
}
