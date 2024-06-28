import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../Global/constant.dart';
import '../Modal/be_our_team.dart';
import '../Modal/personmodel.dart';
import '../UI/admin_add_form/admin_add_profileimage_Screen.dart';
import '../UI/mainpage.dart';
import '../common_widget.dart';

class admin_main extends StatefulWidget {
  @override
  _admin_mainState createState() => _admin_mainState();
}

class _admin_mainState extends State<admin_main> {
  @override
  Stream<List<Person>> getmale() =>
      FirebaseFirestore.instance.collection('Male').snapshots().map(
          (event) => event.docs.map((e) => Person.fromJson(e.data())).toList());

  Stream<List<Person>> getfemale() =>
      FirebaseFirestore.instance.collection('Female').snapshots().map(
          (event) => event.docs.map((e) => Person.fromJson(e.data())).toList());

  Stream<List<Team>> getteam() => FirebaseFirestore.instance
      .collection('Team')
      .snapshots()
      .map((event) => event.docs.map((e) => Team.fromJson(e.data())).toList());

  void initState() {
    super.initState();
    getmale();
    getfemale();
//    getteam();
  }

  male_data() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: StreamBuilder<List<Person>>(
            stream: getmale(),
            builder: (context, snapshot) => admin_profile_first_page(snapshot)),
      ),
    );
  }

  female_data() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: StreamBuilder<List<Person>>(
            stream: getfemale(),
            builder: (context, snapshot) => admin_profile_first_page(snapshot)),
      ),
    );
  }
