import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metrimonialsullokupdated/Global/constant.dart';
import 'package:metrimonialsullokupdated/common_widget.dart';

import '../UI/Metrimonial_mainpage.dart';
import '../UI/mainpage.dart';
import '../UI/notificaition.dart';
import '../UI/yourprofile.dart';
import 'edit_main.dart';

class id_card_edit extends StatefulWidget {
  @override
//  String profile_url;
//  id_card_edit(this.profile_url,);
  _id_card_editState createState() => _id_card_editState();
}

class _id_card_editState extends State<id_card_edit> {
  @override
  File? _image;
  CroppedFile? croppedFile;
  String? url;

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
        url = data['id_card_image'];
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
                  ListTile(
                    leading: const Icon(
                      Icons.photo_camera_outlined,
                      color: AppColor.purple,
                    ),
                    title: Text('Camera',
                        style: Theme.of(context).textTheme.bodyMedium),
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
            .update({'id_card_image': url}) // <-- Nested value
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

//        Navigator.push(context,MaterialPageRoute(builder: (context) => full_body_image_screen(widget.profile_url,url),));

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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                const VerticalSpacing(
                  of: 20,
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
                            child: const Padding(
                              padding: const EdgeInsets.all(10.0),
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
                        const Text(
                          "Right half Id card Image As Shown Above",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.purple,
                            fontSize: 20.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "Note: This Image is Only for Admin Use",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.purple,
                            fontSize: 15.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "No One will be able to See Or Use It",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.purple,
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

//                _image == null
//                    ? Container(
//                  height: 120,
//                  width:MediaQuery.of(context).size.width * 0.4,
//                  decoration: BoxDecoration(
//                      border: Border.all(color: appcolor,width: 2.0),
//                      borderRadius: BorderRadius.circular(10.0),
//                      image: DecorationImage(
//                        image:  AssetImage("Assets/images/id_card.png"),
//                        scale: 1.0,
//                        fit: BoxFit.cover,
//                      )
//                  ),
//                  child: Stack(children: [
//                    GestureDetector(
//                      onTap: () {
//                        _showPicker(context);
//                      },
//                      child: Align(
//                        alignment: Alignment.bottomRight,
//                        child: CircleAvatar(
//                          radius: 20,
//                          backgroundColor: light_pink,
//                          child: Icon(
//                            Icons.camera_alt_outlined,
//                            color: appcolor,
//                          ),
//                        ),
//                      ),
//                    ),
//                  ]),
//                )
//                    :

                (url != null)
                    ? _image == null
                        ? Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.purple, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(url!),
//                        image:   FileImage(_image),
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
                        : Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.purple, width: 2.0),
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
//                       image: NetworkImage(url),
                                  image: FileImage(_image!),
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
                        child:
                            CircularProgressIndicator(color: AppColor.purple)),

//              SizedBox(
//                height: 50.0,
//              ),

                Spacer(),

                GestureDetector(
                  onTap: () async {
                    upload_image();
//                    if (_image != null) {
//                      upload_image();
////                    setState(() {});
//
//
//                    } else {
//                      image_Message();
//                    }
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
                        Text('Update'.toUpperCase(),
                            style: Theme.of(context).textTheme.bodyMedium),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        Container(
//                height: 20.0,
//                width: 20.0,
                            child: const Icon(
                          Icons.arrow_forward_ios,
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
