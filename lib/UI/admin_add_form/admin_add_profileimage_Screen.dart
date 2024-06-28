import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metrimonialsullokupdated/Global/constant.dart';

import '../../Modal/castemodel.dart';
import '../notificaition.dart';
import 'admin_add_id_card_screen.dart';

class admin_add_profile_image_screen extends StatefulWidget {
  @override
  _admin_add_profile_image_screenState createState() =>
      _admin_add_profile_image_screenState();
}

class _admin_add_profile_image_screenState
    extends State<admin_add_profile_image_screen> {
  XFile? _image;
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
      _image = XFile(croppedFile!.path);
    });
  }

  _imgFromGallery() async {
    File image = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 50)) as File;

    if (image == null) {
      return;
    }

    croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
    );

    if (croppedFile == null) {
      return;
    }
    setState(() {
      _image = XFile(croppedFile!.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
//              height: MediaQuery.of(context).size.height*0.15,
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(
                        Icons.photo_library_outlined,
                        color: AppColor.purple,
                      ),
                      title: new Text(
                        'Photo Library',
                        style: TextStyle(
                          color: AppColor.purple,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w800,
                          fontSize: 16.0,
                        ),
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(CupertinoIcons.camera_circle,
                        color: AppColor.purple),
                    title: Text(
                      'Camera',
                      style: TextStyle(
                        color: AppColor.purple,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w800,
                        fontSize: 16.0,
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

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
              builder: (context) => admin_add_id_card_screen(url!),
            ));
//          Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child:admin_add_id_card_screen(url),));

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
    Stream<List<Caste>> getcaste() => FirebaseFirestore.instance
        .collection('Caste')
        .snapshots()
        .map((event) =>
            event.docs.map((e) => Caste.fromJson(e.data())).toList());

    return Scaffold(
      backgroundColor: light_pink,
      body: Padding(
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
              Material(
                elevation: 10.0,
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text(
                      "Upload Face Image".toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appcolor,
                        fontSize: 24.0,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
              ),
              _image == null
                  ? CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.1,
                      backgroundImage: AssetImage("Assets/images/user.png"),
                      backgroundColor: Colors.transparent,
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white70,
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: appcolor,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    )
                  : CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.1,
                      backgroundImage: FileImage(File(_image!.path)),
                      child: Stack(children: [
                        GestureDetector(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              radius: 18,
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
              Spacer(),
              GestureDetector(
                onTap: () async {
                  if (_image != null) {
                    upload_image();
//                    setState(() {});
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
                          concolor,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
