import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../../Global/constant.dart';
import '../notificaition.dart';
import 'contact_password_screen.dart';

class full_body_image_screen extends StatefulWidget {
  @override
  String profile_url;
  String id_card_url;
  full_body_image_screen(this.profile_url, this.id_card_url);

  _full_body_image_screenState createState() => _full_body_image_screenState();
}

class _full_body_image_screenState extends State<full_body_image_screen> {
  @override
  XFile? _image;
  CroppedFile? croppedFile;
  String? url;

  _imgFromCamera() async {
    File image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50)) as File;
    // if (image == null) {
    //   return;
    // }

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
//                      color: appcolor,
//                      ),
//                      title: new Text('Photo Library',
//                      style: TextStyle(
//                        color: appcolor,
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
              builder: (context) => contact_password_screen(
                  widget.profile_url, widget.id_card_url, url!),
            ));
        // Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: name_password_screen(widget.profile_url,widget.id_card_url,url),));

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
    return BaseScaffold(
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
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Upload Full body Image".toUpperCase(),
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
              SizedBox(
                height: 5.0,
              ),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Stading view Image".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: appcolor,
                      fontSize: 18.0,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
              ),
              _image == null
                  ? GestureDetector(
                      onTap: () {
                        _imgFromCamera();
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
//                    border: Border.all(color: appcolor,width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                "Assets/images/full_body.png",
                              ),
                              colorFilter:
                                  ColorFilter.mode(appcolor, BlendMode.srcIn),
                              fit: BoxFit.fill,
                            )),
                        child: Stack(children: [
                          GestureDetector(
                            onTap: () {
                              _imgFromCamera();
//                      _showPicker(context);
                            },
                            child: const Align(
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
                    )
                  : GestureDetector(
                      onTap: () {
                        _imgFromCamera();
                      },
                      child: Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            border: Border.all(color: appcolor, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: FileImage(File(_image!.path)),
                            )),
                        child: Stack(children: [
                          GestureDetector(
                            onTap: () {
                              _imgFromCamera();
//                      _showPicker(context);
                            },
                            child: const Align(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
