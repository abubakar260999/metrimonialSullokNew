import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/route_manager.dart';

import 'Global/constant.dart';
import 'UI/notificaition.dart';
import 'UI/outcome_screeen/user_confirmed.dart';
import 'admin/admin_main.dart';

class Upload {
  static const root = "http://localhost/sulook/upload.php";
  static const team_action = "upload_team";
  static const caste_action = "upload_caste";
  static const education_action = "upload_education";
  static const profession_action = "upload_profession";

  static const action_male_profile = "upload_male_profile";
  static const action_female_profile = "upload_female_profile";

  static Future<String?> add_team(String name, String address, String idcard,
      String city, String phno, String profession) async {
    CollectionReference caster = FirebaseFirestore.instance.collection('Team');
    caster
        .add({
          'name': name,
          'address': address,
          'idcard': idcard,
          'city': city,
          'phno': phno,
          'profession': profession,
        })
        .then((value) => "Team Added")
        .catchError((error) {
          "Failed to Add Team :$error";
        });
  }

//add_caste
  static Future<String?> add_caste(String valueCaste) async {
    CollectionReference caster = FirebaseFirestore.instance.collection('Caste');
    caster
        .add({'caste': valueCaste})
        .then((value) => "Caste Added")
        .catchError((error) {
          "Failed to Add Caste :$error";
        });
  }

//add_education
  static Future<String?> add_education(String valueEducation) async {
    CollectionReference educater =
        FirebaseFirestore.instance.collection('Education');

    educater
        .add({'education': valueEducation})
        .then((value) => "Education Added")
        .catchError((error) {
          "Failed to Add Education :$error";
        });
  }

//add_profession
  static Future<String?> add_profession(String valueProfession) async {
    CollectionReference professioner =
        FirebaseFirestore.instance.collection('Profession');

    professioner
        .add({'profession': valueProfession})
        .then((value) => "Profession Added")
        .catchError((error) {
          "Failed to Add Profession :$error";
        });
  }

  static Future<String?> add_male(
      String profileImage,
      String idCardImage,
      String fullBodyImage,
      String gender,
      String name,
      String password,
      String sect,
      String caste,
      String birth,
      String education,
      String familymembers,
      String profession,
      String salary,
      String height,
      String weight,
      String complexion,
      String lifestandard,
      String martialstatus,
      String country,
      String city,
      String address,
      String phno,
      String explain,
      String lCaste,
      String lStart,
      String lEnd,
      String lEducation,
      String lSect,
      String lProfession,
      String lSalary,
      String lHeight,
      String lMartialstatus,
      String lCountry,
      String lCity,
      String lExplain) async {
    print("in male function");

    CollectionReference maler = FirebaseFirestore.instance.collection('Male');
    maler.add({
      'profile_image': profileImage,
      'id_card_image': idCardImage,
      'full_body_image': fullBodyImage,
      'gender': gender,
      'name': name,
      'password': password,
      'sect': sect,
      'caste': caste,
      'birth': birth,
      'education': education,
      'familymembers': familymembers,
      'profession': profession,
      'salary': salary,
      'height': height,
      'weight': weight,
      'complexion': complexion,
      'lifestandard': lifestandard,
      'martialstatus': martialstatus,
      'country': country,
      'city': city,
      'address': address,
      'phno': phno,
      'explain': explain,
      'l_caste': lCaste,
      'l_start': lStart,
      'l_end': lEnd,
      'l_education': lEducation,
      'l_sect': lSect,
      'l_profession': lProfession,
      'l_salary': lSalary,
      'l_height': lHeight,
      'l_martialstatus': lMartialstatus,
      'l_country': lCountry,
      'l_city': lCity,
      'l_explain': lExplain,
    }).then((value) {
      var id = value.id;
      print(id);

//      if(read_admin()!="true"){
      if (id != null) {
        add_data_to_List(id, name, password, gender);
        successful_Message();
        Get.to(user_confirmed());
      }

//      }
//      else
//      {
//        Get.to(admin_main());
//
//      }

//      add_data_to_list(
//             id,
//           profile_image,
//           id_card_image,
//           full_body_image,
//           name,
//           password,
//           gender,
//           sect,
//           caste,
//           birth,
//           education,
//           profession,
//           salary ,
//           height,
//           weight,
//           complexion,
//           familymembers,
//           lifestandard,
//           martialstatus,
//           country,
//           city,
//           address,
//           phno,
//           explain,
//           l_caste,
//           l_start,
//           l_end,
//           l_education,
//           l_sect,
//           l_salary,
//           l_profession,
//           l_height,
//           l_martialstatus,
//           l_country,
//           l_city,
//           l_explain,
//      );
    }).catchError((error) {
      "Failed to Add Male :$error";
    });
  } //female

