import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/intern_model.dart';
import 'package:internshiplink/models/user_model.dart';
import 'package:internshiplink/services/intern_service.dart';
import 'package:internshiplink/services/upload.dart';

class EditProfileIntern extends StatefulWidget {
  const EditProfileIntern({super.key});

  @override
  State<EditProfileIntern> createState() => _EditProfileInternState();
}

class _EditProfileInternState extends State<EditProfileIntern> {
  final ImagePicker picker = ImagePicker();

  File? imageFile;

  InternModel? internModel;

  void getIntern() async {
    GetStorage box = GetStorage();
    Map<String, dynamic> data = Map.from(await box.read('internData') as Map);

    InternModel internData = InternModel.fromJson(data);
    setState(() {
      internModel = internData;
      phonenumberController =
          TextEditingController(text: internData.phoneNumber);
      print(phonenumberController.text);
      schoolnameController = TextEditingController(text: internData.schoolName);
      vocationController = TextEditingController(text: internData.vocation);

      startdateController = TextEditingController(text: internData.startDate);

      finishdateController = TextEditingController(text: internData.finishDate);

      motorcyclebrandController =
          TextEditingController(text: internData.motorcycleBrand);

      motorcyclenumberplateController =
          TextEditingController(text: internData.motorcycleNumberPlate);

      schoolsupervisornameController =
          TextEditingController(text: internData.schoolSupervisorName);

      schoolsupervisornumberController =
          TextEditingController(text: internData.schoolSupervisorPhoneNumber);

      parentnameController = TextEditingController(text: internData.parentName);

      parentphonenumberController =
          TextEditingController(text: internData.parentPhoneNumber);

      birthplaceController = TextEditingController(text: internData.birthPlace);

      birthdateController = TextEditingController(text: internData.birthDate);

      religionController = TextEditingController(text: internData.religion);

      bloodtypeController = TextEditingController(text: internData.bloodType);

      addressController = TextEditingController(text: internData.address);

      identityController = TextEditingController(text: internData.identity);

      socialmediaController =
          TextEditingController(text: internData.socialMedia);

      congenitaldiseaseController =
          TextEditingController(text: internData.congenitalDisease);

      hobbiesController = TextEditingController(text: internData.hobbies);

      skillsController = TextEditingController(text: internData.skills);

      projekakhirController =
          TextEditingController(text: internData.projekAkhir);

      // selfiephoto = TextEditingController(text: internData.phoneNumber); internData.selfiePhoto;
    });
  }

  Future getImage(ImageSource media) async {
    XFile? img = await picker.pickImage(source: media);

    if (img != null) {
      setState(() {
        imageFile = File(img.path);
      });
    }
  }

  // String? phonenumber = '';
  // String? schoolname = '';
  // String? vocation = '';
  // String? startdate = '';
  // String? finishdate = '';
  // String? motorcyclebrand = '';
  // String? motorcycleplate = '';
  // String? schoolsupervisor = '';
  // String? schoolsupervisornumber = '';
  // String? parentname = '';
  // String? parentphonenumber = '';
  // String? birthplace = '';
  // String? birthdate = '';
  // String? religion = '';
  // String? bloodtype = '';
  // String? address = '';
  // String? identity = '';
  // String? socialmedia = '';
  // String? congenitaldisease = '';
  // String? hobbies = '';
  // String? skills = '';
  // String? projekakhir = '';
  // String? selfiephoto = '';
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
  // TextEditingController selfiephotoController = TextEditingController);
  TextEditingController socialmediaController = TextEditingController();
  TextEditingController congenitaldiseaseController = TextEditingController();
  TextEditingController hobbiesController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController projekakhirController = TextEditingController();

