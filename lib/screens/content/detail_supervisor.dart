import 'package:flutter/material.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Nama :'),
              if (supervisorModel.user != null)
                Wrap(
                  children: [
                    Text(supervisorModel.user!.name),
                  ],
                ),
              const SizedBox(height: 10),
              const Text('Deskripsi :'),
              Text(supervisorModel.description),
              const SizedBox(height: 10),
              const Text('Lainnya :'),
              const SizedBox(height: 20),
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
                                    width: (MediaQuery.of(context).size.width -
                                            58) /
                                        3,
                                    height: (MediaQuery.of(context).size.width -
                                            58) /
                                        3,
                                    margin: const EdgeInsets.only(right: 5),
                                    child: Image.network(
                                      supervisorModel.interns![i].selfiePhoto,
                                      fit: BoxFit.cover,
                                    )),
                              ],
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
