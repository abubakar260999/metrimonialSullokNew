import 'dart:convert';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../UI/add_forms/profile_image_Screen.dart';
import '../UI/profile.dart';
import '../UI/profile_login.dart';
import '../UI/team/be_our_team.dart';
import '../admin/admin_profile.dart';

const Color appcolor = Color(0xFF7E1BCE);
const Color light_pink = Color(0xFFD93790);
const Color textColor = Color(0xFF424242);
const Color concolor = Color(0xFF424242);
const Color appColor = Color(0xFF424242);
const Color red = Color(0xFF424242);

class AppColor {
  static const Color purple = Color(0xFF7E1BCE);
  static const Color pink = Color(0xFFD93790);

  static const Color black = Colors.black;
  static const Color successColor = Color(0xFF00C853);
  static const Color cancelColor = Color(0xFFD32F2F);
  static const Color darkTextColor = Color(0xFF424242);
  static const Color lightTextColor = Color(0xFF757575);
  static const Color backgroundColor = Color(0xFFFFFFFF);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static const MaterialColor kPrimaryColor = MaterialColor(
    0xff92003B,
    <int, Color>{
      50: Color(0xff92003B),
      100: Color(0xff92003B),
      200: Color(0xff92003B),
      300: Color(0xff92003B),
    },
  );

  // Card colors
  static const Color lightCardColor = Color(0xFFFFFFFF);
  static const Color darkCardColor = Colors.black;
}

// Color backgroundColor = Color(0xFFE5F6FE);
String phone = "+923214435273";
String mail = "abulhasankhawar@gmail.com";
String app_name = 'Sulook';

add_data_to_List(
  String id,
  String name,
  String password,
  String gender,
) async {
  const storage = FlutterSecureStorage();
  List<String> list_of_user_profile = [
    id,
    name,
    password,
    gender,
  ];
  await storage.write(
      key: 'user_profile', value: jsonEncode(list_of_user_profile));
}

delete_data_from_list() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'user_profile');
}

in_admin() async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'in_admin', value: "true");
}

read_admin() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'in_admin');
}

out_admin() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'in_admin');
}

//add_data_to_list(
//String id,
//    String profile_image,
//String id_card_image,
//String full_body_image,
//String name,
//
//    String password,
//String gender,
//String sect,
//String caste,
//String  birth,
//String education,
//String familymembers,
//String profession,
//String  salary,
//String height,
//String weight,
//String complexion,
//String lifestandard,
//String martialstatus,
//String country,
//String city,
//String address,
//String phno,
//String explain,
//String l_caste,
//String  l_start,
//String  l_end,
//String l_education,
//String l_relgion,
//String  l_salary,
//String l_profession,
//String l_height,
//String l_martialstatus,
//String l_country,
//String l_city,
//String l_explain,
//
//    ) async {
//  const storage = FlutterSecureStorage();
//  List<String> list_of_user_profile = [
//    id,
//   profile_image,
//    id_card_image,
//    full_body_image,
//    name,
//    password,
//    gender,
//   sect,
//   caste,
//   birth,
//   education,
//    familymembers,
//   profession,
//   salary,
//   height,
//   weight,
//   lifestandard,
//   martialstatus,
//   country,
//   city,
//    address,
//   complexion,
//   phno,
//   explain,
//   l_caste,
//   l_start,
//   l_end,
//   l_education,
//   l_relgion,
//   l_salary,
//   l_profession,
//   l_height,
//   l_martialstatus,
//   l_country,
//   l_city,
//   l_explain,
//  ];
//
//  await storage.write(
//      key: 'UserProfile', value: jsonEncode(list_of_user_profile));
// }

read_data_of_list() async {
  const storage = FlutterSecureStorage();
  String? data = await storage.read(key: 'user_profile');
  List<dynamic> listOfItems = jsonDecode(data!);
// print(listOfItems);
// print("he 9th element:"+listOfItems[9]);
  return listOfItems;
}

