import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../Global/constant.dart';
import '../UI/Metrimonial_mainpage.dart';
import '../UI/mainpage.dart';
import '../UI/notificaition.dart';
import '../UI/yourprofile.dart';
import 'edit_main.dart';

class profile_edit extends StatefulWidget {
  @override
  _profile_editState createState() => _profile_editState();
}

class _profile_editState extends State<profile_edit> {
  XFile? _image;
  CroppedFile? croppedFile;
  String? url;

  @override
  void initState() {
    super.initState();
    data_function();
  }

  var gender = "";
  var name = "";
  var password = "";
  var id = "";

  List data = [];
  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      id = data[0];
      name = data[1];
      password = data[2];
      gender = data[3];
    }
    setState(() {
      print(gender);
    });

    var collection = FirebaseFirestore.instance
        .collection(gender)
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password);
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      var documentID = snapshot.id;
      print(documentID);
      Map<String, dynamic> data = snapshot.data();
      var name = data['name'];
      if (documentID != '') {
        url = data['profile_image'];
      }
      setState(() {});
      print(url);
    }
  }

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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
//              height: MediaQuery.of(context).size.height*0.15,
              color: AppColor.purple,
              child: new Wrap(
                children: <Widget>[
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
                  new ListTile(
                    leading: new Icon(CupertinoIcons.camera_circle,
                        color: AppColor.purple),
                    title: new Text(
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

        var collection_1 = FirebaseFirestore.instance.collection(gender);
        collection_1
            .doc(id) // <-- Doc ID where data should be updated.
            .update({'profile_image': url}) // <-- Nested value
            .then((_) {
          update_Message();

          print("updating");

          Get.offAll(mainpage());
          Get.to(matrimonial_mainpage());
          Get.to(yourprofile());
          Get.to(edit_main());
        }).catchError((error) {
          not_update_Message();
        });

//        Navigator.push(context,MaterialPageRoute(builder: (context) => id_card_screen(url),));

//          print(url);
      }).catchError((onError) {
        not_update_Message();

        print(onError);
      });
//      return url;
    } else {
      print("Empty");
      return "";
    }
//    }
  }

  Widget build(BuildContext context) {
//    Stream<List<Caste>> getcaste()=>FirebaseFirestore.instance.collection('Caste').
//    snapshots().map((event) => event.docs.map((e) => Caste.fromJson(e.data())
//    ).toList());

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
                                color: AppColor.purple,
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
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Face Image".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColor.purple,
                      fontSize: 24.0,
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

              //              CircleAvatar(
//                radius: MediaQuery.of(context).size.height * 0.1,
//                backgroundImage: AssetImage("Assets/images/user.png"),
//                backgroundColor: Colors.transparent,
//                child: Stack(children: [
//                  GestureDetector(
//                    onTap: () {
//                      _showPicker(context);
//                    },
//                    child: Align(
//                      alignment: Alignment.bottomRight,
//                      child: CircleAvatar(
//                        radius: 18,
//                        backgroundColor: Colors.white70,
//                        child: Icon(
//                          Icons.camera_alt_outlined,
//                          color:  AppColor.purple,
//                        ),
//                      ),
//                    ),
//                  ),
//                ]),
//              ) :

              (url != null)
                  ? (_image == null)
                      ? CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.1,
                          backgroundImage: NetworkImage(url!),
//                backgroundImage: FileImage(_image),
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
                                    color: AppColor.purple,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                      : CircleAvatar(
                          radius: MediaQuery.of(context).size.height * 0.1,
//                backgroundImage: NetworkImage(url),
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
                                    color: AppColor.purple,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColor.purple,
                    )),

              Spacer(),

              GestureDetector(
                onTap: () async {
                  upload_image();
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.purple,
                          concolor,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        'Update'.toUpperCase(),
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
