import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internshiplink/component/ev_typography.dart';
import 'package:internshiplink/home_screen.dart';
import 'package:internshiplink/models/models.dart';

import '../../component/ev_color.dart';
import '../../services/intern_service.dart';

class InsertIntern extends StatefulWidget {
  const InsertIntern({super.key});

  @override
  State<InsertIntern> createState() => _InsertInternState();
}

class _InsertInternState extends State<InsertIntern> {
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController schoolnameController = TextEditingController();
  TextEditingController vocationController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController finishdateController = TextEditingController();
  TextEditingController motorcyclebrandController = TextEditingController();
  TextEditingController motorcyclenumberplateController =
      TextEditingController();
  TextEditingController schoolsupervisornameController =
      TextEditingController();
  TextEditingController schoolsupervisornumberController =
      TextEditingController();
  TextEditingController parentnameController = TextEditingController();
  TextEditingController parentphonenumberController = TextEditingController();
  TextEditingController birthplaceController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController bloodtypeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController identityController = TextEditingController();
  TextEditingController selfiephotoController = TextEditingController();
  TextEditingController socialmediaController = TextEditingController();
  TextEditingController congenitaldiseaseController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController projekakhirController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                          child: Image.asset(
                            'assets/images/profile3.jpeg',
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
                  const Positioned(
                      left: 74,
                      top: 90,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: EVColor.neutral10,
                        radius: 13,
                      )),
                  Positioned(
                    left: 74,
                    top: 80,
                    right: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt,
                        color: EVColor.secondary,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Text(
                  'masukkan data',
                  style: EVTypography.bold.copyWith(fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('NIS'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: identityController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'di isi oleh nis',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nomor Telpon'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: phonenumberController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '+62 8888888888',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nama Sekolah'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: schoolnameController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SMKN 2 sukabumi',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Jurusan'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: vocationController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Rekayasa Perangkat Lunak',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Tanggal Mulai'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: startdateController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DD/MM/YY',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );
                            startdateController.text = pickedDate.toString();
                          },
                          icon: const Icon(Icons.date_range_outlined))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Tanggal Selesai'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: finishdateController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DD/MM/YY',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );
                            finishdateController.text = pickedDate.toString();
                          },
                          icon: const Icon(Icons.date_range_outlined))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Brand Motor'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: motorcyclebrandController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Beat',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('plat nomor motor'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: motorcyclenumberplateController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'F 09723 LUL',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nama Supervisor Sekolah'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: schoolsupervisornameController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'elon musk',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nomor Telpon Supervisor Sekolah'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: schoolsupervisornumberController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '+62 888888888',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nama Orang Tua'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: parentnameController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Mark Z',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Nomor Telpon Orang Tua'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: parentphonenumberController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '+62 888888888',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Tempat Lahir'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: birthplaceController,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Bandung',
                      suffixIcon: IconButton(
                          onPressed: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2099),
                            );
                            birthdateController.text = pickedDate.toString();
                          },
                          icon: const Icon(Icons.date_range_outlined))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Tanggal Lahir'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: birthdateController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DD/MM/YY',
                      suffixIcon: Icon(Icons.date_range_outlined)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Agama'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: religionController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Islam/kristen/budha/hindu DLL',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Golongan Darah'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: bloodtypeController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'A',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Alamat'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: addressController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Sosial Media'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: socialmediaController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'aku_123',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Penyakit Bawaan'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: congenitaldiseaseController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Hobi'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: hobbiesController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('skills'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: skillsController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Judul projek akhir'),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: EVColor.neutral20,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(color: EVColor.neutral80)),
                child: TextFormField(
                  controller: projekakhirController,
                  autofocus: false,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: '',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    GetStorage box = GetStorage();
                    Map<String, dynamic> data =
                        Map.from(await box.read('userData') as Map);
                    UserModel userData = UserModel.fromJson(data);

                    if (phonenumberController.text.isNotEmpty &&
                        schoolnameController.text.isNotEmpty &&
                        vocationController.text.isNotEmpty &&
                        startdateController.text.isNotEmpty &&
                        finishdateController.text.isNotEmpty &&
                        motorcyclebrandController.text.isNotEmpty &&
                        motorcyclenumberplateController.text.isNotEmpty &&
                        schoolsupervisornameController.text.isNotEmpty &&
                        schoolsupervisornumberController.text.isNotEmpty &&
                        parentnameController.text.isNotEmpty &&
                        parentphonenumberController.text.isNotEmpty &&
                        birthplaceController.text.isNotEmpty &&
                        birthdateController.text.isNotEmpty &&
                        religionController.text.isNotEmpty &&
                        bloodtypeController.text.isNotEmpty &&
                        addressController.text.isNotEmpty &&
                        identityController.text.isNotEmpty &&
                        // selfiephotoController.text.isNotEmpty &&
                        socialmediaController.text.isNotEmpty &&
                        congenitaldiseaseController.text.isNotEmpty &&
                        hobbiesController.text.isNotEmpty &&
                        skillsController.text.isNotEmpty &&
                        projekakhirController.text.isNotEmpty) {
                      bool result = await InternService()
                          .updateIntern(userID: userData.id!, data: {
                        'phoneNumber': phonenumberController.text,
                        'schoolName': schoolnameController.text,
                        'vocation': vocationController.text,
                        'startDate': DateTime.parse(
                                '${startdateController.text}T00:00:00')
                            .toIso8601String(),
                        'finishDate': DateTime.parse(
                                '${finishdateController.text}T00:00:00')
                            .toIso8601String(),
                        'motorcycleBrand': motorcyclebrandController.text,
                        'motorcycleNumberPlate':
                            motorcyclenumberplateController.text,
                        'schoolSupervisorName':
                            schoolsupervisornameController.text,
                        'schoolSupervisorPhoneNumber':
                            schoolsupervisornumberController.text,
                        'parentName': parentnameController.text,
                        'parentPhoneNumber': parentphonenumberController.text,
                        'birthPlace': birthplaceController.text,
                        'birthDate': DateTime.parse(
                                '${birthdateController.text}T00:00:00')
                            .toIso8601String(),
                        'religion': religionController.text,
                        'bloodType': bloodtypeController.text,
                        'address': addressController.text,
                        'identity': identityController.text,
                        // 'selfiePhoto': selfiephotoController.text,
                        'socialMedia': socialmediaController.text,
                        'congenitalDisease': congenitaldiseaseController.text,
                        'hobbies': hobbiesController.text,
                        'skills': skillsController.text,
                        'projekAkhir': projekakhirController.text
                      });

                      if (result) {
                        Map<String, dynamic> data =
                            Map.from(await box.read('userData') as Map);

                        UserModel userData = UserModel.fromJson(data);
                        print(userData.role);

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      } else {
                        print('gagal memasukkan data!');
                      }
                    } else {
                      debugPrint('pastikan semua data terisi');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: EVColor.primary,
                  ),
                  child: const Text(
                    'Kirim',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