//team_data(){
//  return  SingleChildScrollView(
//
//    child: Padding(
//      padding: const EdgeInsets.all(10.0),
//      child: StreamBuilder<List<Team>>(
//          stream: getteam(),
//          builder: (context, snapshot) {
//            return ListView.builder(
//                shrinkWrap: true,
//                physics: NeverScrollableScrollPhysics(),
//                itemCount: snapshot.data?.length ?? 0,
//                itemBuilder: (context, index) {
//                  return GestureDetector(
//                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => team_profile_admin(
//                               snapshot.data[index].name,
//                                snapshot.data[index].address,
//                                snapshot.data[index].city,
//                                snapshot.data[index].idcard,
//                                snapshot.data[index].phno,
//                                snapshot.data[index].profession,
//                              )));
//                    },
//                    child: Padding(
//                      padding: const EdgeInsets.only(bottom: 8.0),
//                      child: Container(
//                        width: MediaQuery.of(context).size.width,
//                        height: 180,
//                        child: Card(
//                          elevation: 10.0,
//                          shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(20.0),
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                left: 10.0,
//                                right: 10.0,
//                                top: 10.0,
//                                bottom: 10.0),
//                            child: Column(
//                              children: [
//                                Column(
//                                  crossAxisAlignment:
//                                  CrossAxisAlignment.start,
//                                  children: [
//                                    Container(
//                                      height: 20.0,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                          Image.asset(
//                                            "Assets/images/user.png",
//                                            color: appcolor,
//                                            height: 18.0,
//                                            width: 18.0,
//                                          ),
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//                                          Container(
//                                            height: 20.0,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index]
//                                                  .name !=
//                                                  null
//                                                  ? snapshot
//                                                  .data[index]
//                                                  .name
//                                                  : "name",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 20.0,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                          Icon(Icons.account_box_outlined,
//                                            color: appcolor,
//                                            size: 20.0,),
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//                                          Container(
//                                            height: 20.0,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index]
//                                                  .address !=
//                                                  null
//                                                  ? snapshot
//                                                  .data[index]
//                                                  .address
//                                                  : "address",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 20.0,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                          Icon(Icons.credit_card_rounded,
//                                            color: appcolor,
//                                            size: 20.0,),
//
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//
//
//                                          Container(
//                                            height: 20.0,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index]
//                                                  .idcard !=
//                                                  null
//                                                  ? snapshot
//                                                  .data[index]
//                                                  .idcard
//                                                  : "Idcard",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 20.0,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                       Icon(Icons.phone,
//                                         color: appcolor,
//                                       size: 20.0,),
//
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//
//
//                                          Container(
//                                            height: 20.0,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index]
//                                                  .phno !=
//                                                  null
//                                                  ? snapshot
//                                                  .data[index]
//                                                  .phno
//                                                  : "phno",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 20.0,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                          Image.asset(
//                                            "Assets/images/city.png",
//                                            color: appcolor,
//                                            height: 20.0,
//                                            width: 20.0,
//                                          ),
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//                                          Container(
//                                            height: 20.0,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index].city!=null||snapshot.data[index].city!=''?
//                                              snapshot.data[index].city:"no city",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    Container(
//                                      height: 20,
//                                       width: MediaQuery.of(context).size.width-30,
//                                      child: Row(
//                                        children: [
//                                          Image.asset(
//                                            "Assets/images/employee.png",
//                                            color: appcolor,
//                                            height: 20.0,
//                                            width: 20.0,
//                                          ),
//                                          SizedBox(
//                                            width: 10,
//                                          ),
//                                          Container(
//                                            height: 20,
//                                                   width: MediaQuery.of(context).size.width-80,
//                                            child: Text(
//                                              snapshot.data[index]
//                                                  .profession !=
//                                                  null
//                                                  ? snapshot
//                                                  .data[index]
//                                                  .profession
//                                                  : "profession",
//                                              maxLines: 1,
//                                              overflow: TextOverflow
//                                                  .ellipsis,
//                                              style: TextStyle(
//                                                color: appcolor,
//                                                fontSize: 14.0,
//                                                fontFamily: "poppins",
//                                                fontWeight:
//                                                FontWeight.w500,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      height: 10.0,
//                                    ),
//                                  ],
//                                ),
//                                Container(
//                                   width: MediaQuery.of(context).size.width-30,
//                                  height: 20.0,
//                                  child: Row(
//                                    children: [
////                                                  SizedBox(
////                                                    width: 20.0,
////                                                  ),
////                                  Icon(
////                                    CupertinoIcons.heart_solid,
////                                    color: appcolor,
////                                    size: 20.0,
////                                  ),
//
//                                      Spacer(),
//
//                                      Material(
//                                        elevation: 10.0,
//                                        borderRadius:
//                                        BorderRadius.circular(5.0),
//                                        child: Container(
//                                          height: 20,
//                                          width: MediaQuery.of(context)
//                                              .size
//                                              .width -
//                                              50,
//                                          decoration: BoxDecoration(
//                                            color: appcolor,
//                                            borderRadius:
//                                            BorderRadius.circular(5.0),
//                                          ),
//                                          child: Padding(
//                                            padding:
//                                            const EdgeInsets.all(2.0),
//                                            child: Center(
//                                              child: Text(
//                                                "View",
//                                                maxLines: 1,
//                                                overflow:
//                                                TextOverflow.ellipsis,
//                                                style: TextStyle(
//                                                  color: Colors.white,
//                                                  fontSize: 14.0,
//                                                  fontFamily: "poppins",
//                                                  fontWeight:
//                                                  FontWeight.w500,
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                        ),
//                                      ),
//                                      Spacer(),
//
////                                  Icon(
////                                    CupertinoIcons.star_fill,
////                                    color: Color(0xffFFD700),
////                                    size: 20.0,
////                                  ),
//                                    ],
//                                  ),
//                                )
//                              ],
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  );
//                });
//          }),
//    ),
//  );
//}

  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: WillPopScope(
          onWillPop: () => Future.value(false),
          child: BaseScaffold(
//          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: admin_float_back_button(context),
            leadingAppBar: AppBar(
              toolbarHeight: 200,
              title: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "Admin Panel",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.0,
                    fontFamily: "poppins",
                  ),
                ),
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  in_admin();
                  setState(() {});

                  Get.to(admin_add_profile_image_screen());
                },
                child: Icon(
                  Icons.person_add_sharp,
                  color: appcolor,
                  size: 24.0,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0, top: 50.0),
                  child: GestureDetector(
                    onTap: () {
                      out_admin();
                      setState(() {});
                      Get.offAll(mainpage());
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: appcolor,
                          size: 22.0,
                        ),
                        Text(
                          "Logout",
                          style: TextStyle(
                            color: appcolor,
                            fontWeight: FontWeight.w500,
                            fontSize: 10.0,
                            fontFamily: "poppins",
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              bottom: TabBar(
                unselectedLabelColor: AppColor.black,
                isScrollable: true,
                labelColor: Colors.white,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // Creates border
                  color: appcolor,
                ),
                indicatorWeight: 10.0,
                labelPadding: EdgeInsets.all(22.0),
                indicatorPadding: EdgeInsets.all(22.0),
                //Change background color from here
                tabs: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0),
                    child: Text(
                      "All Male Entries",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.0,
                        fontFamily: "poppins",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 8.0),
                    child: Text(
                      "All Female Entries",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.0,
                        fontFamily: "poppins",
                      ),
                    ),
                  ),

//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
//                 child: Text(
//                   "Be Our Team",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w900,
//                     fontSize: 14.0,
//                     fontFamily: "poppins",),
//                 ),
//               ),
                ],
              ),
            ),

            child: TabBarView(
              children: [
                male_data(),
                female_data(),
//              team_data(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
