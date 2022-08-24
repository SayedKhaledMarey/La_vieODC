import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

BoxDecoration boxDecoration() {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(
      color: Colors.green,
      width: 2,
    ),
    /* image: DecorationImage(
      image:
    ),*/
  );
}

Widget buildTextField() {
  const maxLines = 5;

  return Container(
    margin: const EdgeInsets.all(12),
    height: maxLines * 24.0,
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: "Enter a description here",
        fillColor: Colors.green[100],
        filled: true,
      ),
    ),
  );
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  File? _postImage;
  final _picker = ImagePicker();

  // Implementing the image picker
  Future<void> openImagePicker() async {
    final XFile? pickedImage =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _postImage = File(pickedImage.path);
      });
    }
    print('-------------------------------------------------------------');
    print(_postImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: const Text(
          'Create New Post',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print('upload photo to sever');
                      openImagePicker();
                      // setState(() {
                      //   print('dddddddddddddddddddddddddddddddddddddd');
                      //   Container(
                      //     alignment: Alignment.center,
                      //     width: 100,
                      //     height: 100,
                      //     color: Colors.grey[300],
                      //     child: _postImage != null
                      //         ? Image.file(_postImage!, fit: BoxFit.cover)
                      //         : const Text('Please select an image'),
                      //   );
                      // });
                      //-------------------------------------------------------
                    },
                    child: Center(
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(35),
                            child: Column(children: [
                              Container(
                                decoration: boxDecoration(),
                                alignment: Alignment.center,
                                width: 130,
                                height: 130,
                                child: _postImage != null
                                    ? Image.file(
                                    _postImage!, fit: BoxFit.fitWidth)
                                    : Column(
                                  children: const <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                                      child: Icon(Iconsax.add, size: 30,
                                        color: Colors.green,),
                                    ),
                                    SizedBox(height: 20,),
                                    Text('Add Photo', style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        )
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Title",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SizedBox(
                height: 40,
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Description",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            buildTextField(),

            Center(
              child: Container(
                  height: 60,
                  width: 400,
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: ElevatedButton(
                    child: const Text(
                      'Post',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      uploadpost(titleController.text.toString(),
                          descriptionController.text.toString(),
                      _postImage.toString());
                      //----------------------------------------------------

                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
  //----------------------------------------------------------------------------------------------

  Future<void> uploadpost(String title, String description,
      String photo,) async {
    try {
      var dio = Dio();
      final response = await dio.post(
          'https://lavie.orangedigitalcenteregypt.com/api/v1/forums',
          data: {
            'title': title,
            'description': description,
            'imageBase64': photo,
          });
      if (response.statusCode == 200) {
        print('----------------------------------------------');
        print('post upload successfully');
        print('-----------------------------------------------');
       // Navigator.pushNamed(context, 'listofplant');
      } else {
        print('filed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
