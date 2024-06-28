import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Global/constant.dart';

//
//Message(msg){
//  return Get.snackbar(msg, '$msg',
//    padding:  EdgeInsets.only(left: 10.0,right: 10.0,),
//    backgroundColor: Colors.transparent,
//    snackPosition: SnackPosition.BOTTOM,
//    titleText: Container(),
//    messageText: Container(
//        height: 50.0,
//        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//        decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(5.0),
////                color: Colors.black87
//        ),
//        child: Row(
//          children: [
//            Text(
//              msg,
//              style: TextStyle(color: Colors.white),
//            ),
//            Spacer(),
//
////            Container(
////                height: 20.0,
////                width: 20.0,
////                child: Icon(Icons.done,color: Colors.white,
//////                  size: 20.0,
////                ))
//          ],
//        )),
//    margin: const EdgeInsets.only(bottom: 15,left: 10.0,right: 10.0),
//  );
//}

authentication_Message() {
  return Get.snackbar(
    'Authentication Succesful',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Authentication Succesful",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

invalid_Message() {
  return Get.snackbar(
    'INVALID CREDENTIAL',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "INVALID CREDENTIAL",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

processing_Message() {
  return Get.snackbar(
    'Processing',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Processing",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

empty_Message(txt) {
  return Get.snackbar(
    'Fill the ' + txt,
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Fill the " + txt,
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

fill_Message() {
  return Get.snackbar(
    'Fill the field',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Fill the fields",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

Welcome_Message() {
  return Get.snackbar(
    'Welcome',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Welcome",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

image_Message() {
  return Get.snackbar(
    'Add image First',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Add your image first",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

successful_Message() {
  return Get.snackbar(
    'Succesful',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Succesful",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

empty_whatsapp_message() {
  return Get.snackbar(
    'plz Write The Message',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "plz Write The Message",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

update_Message() {
  return Get.snackbar(
    'Updated Succesful',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Updated Succesful",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

not_update_Message() {
  return Get.snackbar(
    'Updated Unsuccesful', '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    // snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Updated UnSuccesful",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}

request_Message() {
  return Get.snackbar(
    'Request Succesfully Send',
    '',
    padding: EdgeInsets.only(
      left: 10.0,
      right: 10.0,
    ),
    backgroundColor: appcolor,
    snackPosition: SnackPosition.BOTTOM,
    titleText: Container(),
    messageText: Container(
        height: 50.0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
//                color: Colors.black87
        ),
        child: Row(
          children: [
            Text(
              "Request Succesfully Send",
              style: TextStyle(color: Colors.white),
            ),
            Spacer(),
            Center(
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Center(
                    child: Icon(
                  Icons.done,
                  color: Colors.white,
                )),
              ),
            )
          ],
        )),
    margin: const EdgeInsets.only(bottom: 15, left: 10.0, right: 10.0),
  );
}
