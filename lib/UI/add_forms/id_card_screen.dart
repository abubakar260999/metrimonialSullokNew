import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../Global/constant.dart';
import '../notificaition.dart';
import 'full_body_image_screen.dart';

class id_card_screen extends StatefulWidget {
  @override
  String profile_url;
  id_card_screen(
    this.profile_url,
  );
  _id_card_screenState createState() => _id_card_screenState();
}

class _id_card_screenState extends State<id_card_screen> {
  @override
  File? _image;
  CroppedFile? croppedFile;
  String? url;

  _imgFromCamera() async {
    File image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50)) as File;
    if (image == null) {
      return;
    }

    croppedFile = await ImageCropper().cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1));

    if (croppedFile == null) {
      return;
    }

    setState(() {
      _image = File(croppedFile!.path);
    });
  }

//  _imgFromGallery() async {
//    File image = (await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 50)) as File;
//
//    if (image == null) {
//      return;
//    }
//
//    croppedFile = await ImageCropper.cropImage(
//        sourcePath: image.path,);
//
//    if (croppedFile == null) {
//      return;
//    }
//    setState(() {
//      _image = croppedFile;
//    });
//  }
//
//  void _showPicker(context) {
//    showModalBottomSheet(
//        context: context,
//        builder: (BuildContext bc) {
//          return SafeArea(
//            child: Container(
//              color: light_pink,
//              child: new Wrap(
//                children: <Widget>[
//                  new ListTile(
//                      leading: new Icon(Icons.photo_library_outlined,
//                      color: purple,
//                      ),
//                      title: new Text('Photo Library',
//                      style: TextStyle(
//                        color: purple,
//                        fontFamily: "poppins",
//                         fontWeight: FontWeight.w800,
//                        fontSize: 16.0,
//                      ),),
//                      onTap: () {
//                        _imgFromGallery();
//                        Navigator.of(context).pop();
//                      }),
//                  new ListTile(
//                    leading: new Icon(Icons.photo_camera_outlined
//                      ,color: appcolor,),
//                    title: new Text('Camera',
//                      style: TextStyle(
//                        color: appcolor,
//                        fontFamily: "poppins",
//                        fontWeight: FontWeight.w800,
//                        fontSize: 16.0,
//                      ),),
//                    onTap: () {
//                      _imgFromCamera();
//                      Navigator.of(context).pop();
//                    },
//                  ),
//                ],
//              ),
//            ),
//          );
//        });
//  }

  upload_image() async {
//    String url;
//    if (_image != null) {
    processing_Message();
    String image_name = _image!.path.split('/').last;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child("foldername/$image_name")
        .child("");
    //done url sending rahti hai
    if (croppedFile != null) {
      UploadTask uploadTask = reference.putFile(File(croppedFile!.path));
      uploadTask.whenComplete(() async {
        url = await reference.getDownloadURL();
        setState(() {});

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    full_body_image_screen(widget.profile_url, url!)));
        // Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child:  full_body_image_screen(widget.profile_url,url)));

//          print(url);
      }).catchError((onError) {
        print(onError);
      });
      return url;
    } else {
      print("Empty");
      return "";
    }
//    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: light_pink,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(100.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30.0,
                                  color: appcolor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.0,
                ),

                Container(
                  height: 220,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width,
                          child: Center(
                            child: Image.asset(
                              "Assets/images/half_id_card.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Upload right half Id card Image As Shown Above",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: appcolor,
                            fontSize: 20.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "Note: This Image is Only for Admin Use",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: appcolor,
                            fontSize: 15.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "No One will be able to See Or Use It",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: appcolor,
                            fontSize: 15.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                _image == null
                    ? GestureDetector(
                        onTap: () {
                          _imgFromCamera();
                        },
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: appcolor, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                image: AssetImage("Assets/images/id_card.png"),
                                scale: 1.0,
                                fit: BoxFit.cover,
                              )),
                          child: Stack(children: [
                            GestureDetector(
                              onTap: () {
                                _imgFromCamera();
//                        _showPicker(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: light_pink,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: appcolor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _imgFromCamera();
                        },
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(color: appcolor, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(_image!),
                              )),
                          child: Stack(children: [
                            GestureDetector(
                              onTap: () {
                                _imgFromCamera();
//                          _showPicker(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white70,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: appcolor,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),

//              SizedBox(
//                height: 50.0,
//              ),

                Spacer(),

                GestureDetector(
                  onTap: () async {
                    if (_image != null) {
                      upload_image();
                    } else {
                      image_Message();
                    }
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            appcolor,
                            AppColor.pink,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          'Next'.toUpperCase(),
                          style: TextStyle(
                              fontFamily: "poppins",
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Container(
//                height: 20.0,
//                width: 20.0,
                            child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                          size: 20.0,
                        )),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 30.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
