import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internshiplink/component/ev_color.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  XFile? image;

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
            title: Text('Please choose media to select'),
            content: Container(
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
                      children: [
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
                      children: [
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
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(border: Border.all(color: EVColor.neutral60)),
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
              ],
            ),
            Container(
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Isi Captionnya njink!',
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
            ElevatedButton(
              onPressed: () {
                myAlert();
              },
              child: const Text('Upload file'),
            ),
            const SizedBox(
              height: 10,
            ),
            //if image not null show the image
            //if image null show text
          ],
        ),
      ),
    );
  }
}