  static Future<String?> add_female(
      String profileImage,
      String idCardImage,
      String fullBodyImage,
      String gender,
      String name,
      String password,
      String sect,
      String caste,
      String birth,
      String education,
      String familymembers,
      String profession,
      String salary,
      String height,
      String weight,
      String complexion,
      String lifestandard,
      String martialstatus,
      String country,
      String city,
      String address,
      String phno,
      String explain,
      String lCaste,
      String lStart,
      String lEnd,
      String lEducation,
      String lSect,
      String lProfession,
      String lSalary,
      String lHeight,
      String lMartialstatus,
      String lCountry,
      String lCity,
      String lExplain) async {
    print("infemale function");

    CollectionReference femaler =
        FirebaseFirestore.instance.collection('Female');
    femaler.add({
      'profile_image': profileImage,
      'id_card_image': idCardImage,
      'full_body_image': fullBodyImage,
      'gender': gender,
      'name': name,
      'password': password,
      'sect': sect,
      'caste': caste,
      'birth': birth,
      'education': education,
      'familymembers': familymembers,
      'profession': profession,
      'salary': salary,
      'height': height,
      'weight': weight,
      'complexion': complexion,
      'lifestandard': lifestandard,
      'martialstatus': martialstatus,
      'country': country,
      'city': city,
      'address': address,
      'phno': phno,
      'explain': explain,
      'l_caste': lCaste,
      'l_start': lStart,
      'l_end': lEnd,
      'l_education': lEducation,
      'l_sect': lSect,
      'l_profession': lProfession,
      'l_salary': lSalary,
      'l_height': lHeight,
      'l_martialstatus': lMartialstatus,
      'l_country': lCountry,
      'l_city': lCity,
      'l_explain': lExplain,
    }).then((value) {
      var id = value.id;
      print(id);

      if (id != null) {
        add_data_to_List(id, name, password, gender);
        successful_Message();
        Get.to(user_confirmed());
//        Get.to(matrimonial_mainpage());
      }

//      }
//      else
//      {
//        Get.to(admin_main());
//
//      }
    }).catchError((error) {
      "Failed to Add Female :$error";
    });
  }

  ///
  ///
  ///   ADMIN
  ////
  //
  static Future<String?> admin_add_male(
      String profileImage,
      String idCardImage,
      String fullBodyImage,
      String gender,
      String name,
      String password,
      String sect,
      String caste,
      String birth,
      String education,
      String familymembers,
      String profession,
      String salary,
      String height,
      String weight,
      String complexion,
      String lifestandard,
      String martialstatus,
      String country,
      String city,
      String address,
      String phno,
      String explain,
      String lCaste,
      String lStart,
      String lEnd,
      String lEducation,
      String lSect,
      String lProfession,
      String lSalary,
      String lHeight,
      String lMartialstatus,
      String lCountry,
      String lCity,
      String lExplain) async {
    print("in male function");

    CollectionReference maler = FirebaseFirestore.instance.collection('Male');
    maler.add({
      'profile_image': profileImage,
      'id_card_image': idCardImage,
      'full_body_image': fullBodyImage,
      'gender': gender,
      'name': name,
      'password': password,
      'sect': sect,
      'caste': caste,
      'birth': birth,
      'education': education,
      'familymembers': familymembers,
      'profession': profession,
      'salary': salary,
      'height': height,
      'weight': weight,
      'complexion': complexion,
      'lifestandard': lifestandard,
      'martialstatus': martialstatus,
      'country': country,
      'city': city,
      'address': address,
      'phno': phno,
      'explain': explain,
      'l_caste': lCaste,
      'l_start': lStart,
      'l_end': lEnd,
      'l_education': lEducation,
      'l_sect': lSect,
      'l_profession': lProfession,
      'l_salary': lSalary,
      'l_height': lHeight,
      'l_martialstatus': lMartialstatus,
      'l_country': lCountry,
      'l_city': lCity,
      'l_explain': lExplain,
    }).then((value) {
//      var id =value.id;
//      print(id);
//
//      if(read_admin()!="true"){
//        add_data_to_List(id,gender,name,password);
//        successful_Message();
//        Get.to(user_confirmed());
//        Get.to(matrimonial_mainpage());
//      }
//      else
//      {
      Get.to(admin_main());

//      }

//      add_data_to_list(
//             id,
//           profile_image,
//           id_card_image,
//           full_body_image,
//           name,
//           password,
//           gender,
//           sect,
//           caste,
//           birth,
//           education,
//           profession,
//           salary ,
//           height,
//           weight,
//           complexion,
//           familymembers,
//           lifestandard,
//           martialstatus,
//           country,
//           city,
//           address,
//           phno,
//           explain,
//           l_caste,
//           l_start,
//           l_end,
//           l_education,
//           l_sect,
//           l_salary,
//           l_profession,
//           l_height,
//           l_martialstatus,
//           l_country,
//           l_city,
//           l_explain,
//      );
    }).catchError((error) {
      "Failed to Add Male :$error";
    });
  } //fem