add_admin_creditional(txt) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'admin', value: txt);
}

//profilr first matrimonial_mainpage
profile_first_page(snapshot) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (context, index) {
        List promotion = [
          snapshot.data[index].profile_image,
          snapshot.data[index].full_body_image
        ];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => profile(
                          snapshot.data[index].profile_image != null
                              ? snapshot.data[index].profile_image
                              : "no image",
                          snapshot.data[index].id_card_image != null
                              ? snapshot.data[index].id_card_image
                              : "no image",
                          snapshot.data[index].full_body_image != null
                              ? snapshot.data[index].full_body_image
                              : "no image",
                          snapshot.data[index].gender != null
                              ? snapshot.data[index].gender
                              : "no Gender",
                          snapshot.data[index].name != null
                              ? snapshot.data[index].name
                              : "no name",
                          snapshot.data[index].password != null
                              ? snapshot.data[index].password
                              : "no password",
                          snapshot.data[index].sect != null
                              ? snapshot.data[index].sect
                              : "no sect",
                          snapshot.data[index].caste != null
                              ? snapshot.data[index].caste
                              : "no caste",
                          snapshot.data[index].birth != null
                              ? snapshot.data[index].birth
                              : "no given birth",
                          snapshot.data[index].education != null
                              ? snapshot.data[index].education
                              : "no education",
                          snapshot.data[index].familymembers != null
                              ? snapshot.data[index].familymembers
                              : "no family members",
                          snapshot.data[index].profession != null
                              ? snapshot.data[index].profession
                              : "no profession",
                          snapshot.data[index].salary != null
                              ? snapshot.data[index].salary
                              : "no Salary",
                          snapshot.data[index].height != null
                              ? snapshot.data[index].height
                              : "no Height",
                          snapshot.data[index].weight != null
                              ? snapshot.data[index].weight
                              : "no weight",
                          snapshot.data[index].complexion != null
                              ? snapshot.data[index].complexion
                              : "no Complexion",
                          snapshot.data[index].lifestandard != null
                              ? snapshot.data[index].lifestandard
                              : "no lifeStandard",
                          snapshot.data[index].martialstatus != null
                              ? snapshot.data[index].martialstatus
                              : "no marriage status",
                          snapshot.data[index].country != null
                              ? snapshot.data[index].country
                              : "no country",
                          snapshot.data[index].city != null
                              ? snapshot.data[index].city
                              : "no city",
                          snapshot.data[index].address != null
                              ? snapshot.data[index].address
                              : "no address",
                          snapshot.data[index].phno != null
                              ? snapshot.data[index].phno
                              : "no phno",
                          snapshot.data[index].explain != null
                              ? snapshot.data[index].explain
                              : "no  explain",
                          snapshot.data[index].l_start != null
                              ? snapshot.data[index].l_start
                              : "no start age",
                          snapshot.data[index].l_end != null
                              ? snapshot.data[index].l_end
                              : "no end age",
                          snapshot.data[index].l_caste != null
                              ? snapshot.data[index].l_caste
                              : "no caste",
                          snapshot.data[index].l_education != null
                              ? snapshot.data[index].l_education
                              : "no looking for education",
                          snapshot.data[index].l_profession != null
                              ? snapshot.data[index].l_profession
                              : "no looking for profession",
                          snapshot.data[index].l_sect != null
                              ? snapshot.data[index].l_sect
                              : "no sect",
                          snapshot.data[index].l_martialstatus != null
                              ? snapshot.data[index].l_martialstatus
                              : "no Martial status",
                          snapshot.data[index].l_country != null
                              ? snapshot.data[index].l_country
                              : "no Country",
                          snapshot.data[index].l_city != null
                              ? snapshot.data[index].l_city
                              : "no looking for city",
                          snapshot.data[index].l_height != null
                              ? snapshot.data[index].l_height
                              : "no looking for height",
                          snapshot.data[index].l_salary != null
                              ? snapshot.data[index].l_salary
                              : "no looking for salary",
                          snapshot.data[index].l_explain != null
                              ? snapshot.data[index].l_explain
                              : "no looking for explain",
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Card(
                elevation: 10.0,
                color: AppColor.pink,
//               shadowColor:   AppColor.purple,
                shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   color:  AppColor.purple,
//                 ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Swiper(
                                layout: SwiperLayout.CUSTOM,
                                customLayoutOption: CustomLayoutOption(
                                    startIndex: -1, stateCount: 3)
                                  ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                                  ..addTranslate([
                                    Offset(-370.0, -40.0),
                                    Offset(0.0, 0.0),
                                    Offset(370.0, -40.0)
                                  ]),
                                itemWidth: MediaQuery.of(context).size.width,
                                itemHeight: 90,
                                autoplay: true,
                                itemCount: 2,
                                autoplayDelay: 3000,
                                itemBuilder: (context, index) {
                                  return Material(
                                    elevation: 2.0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: ClipRRect(
                                      child: FadeInImage(
                                          fit: BoxFit.fill,
                                          width: 90,
                                          height: 90,
                                          image: NetworkImage(promotion[index]),
                                          placeholder: AssetImage(
                                            "Assets/images/hover.gif",
                                          )),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          //filfile

                          SizedBox(
                            width: 10.0,
                          ),

                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/user.png",
//                                           color:  AppColor.purple,
                                        height: 18.0,
                                        width: 18.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].name != null
                                              ? snapshot.data[index].name
                                              : "name",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.calendar_circle,
                                        color: AppColor.purple,
                                        size: 15.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
//                                                    Container(
//                                                      height: 20.0,
//                                                      width:  MediaQuery.of(context)
//                                                          .size
//                                                          .width -
//                                                          260,
//                                                      child: Text(
//                                                        snapshot.data[index]
//                                                                    .birth
//                                                                    .toString() !=
//                                                                null
//                                                            ? snapshot
//                                                                    .data[index]
//                                                                    .birth
//                                                                    .toString() +
//                                                                " Year" +
//                                                                ", "
//                                                            : "Age",
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow
//                                                            .ellipsis,
//                                                        style: TextStyle(
//                                                          color:  AppColor.purple,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight:
//                                                              FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          (snapshot.data[index].birth
                                                              .toString() !=
                                                          null ||
                                                      snapshot.data[index]
                                                              .birth !=
                                                          ''
                                                  ? snapshot.data[index].birth
                                                          .toString() +
                                                      " Year" +
                                                      ", "
                                                  : "Age") +
                                              (snapshot.data[index].height
                                                              .toString() !=
                                                          null ||
                                                      snapshot.data[index]
                                                              .height
                                                              .toString() !=
                                                          ''
                                                  ? snapshot.data[index].height
                                                      .toString()
                                                  : "Height"),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/city.png",
                                        color: AppColor.purple,
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
//                                             snapshot.data[index].country == null || snapshot.data[index].country == '' ?
//                                             "no Country" : snapshot.data[index].country
//                                                 +","+
                                          snapshot.data[index].city == null ||
                                                  snapshot.data[index].city ==
                                                      ''
                                              ? "no city"
                                              : snapshot.data[index].city,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/cast.png",
                                        color: AppColor.purple,
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].caste != null
                                              ? snapshot.data[index].caste
                                              : "caste",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/employee.png",
                                        color: AppColor.purple,
                                        height: 18.0,
                                        width: 18.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].profession !=
                                                  null
                                              ? snapshot.data[index].profession
                                              : "profession",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20.0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              CupertinoIcons.heart_solid,
                              color: AppColor.purple,
                              size: 20.0,
                            ),
                            Spacer(),
                            Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width - 120,
                                decoration: BoxDecoration(
                                  color: AppColor.purple,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Center(
                                    child: Text(
                                      "View",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.star_fill,
                              color: AppColor.purple,
//                                 color: Color(0xffFFD700),
                              size: 20.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

//       else{
//         return no_data(context);
//       }
      });
}

no_data(context) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Center(
      child: Container(
        height: 400,
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    "No Matches Yet".toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
//                          color:Color(0xff32D554),
                      color: AppColor.purple,
                      fontSize: 24.0,
                      fontFamily: "poppins",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Icon(
              Icons.info_outline,
              size: MediaQuery.of(context).size.width * 0.3,
              color: AppColor.purple,
            ),
            SizedBox(
              height: 60.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => be_our_team(),
                    ));
              },
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.purple,
                        AppColor.purple,
//                          Color(0xff32D554),
//                          Color(0xff32D554),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10))),

                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Center(
                    child: Text(
                      'Login'.toUpperCase(),
                      style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

//                      Container(
//                        width: MediaQuery.of(context).size.width*0.3,
//                      ),
//
//                      Container(
////                height: 20.0,
////                width: 20.0,
//                          child: Icon(
//                            Icons.arrow_forward_ios,
//                            color: Colors.white,
//                            size: 20.0,
//                          )),
              ),
            ),
            SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    ),
  );
}

