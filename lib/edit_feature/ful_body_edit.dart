import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../Global/constant.dart';
import '../UI/Metrimonial_mainpage.dart';
import '../UI/mainpage.dart';
import '../UI/notificaition.dart';
import '../UI/yourprofile.dart';
import 'edit_main.dart';

class full_body_edit extends StatefulWidget {
  @override
//  String profile_url;
//  String id_card_url;
//  full_body_edit(this.profile_url,this.id_card_url);

  _full_body_editState createState() => _full_body_editState();
}

class _full_body_editState extends State<full_body_edit> {
  @override
  XFile? _image;
  CroppedFile? croppedFile;
//  String url="https://picsum.photos/250?image=9";
  String? url;

  void initState() {
    super.initState();
    data_function();
  }

  var gender = "";
  var name = "";
  var password = "";
  var id = "";

  late List data;
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
        url = data['full_body_image'];
      }
      setState(() {});
      print(url);
    }
  }

  _imgFromCamera() async {
    File image = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50)) as File;

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
              color: AppColor.purple,
              child: Wrap(
                children: <Widget>[
//                  new ListTile(
//                      leading: new Icon(Icons.photo_library_outlined,
//                      color:  AppColor.purple,
//                      ),
//                      title: new Text('Photo Library',
//                      style: TextStyle(
//                        color:  AppColor.purple,
//                        fontFamily: "poppins",
//                         fontWeight: FontWeight.w800,
//                        fontSize: 16.0,
//                      ),),
//                      onTap: () {
//                        _imgFromGallery();
//                        Navigator.of(context).pop();
//                      }),
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera_outlined,
                    ),
                    title: Text(
                      'Camera',
                      style: Theme.of(context).textTheme.bodyLarge,
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
      UploadTask uploadTask = reference.putFile(croppedFile as File);
      uploadTask.whenComplete(() async {
        url = await reference.getDownloadURL();
        setState(() {});

        var collection_1 = FirebaseFirestore.instance.collection(gender);
        collection_1
            .doc(id) // <-- Doc ID where data should be updated.
            .update({'full_body_image': url}) // <-- Nested value
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
//        Navigator.push(context,MaterialPageRoute(builder: (context) => personal_info(widget.profile_url,widget.id_card_url,url),));

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
              const SizedBox(
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
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back_ios,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  const SizedBox(
                    width: 10.0,
                  ),
                ],
              ),

              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    "Full Image".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
              ),

//              url == null
//                  ? Container(
//                height: 250,
//                width:MediaQuery.of(context).size.width * 0.3,
//                decoration: BoxDecoration(
////                    border: Border.all(color:  AppColor.purple,width: 2.0),
//                    borderRadius: BorderRadius.circular(10.0),
//                    image: DecorationImage(
//                      image:  AssetImage("Assets/images/full_body.png",),
//                      colorFilter: ColorFilter.mode( AppColor.purple, BlendMode.srcIn),
//
//                      fit: BoxFit.fill,
//                    )
//                ),
//                child: Stack(children: [
//                  GestureDetector(
//                    onTap: () {
//                      _showPicker(context);
//                    },
//                    child: Align(
//                      alignment: Alignment.bottomRight,
//                      child: CircleAvatar(
//                        radius: 20,
//                        backgroundColor: Colors.white70,
//                        child: Icon(
//                          Icons.camera_alt_outlined,
//                          color:  AppColor.purple,
//                        ),
//                      ),
//                    ),
//                  ),
//                ]),
//              )
//                  :

              (url != null)
                  ? _image == null
                      ? Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.purple, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
//                      image: FileImage(_image),
                                image: NetworkImage(url!),
                              )),
                          child: Stack(children: [
                            GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
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
                      : Container(
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.purple, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(_image as File),
//                     image: NetworkImage(url)
                              )),
                          child: Stack(children: [
                            GestureDetector(
                              onTap: () {
                                _showPicker(context);
                              },
                              child: const Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white70,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        )
                  : const Center(
                      child: CircularProgressIndicator(
                      color: AppColor.purple,
                    )),

              Spacer(),
              GestureDetector(
                onTap: () async {
                  upload_image();

//                  if (_image != null) {
//                    upload_image();
////                    setState(() {});
//
//
//                  } else {
//                    image_Message();
//                  }
                },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.purple,
                          AppColor.pink,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        'Update'.toUpperCase(),
                        style: const TextStyle(
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
                          child: const Icon(
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

              const SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