  static Future<String?> admin_add_female(
      String profileImage,
      String idCardImage,
      String fullBodyImage,
      String gender,
      String name,
      String password,
      String sect,
      String caste,
      String birth,
      String education,
      String familymembers,
      String profession,
      String salary,
      String height,
      String weight,
      String complexion,
      String lifestandard,
      String martialstatus,
      String country,
      String city,
      String address,
      String phno,
      String explain,
      String lCaste,
      String lStart,
      String lEnd,
      String lEducation,
      String lSect,
      String lProfession,
      String lSalary,
      String lHeight,
      String lMartialstatus,
      String lCountry,
      String lCity,
      String lExplain) async {
    print("infemale function");

    CollectionReference femaler =
        FirebaseFirestore.instance.collection('Female');
    femaler.add({
      'profile_image': profileImage,
      'id_card_image': idCardImage,
      'full_body_image': fullBodyImage,
      'gender': gender,
      'name': name,
      'password': password,
      'sect': sect,
      'caste': caste,
      'birth': birth,
      'education': education,
      'familymembers': familymembers,
      'profession': profession,
      'salary': salary,
      'height': height,
      'weight': weight,
      'complexion': complexion,
      'lifestandard': lifestandard,
      'martialstatus': martialstatus,
      'country': country,
      'city': city,
      'address': address,
      'phno': phno,
      'explain': explain,
      'l_caste': lCaste,
      'l_start': lStart,
      'l_end': lEnd,
      'l_education': lEducation,
      'l_sect': lSect,
      'l_profession': lProfession,
      'l_salary': lSalary,
      'l_height': lHeight,
      'l_martialstatus': lMartialstatus,
      'l_country': lCountry,
      'l_city': lCity,
      'l_explain': lExplain,
    }).then((value) {
//      var id =value.id;
//      print(id);
//      if(read_admin()!="true"){
//        add_data_to_List(id,gender,name,password);
//        successful_Message();
//        Get.to(user_confirmed());
//        Get.to(matrimonial_mainpage());
//      }
//      else
//      {
      Get.to(admin_main());
//
//      }
    }).catchError((error) {
      "Failed to Add Female :$error";
    });
  }
}

//login_team(String name,String phno,context)
//{
//
//  return StreamBuilder<List<Team>>(
//    stream: FirebaseFirestore.instance.collection('team').
////    where('name', isEqualTo: name).
////    where('phno', isEqualTo:phno).
//    snapshots().map((event) => event.docs.map((e) =>Team.fromJson(e.data())).toList()),
//    builder: (context, snapshot)
//  {
//  return ListView.builder(
//  shrinkWrap: true,
//  physics: NeverScrollableScrollPhysics(),
//  itemCount: snapshot.data?.length ?? 0,
//  itemBuilder: (context, index) {
////    return (snapshot.data[index].name==name && snapshot.data[index].phno==phno)?
////         "done":"nothing";
//
//
//
//
//  });
//  });
//
//}
//
