import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internshiplink/component/ev_color.dart';
import 'package:internshiplink/models/models.dart';
import 'package:internshiplink/services/post_service.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  XFile? image;

  TextEditingController captionController = TextEditingController();

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Please choose media to select'),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 70),
          decoration:
              BoxDecoration(border: Border.all(color: EVColor.neutral60)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    width: 100,
                  ),
                  IconButton(
                      onPressed: () {
                        //      GetStorage box = GetStorage();
                        // Map<String, dynamic> data =
                        //     Map.from(await box.read('postData') as Map);
                        // PostModel postData = PostModel.fromJson(data);

                        // if () {
                        //   bool result = await PostService()
                        //       .insertPost(data: );

                        //   if (result) {
                        //     Map<String, dynamic> data =
                        //         Map.from(await box.read('userData') as Map);

                        //     UserModel userData = UserModel.fromJson(data);
                        //     print(userData.role);

                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (_) => const HomePage()));
                        //   } else {
                        //     print('gagal memasukkan data!');
                        //   }
                        // } else {
                        //   debugPrint('pastikan semua data terisi');
                        // }
                      },
                      icon: const Icon(
                        Icons.send_outlined,
                        color: EVColor.primary,
                      )),
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  controller: captionController,
                  decoration: InputDecoration(
                    hintText: 'Isi captionnya yaa ^^',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.emoji_emotions_outlined),
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    height: 2.0,
                    color: Colors.black,
                  ),
                  maxLines: 7,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.18,
              ),
              image == null
                  ? ElevatedButton(
                      onPressed: () {
                        myAlert();
                      },
                      child: const Text('Upload file'),
                    )
                  : Image.file(File(image!.path)),
              const SizedBox(
                height: 50,
              ),

              //if image not null show the image
              //if image null show text
            ],
          ),
        ),
      ),
    );
  }
}