back_button(context) {
  return Row(
    children: [
      Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(10.0),
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
        width: 20.0,
      ),
    ],
  );
}

admin_profile_first_page(snapshot) {
  return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: snapshot.data?.length ?? 0,
      itemBuilder: (context, index) {
        List promotion = [
          snapshot.data[index].profile_image,
          snapshot.data[index].full_body_image
        ];
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => admin_profile(
                          snapshot.data[index].profile_image != null
                              ? snapshot.data[index].profile_image
                              : "no image",
                          snapshot.data[index].id_card_image != null
                              ? snapshot.data[index].id_card_image
                              : "no image",
                          snapshot.data[index].full_body_image != null
                              ? snapshot.data[index].full_body_image
                              : "no image",
                          snapshot.data[index].gender != null
                              ? snapshot.data[index].gender
                              : "no Gender",
                          snapshot.data[index].name != null
                              ? snapshot.data[index].name
                              : "no name",
                          snapshot.data[index].password != null
                              ? snapshot.data[index].password
                              : "no password",
                          snapshot.data[index].sect != null
                              ? snapshot.data[index].sect
                              : "no sect",
                          snapshot.data[index].caste != null
                              ? snapshot.data[index].caste
                              : "no caste",
                          snapshot.data[index].birth != null
                              ? snapshot.data[index].birth
                              : "no given birth",
                          snapshot.data[index].education != null
                              ? snapshot.data[index].education
                              : "no education",
                          snapshot.data[index].familymembers != null
                              ? snapshot.data[index].familymembers
                              : "no family members",
                          snapshot.data[index].profession != null
                              ? snapshot.data[index].profession
                              : "no profession",
                          snapshot.data[index].salary != null
                              ? snapshot.data[index].salary
                              : "no Salary",
                          snapshot.data[index].height != null
                              ? snapshot.data[index].height
                              : "no Height",
                          snapshot.data[index].weight != null
                              ? snapshot.data[index].weight
                              : "no weight",
                          snapshot.data[index].complexion != null
                              ? snapshot.data[index].complexion
                              : "no Complexion",
                          snapshot.data[index].lifestandard != null
                              ? snapshot.data[index].lifestandard
                              : "no lifeStandard",
                          snapshot.data[index].martialstatus != null
                              ? snapshot.data[index].martialstatus
                              : "no marriage status",
                          snapshot.data[index].country != null
                              ? snapshot.data[index].country
                              : "no country",
                          snapshot.data[index].city != null
                              ? snapshot.data[index].city
                              : "no city",
                          snapshot.data[index].address != null
                              ? snapshot.data[index].address
                              : "no address",
                          snapshot.data[index].phno != null
                              ? snapshot.data[index].phno
                              : "no phno",
                          snapshot.data[index].explain != null
                              ? snapshot.data[index].explain
                              : "no  explain",
                          snapshot.data[index].l_start != null
                              ? snapshot.data[index].l_start
                              : "no start age",
                          snapshot.data[index].l_end != null
                              ? snapshot.data[index].l_end
                              : "no end age",
                          snapshot.data[index].l_caste != null
                              ? snapshot.data[index].l_caste
                              : "no caste",
                          snapshot.data[index].l_education != null
                              ? snapshot.data[index].l_education
                              : "no looking for education",
                          snapshot.data[index].l_profession != null
                              ? snapshot.data[index].l_profession
                              : "no looking for profession",
                          snapshot.data[index].l_sect != null
                              ? snapshot.data[index].l_sect
                              : "no sect",
                          snapshot.data[index].l_martialstatus != null
                              ? snapshot.data[index].l_martialstatus
                              : "no Martial status",
                          snapshot.data[index].l_country != null
                              ? snapshot.data[index].l_country
                              : "no Country",
                          snapshot.data[index].l_city != null
                              ? snapshot.data[index].l_city
                              : "no looking for city",
                          snapshot.data[index].l_height != null
                              ? snapshot.data[index].l_height
                              : "no looking for height",
                          snapshot.data[index].l_salary != null
                              ? snapshot.data[index].l_salary
                              : "no looking for salary",
                          snapshot.data[index].l_explain != null
                              ? snapshot.data[index].l_explain
                              : "no looking for explain",
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Card(
                elevation: 10.0,
                color: light_pink,
//               shadowColor:   AppColor.purple,
                shape: RoundedRectangleBorder(
//                 side: BorderSide(
//                   color:  AppColor.purple,
//                 ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Swiper(
                                layout: SwiperLayout.CUSTOM,
                                customLayoutOption: CustomLayoutOption(
                                    startIndex: -1, stateCount: 3)
                                  ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                                  ..addTranslate([
                                    Offset(-370.0, -40.0),
                                    Offset(0.0, 0.0),
                                    Offset(370.0, -40.0)
                                  ]),
                                itemWidth: MediaQuery.of(context).size.width,
                                itemHeight: 90,
                                autoplay: true,
                                itemCount: 2,
                                autoplayDelay: 3000,
                                itemBuilder: (context, index) {
                                  return Material(
                                    elevation: 2.0,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    child: ClipRRect(
                                      child: FadeInImage(
                                          fit: BoxFit.fill,
                                          width: 90,
                                          height: 90,
                                          image: NetworkImage(promotion[index]),
                                          placeholder: AssetImage(
                                            "Assets/images/hover.gif",
                                          )),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          //filfile

                          SizedBox(
                            width: 10.0,
                          ),

                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width - 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/user.png",
//                                           color:  AppColor.purple,
                                        height: 18.0,
                                        width: 18.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].name != null
                                              ? snapshot.data[index].name
                                              : "name",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.calendar_circle,
                                        color: AppColor.purple,
                                        size: 15.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
//                                                    Container(
//                                                      height: 20.0,
//                                                      width:  MediaQuery.of(context)
//                                                          .size
//                                                          .width -
//                                                          260,
//                                                      child: Text(
//                                                        snapshot.data[index]
//                                                                    .birth
//                                                                    .toString() !=
//                                                                null
//                                                            ? snapshot
//                                                                    .data[index]
//                                                                    .birth
//                                                                    .toString() +
//                                                                " Year" +
//                                                                ", "
//                                                            : "Age",
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow
//                                                            .ellipsis,
//                                                        style: TextStyle(
//                                                          color:  AppColor.purple,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight:
//                                                              FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          (snapshot.data[index].birth
                                                              .toString() !=
                                                          null ||
                                                      snapshot.data[index]
                                                              .birth !=
                                                          ''
                                                  ? snapshot.data[index].birth
                                                          .toString() +
                                                      " Year" +
                                                      ", "
                                                  : "Age") +
                                              (snapshot.data[index].height
                                                              .toString() !=
                                                          null ||
                                                      snapshot.data[index]
                                                              .height
                                                              .toString() !=
                                                          ''
                                                  ? snapshot.data[index].height
                                                      .toString()
                                                  : "Height"),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/city.png",
                                        color: AppColor.purple,
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
//                                             snapshot.data[index].country == null || snapshot.data[index].country == '' ?
//                                             "no Country" : snapshot.data[index].country
//                                                 +","+
                                          snapshot.data[index].city == null ||
                                                  snapshot.data[index].city ==
                                                      ''
                                              ? "no city"
                                              : snapshot.data[index].city,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/cast.png",
                                        color: AppColor.purple,
                                        height: 20.0,
                                        width: 20.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].caste != null
                                              ? snapshot.data[index].caste
                                              : "caste",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 20.0,
                                  width:
                                      MediaQuery.of(context).size.width - 150,
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "Assets/images/employee.png",
                                        color: AppColor.purple,
                                        height: 18.0,
                                        width: 18.0,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        height: 20.0,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                180,
                                        child: Text(
                                          snapshot.data[index].profession !=
                                                  null
                                              ? snapshot.data[index].profession
                                              : "profession",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: AppColor.purple,
                                            fontSize: 14.0,
                                            fontFamily: "poppins",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 20.0,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.0,
                            ),
                            Icon(
                              CupertinoIcons.heart_solid,
                              color: AppColor.purple,
                              size: 20.0,
                            ),
                            Spacer(),
                            Material(
                              elevation: 10.0,
                              borderRadius: BorderRadius.circular(5.0),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width - 120,
                                decoration: BoxDecoration(
                                  color: AppColor.purple,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Center(
                                    child: Text(
                                      "View",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              CupertinoIcons.star_fill,
                              color: AppColor.purple,
//                                 color: Color(0xffFFD700),
                              size: 20.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );

//       else{
//         return no_data(context);
//       }
      });
}

add_data_to_team_list(
  String name,
  String address,
  String city,
  String idcard,
  String phno,
  String profession,
) async {
  const storage = FlutterSecureStorage();
  List<String> list_of_team = [
    name,
    address,
    city,
    idcard,
    phno,
    profession,
    "done"
  ];

  await storage.write(key: 'team', value: jsonEncode(list_of_team));
}

read_data_of_team() async {
  const storage = FlutterSecureStorage();
  String? data = await storage.read(key: 'team');
  List<dynamic> listOfItems = jsonDecode(data!);
  print(listOfItems);

  print("he 9th element:" + listOfItems[0]);
  return listOfItems;
}

float_back_button(context) {
  return new FloatingActionButton.extended(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    onPressed: () {
      Navigator.pop(context);
    },
    backgroundColor: AppColor.purple,
    icon: const Icon(
      Icons.arrow_back_ios,
      color: Colors.white,
    ),
    label: Text(
      'back'.toUpperCase(),
      style: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

admin_float_back_button(context) {
  return new FloatingActionButton.extended(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    onPressed: () {
      Navigator.pop(context);
    },
    backgroundColor: AppColor.purple,
    icon: const Icon(
      Icons.home_outlined,
      color: Colors.white,
    ),
    label: Text(
      'Home'.toUpperCase(),
      style: TextStyle(
          fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

signin_first(context) {
  return Center(
    child: Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(
            height: 10.0,
          ),
          Text(
            "Don't have a Profile",
            style: TextStyle(
              color: AppColor.purple,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              fontFamily: 'poppins',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profile_image_screen(),
                    ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Create Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Already have an profile",
            style: TextStyle(
              color: AppColor.purple,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              fontFamily: 'poppins',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => profile_login(),
                    ));
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColor.purple,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    "Login Profile",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      fontFamily: 'poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    ),
  );
}