  // initTextField(InternModel internModel) {
  //   TextEditingController phonenumberController =
  //       TextEditingController(text: internModel.phoneNumber);
  //   TextEditingController schoolnameController =
  //       TextEditingController(text: internModel.schoolName);
  //   TextEditingController vocationController =
  //       TextEditingController(text: internModel.vocation);
  //   TextEditingController startdateController =
  //       TextEditingController(text: internModel.startDate);
  //   TextEditingController finishdateController =
  //       TextEditingController(text: internModel.finishDate);
  //   TextEditingController motorcyclebrandController =
  //       TextEditingController(text: internModel.motorcycleBrand);
  //   TextEditingController motorcyclenumberplateController =
  //       TextEditingController(text: internModel.motorcycleNumberPlate);
  //   TextEditingController schoolsupervisornameController =
  //       TextEditingController(text: internModel.schoolSupervisorName);
  //   TextEditingController schoolsupervisornumberController =
  //       TextEditingController(text: internModel.schoolSupervisorPhoneNumber);
  //   TextEditingController parentnameController =
  //       TextEditingController(text: internModel.parentName);
  //   TextEditingController parentphonenumberController =
  //       TextEditingController(text: internModel.parentPhoneNumber);
  //   TextEditingController birthplaceController =
  //       TextEditingController(text: internModel.birthPlace);
  //   TextEditingController birthdateController =
  //       TextEditingController(text: internModel.birthDate);
  //   TextEditingController religionController =
  //       TextEditingController(text: internModel.religion);
  //   TextEditingController bloodtypeController =
  //       TextEditingController(text: internModel.bloodType);
  //   TextEditingController addressController =
  //       TextEditingController(text: internModel.address);
  //   TextEditingController identityController =
  //       TextEditingController(text: internModel.identity);
  //   // TextEditingController selfiephotoController = TextEditingController(text: internModel.);
  //   TextEditingController socialmediaController =
  //       TextEditingController(text: internModel.socialMedia);
  //   TextEditingController congenitaldiseaseController =
  //       TextEditingController(text: internModel.congenitalDisease);
  //   TextEditingController hobbiesController =
  //       TextEditingController(text: internModel.hobbies);
  //   TextEditingController skillsController =
  //       TextEditingController(text: internModel.skills);
  //   TextEditingController projekakhirController =
  //       TextEditingController(text: internModel.projekAkhir);
  // }

  @override
  void initState() {
    getIntern();
    super.initState();
    // initTextField(internModel!);
  }

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
                      imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.file(
                                File(imageFile!.path),
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child:
                                  //Image.asset(
                                  // 'assets/images/profile3.jpeg',
                                  Image.network(
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
                      // XFile? imageXFile = await ImagePicker()
                      //     .pickImage(source: ImageSource.camera);

                      // if (imageXFile != null) {
                      //   setState(() {
                      //     imageFile = File(imageXFile.path);
                      //   });
                      // }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              title:
                                  const Text('Please choose media to select'),
                              content: SizedBox(
                                height: MediaQuery.of(context).size.height / 6,
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      //if user click this button, user can upload image from gallery
                                      onPressed: () {
                                        Navigator.pop(context);
                                        getImage(ImageSource.gallery);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.image),
                                          Text('From Gallery'),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      //if user click this button. user can upload image from camera
                                      onPressed: () {
                                        Navigator.pop(context);
                                        getImage(ImageSource.camera);
                                      },
                                      child: Row(
                                        children: const [
                                          Icon(Icons.camera),
                                          Text('From Camera'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
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
                          NavigatorState navigator = Navigator.of(context);
                          Map<String, dynamic> data =
                              Map.from(await box.read('userData') as Map);
                          UserModel userData = UserModel.fromJson(data);
                          String? path;
                          if (imageFile != null) {
                            path = await UploadService()
                                .uploadImageIntern(imageFile!);
                          } else {
                            path = internModel?.selfiePhoto;
                          }

                          print("Ini adalah link foto nya: ");
                          print(path);

                          if (phonenumberController.text.isNotEmpty &&
                              schoolnameController.text.isNotEmpty &&
                              vocationController.text.isNotEmpty &&
                              startdateController.text.isNotEmpty &&
                              finishdateController.text.isNotEmpty &&
                              motorcyclebrandController.text.isNotEmpty &&
                              motorcyclenumberplateController.text.isNotEmpty &&
                              schoolsupervisornameController.text.isNotEmpty &&
                              schoolsupervisornumberController
                                  .text.isNotEmpty &&
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
                            Map<String, dynamic>? result = await InternService()
                                .updateIntern(userID: userData.id!, data: {
                              'phoneNumber': phonenumberController.text,
                              'schoolName': schoolnameController.text,
                              'vocation': vocationController.text,
                              'startDate':
                                  DateTime.parse(startdateController.text)
                                      .toIso8601String(),
                              'finishDate':
                                  DateTime.parse(finishdateController.text)
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
                              'birthDate':
                                  DateTime.parse(birthdateController.text)
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
                              'projekAkhir': projekakhirController.text,
                              'selfiePhoto': path
                            });

                            if (result != null) {
                              await box.write('internData', result);

                              navigator.pop(true);
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

  _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper.platform.cropImage(
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    );
    if (croppedImage != null) {
      imageFile = croppedImage as File?;
      setState(() {});
    }
  }
}
