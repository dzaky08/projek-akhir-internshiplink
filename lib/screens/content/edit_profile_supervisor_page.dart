import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:internshiplink/services/intern_service.dart';
import 'package:internshiplink/services/upload.dart';

class EditProfileSupervisor extends StatefulWidget {
  const EditProfileSupervisor({super.key});

  @override
  State<EditProfileSupervisor> createState() => _EditProfileSupervisorState();
}

class _EditProfileSupervisorState extends State<EditProfileSupervisor> {
  final ImagePicker picker = ImagePicker();

  File? imageFile;

  @override
  void initState() {
    getIntern();
    super.initState();
  }

  InternModel? internModel;

  void getIntern() async {
    GetStorage box = GetStorage();
    Map<String, dynamic> data = Map.from(await box.read('internData') as Map);

    InternModel internData = InternModel.fromJson(data);
    setState(() {
      internModel = internData;
    });
  }

  String? gender;

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

  // Future<void> _updateProfile() async {
  //   final user = supabase.auth.currentUser;
  //   final updates = {
  //     'id': user!.id,
  //     'updated_at': DateTime.now().toIso8601String(),
  //   };
  //   try {
  //     await supabase.from('profiles').upsert(updates);
  //     if (mounted) {
  //       context.showSnackBar(message: 'Successfully updated profile!');
  //     }
  //   } on PostgrestException catch (error) {
  //     context.showErrorSnackBar(message: error.message);
  //   } catch (error) {
  //     context.showErrorSnackBar(message: 'Unexpeted error occurred');
  //   }
  // }

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
                        child: imageFile != null
                            ? ClipRRect(
                                child: Image.file(
                                  File(imageFile!.path),
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
                              )
                            : ClipRRect(
                                child: Image.asset(
                                  'assets/images/profile3.jpeg',
                                  //   // Image.network(
                                  //   // 'https://alugtuykheujjvjwetfc.supabase.co/storage/v1/object/public/${internModel?.selfiePhoto}',
                                  fit: BoxFit.cover,
                                  height: 100,
                                  width: 100,
                                ),
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
                    onPressed: () async {
                      XFile? imageXFile = await ImagePicker()
                          .pickImage(source: ImageSource.camera);

                      if (imageXFile != null) {
                        setState(() {
                          imageFile = File(imageXFile.path);
                        });
                      }
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return AlertDialog(
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(8)),
                      //         title:
                      //             const Text('Please choose media to select'),
                      //         content: SizedBox(
                      //           height: MediaQuery.of(context).size.height / 6,
                      //           child: Column(
                      //             children: [
                      //               ElevatedButton(
                      //                 //if user click this button, user can upload image from gallery
                      //                 onPressed: () {
                      //                   Navigator.pop(context);
                      //                   getImage(ImageSource.gallery);
                      //                 },
                      //                 child: Row(
                      //                   children: const [
                      //                     Icon(Icons.image),
                      //                     Text('From Gallery'),
                      //                   ],
                      //                 ),
                      //               ),
                      //               ElevatedButton(
                      //                 //if user click this button. user can upload image from camera
                      //                 onPressed: () {
                      //                   Navigator.pop(context);
                      //                   getImage(ImageSource.camera);
                      //                 },
                      //                 child: Row(
                      //                   children: const [
                      //                     Icon(Icons.camera),
                      //                     Text('From Camera'),
                      //                   ],
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       );
                      // });
                      // XFile? imageXFile = await ImagePicker()
                      //     .pickImage(source: ImageSource.gallery);

                      // if (imageXFile != null) {
                      //   setState(() {
                      //     imageFile = File(imageXFile.path) as XFile?;
                      //   });
                      // }
                    },
                    icon: const Icon(
                      Icons.camera_alt,
                      color: EVColor.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('NIS'),
                    TextFormField(
                      controller: identityController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: internModel?.identity,
                          hintStyle:
                              const TextStyle(color: EVColor.neutral100)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nomor Telpon'),
                    TextFormField(
                      controller: phonenumberController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.phoneNumber,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nama Sekolah'),
                    TextFormField(
                      controller: schoolnameController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.schoolName,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Jurusan'),
                    TextFormField(
                      controller: vocationController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.vocation,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tanggal Mulai'),
                    TextFormField(
                      controller: startdateController,
                      autofocus: false,
                      obscureText: false,
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.startDate,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
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
                            icon: const Icon(Icons.date_range_outlined)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tanggal Selesai'),
                    TextFormField(
                      controller: finishdateController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: internModel?.finishDate,
                          hintStyle: const TextStyle(color: EVColor.neutral100),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2099),
                                );
                                finishdateController.text =
                                    pickedDate.toString();
                              },
                              icon: const Icon(Icons.date_range_outlined))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Brand Motor'),
                    TextFormField(
                      controller: motorcyclebrandController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.motorcycleBrand,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('plat nomor motor'),
                    TextFormField(
                      controller: motorcyclenumberplateController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.motorcycleNumberPlate,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nama Supervisor Sekolah'),
                    TextFormField(
                      controller: schoolsupervisornameController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.schoolSupervisorName,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nomor Telpon Supervisor Sekolah'),
                    TextFormField(
                      controller: schoolsupervisornumberController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.schoolSupervisorPhoneNumber,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nama Orang Tua'),
                    TextFormField(
                      controller: parentnameController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.parentName,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Nomor Telpon Orang Tua'),
                    TextFormField(
                      controller: parentphonenumberController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.parentPhoneNumber,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tempat Lahir'),
                    TextFormField(
                      controller: birthplaceController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.birthPlace,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Tanggal Lahir'),
                    TextFormField(
                      controller: birthdateController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: internModel?.birthDate,
                          hintStyle: const TextStyle(color: EVColor.neutral100),
                          suffixIcon: IconButton(
                              onPressed: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                birthdateController.text =
                                    pickedDate.toString();
                              },
                              icon: const Icon(Icons.date_range_outlined))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Agama'),
                    TextFormField(
                      controller: religionController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.religion,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Golongan Darah'),
                    TextFormField(
                      controller: bloodtypeController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.bloodType,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Alamat'),
                    TextFormField(
                      controller: addressController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.address,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Sosial Media'),
                    TextFormField(
                      controller: socialmediaController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.socialMedia,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Penyakit Bawaan'),
                    TextFormField(
                      controller: congenitaldiseaseController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.congenitalDisease,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Hobi'),
                    TextFormField(
                      controller: hobbiesController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.hobbies,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('skills'),
                    TextFormField(
                      controller: skillsController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.skills,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text('Judul projek akhir'),
                    TextFormField(
                      controller: projekakhirController,
                      autofocus: false,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: internModel?.projekAkhir,
                        hintStyle: const TextStyle(color: EVColor.neutral100),
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
                          String? path = await UploadService()
                              .uploadImageIntern(imageFile!);

                          print("Ini adalah link foto nya: ");
                          print(path);

                          if (phonenumberController.text.isNotEmpty ||
                              schoolnameController.text.isNotEmpty ||
                              vocationController.text.isNotEmpty ||
                              startdateController.text.isNotEmpty ||
                              finishdateController.text.isNotEmpty ||
                              motorcyclebrandController.text.isNotEmpty ||
                              motorcyclenumberplateController.text.isNotEmpty ||
                              schoolsupervisornameController.text.isNotEmpty ||
                              schoolsupervisornumberController
                                  .text.isNotEmpty ||
                              parentnameController.text.isNotEmpty ||
                              parentphonenumberController.text.isNotEmpty ||
                              birthplaceController.text.isNotEmpty ||
                              birthdateController.text.isNotEmpty ||
                              religionController.text.isNotEmpty ||
                              bloodtypeController.text.isNotEmpty ||
                              addressController.text.isNotEmpty ||
                              identityController.text.isNotEmpty ||
                              // selfiephotoController.text.isNotEmpty ||
                              socialmediaController.text.isNotEmpty ||
                              congenitaldiseaseController.text.isNotEmpty ||
                              hobbiesController.text.isNotEmpty ||
                              skillsController.text.isNotEmpty ||
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
                              'parentPhoneNumber':
                                  parentphonenumberController.text,
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
                              'congenitalDisease':
                                  congenitaldiseaseController.text,
                              'hobbies': hobbiesController.text,
                              'skills': skillsController.text,
                              'projekAkhir': projekakhirController.text
                            });

                            if (result) {
                              Map<String, dynamic> data =
                                  Map.from(await box.read('userData') as Map);

                              UserModel userData = UserModel.fromJson(data);
                              print(userData.role);
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
                          'Simpan Perubahan',
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      )),
    );
  }
}
