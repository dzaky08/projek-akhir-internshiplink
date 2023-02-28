import 'package:flutter/material.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/screens/content/komentar.dart';
import '../../models/supervisor_model.dart';
import '../../services/intern_service.dart';
import '../../services/supervisor_service.dart';
import 'detail_supervisor.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<Map<String, dynamic>>? supervisors;
  List<Map<String, dynamic>>? interns;

  @override
  void initState() {
    super.initState();

    getSupervisors();
    getInterns();
  }

  Future getSupervisors() async {
    List<Map<String, dynamic>>? result =
        await SupervisorService().getSupervisors();

    if (result != null) {
      setState(() {
        supervisors = result;
      });
    }
  }

  Future getInterns() async {
    List<Map<String, dynamic>>? result = await InternService().getInterns();

    if (result != null) {
      setState(() {
        interns = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.13,
                child: Column(children: [
                  if (supervisors != null) const Text('Supervisors'),
                  if (supervisors != null)
                    Wrap(
                      children: List.generate(
                        supervisors!.length,
                        (i) {
                          SupervisorModel supervisorModel =
                              SupervisorModel.fromJson(supervisors![i]);

                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailSupervisor(
                                  supervisorModel: supervisorModel,
                                ),
                              ),
                            ),
                            child: Container(
                                width: 50,
                                height: 50,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amber,
                                ),
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    if (supervisorModel.interns != null)
                                      Image.network(supervisorModel
                                          .interns![i].selfiePhoto)
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                ])),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/images/profile2.jpeg",
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "fatih_slekbew",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/dots.png',
                                      height: 20,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'masa kecil yang kurindukan... jadi dewasa itu berat yaaaa.....',
                              style: TextStyle(color: EVColor.neutral100),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile4.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 15, right: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/images/like.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('Like'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/images/comment.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('comment'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const KomentarPage();
                                      }));
                                    },
                                    icon: const Icon(Icons.bookmark_outline),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('simpan'),
                                ],
                              ),
                            ),
                            Row(children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: const Text(
                                  'Fadly_well',
                                  style: TextStyle(
                                      color: EVColor.neutral100,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.65),
                                child: const Text(
                                  'awokawok, kocak mukanya kalo di jadiin pp grup',
                                  style: TextStyle(),
                                ),
                              ),
                            ]),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const KomentarPage()));
                                  },
                                  child: const Text(
                                    'Lihat Semua Komentar',
                                    style: TextStyle(
                                      color: EVColor.neutral60,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/images/profile2.jpeg",
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "fatih_slekbew",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/dots.png',
                                      height: 20,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'masa kecil yang kurindukan... jadi dewasa itu berat yaaaa.....',
                              style: TextStyle(color: EVColor.neutral100),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile4.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 15, right: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/images/like.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('Like'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/images/comment.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('comment'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const KomentarPage();
                                      }));
                                    },
                                    icon: const Icon(Icons.bookmark_outline),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('simpan'),
                                ],
                              ),
                            ),
                            Row(children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: const Text(
                                  'Fadly_well',
                                  style: TextStyle(
                                      color: EVColor.neutral100,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.65),
                                child: const Text(
                                  'awokawok, kocak mukanya kalo di jadiin pp grup',
                                  style: TextStyle(),
                                ),
                              ),
                            ]),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const KomentarPage()));
                                  },
                                  child: const Text(
                                    'Lihat Semua Komentar',
                                    style: TextStyle(
                                      color: EVColor.neutral60,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                    width: double.infinity,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.only(left: 20, right: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    "assets/images/profile2.jpeg",
                                    fit: BoxFit.cover,
                                    width: 40,
                                    height: 40,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "fatih_slekbew",
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 120,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      'assets/images/dots.png',
                                      height: 20,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'masa kecil yang kurindukan... jadi dewasa itu berat yaaaa.....',
                              style: TextStyle(color: EVColor.neutral100),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        'assets/images/profile4.jpeg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 1),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 5, left: 15, right: 10),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset('assets/images/like.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('Like'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        'assets/images/comment.png'),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('comment'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const KomentarPage();
                                      }));
                                    },
                                    icon: const Icon(Icons.bookmark_outline),
                                  ),
                                  const SizedBox(
                                    width: 1,
                                  ),
                                  const Text('simpan'),
                                ],
                              ),
                            ),
                            Row(children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: const Text(
                                  'Fadly_well',
                                  style: TextStyle(
                                      color: EVColor.neutral100,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                constraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.65),
                                child: const Text(
                                  'awokawok, kocak mukanya kalo di jadiin pp grup',
                                  style: TextStyle(),
                                ),
                              ),
                            ]),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              alignment: Alignment.topLeft,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const KomentarPage()));
                                  },
                                  child: const Text(
                                    'Lihat Semua Komentar',
                                    style: TextStyle(
                                      color: EVColor.neutral60,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
