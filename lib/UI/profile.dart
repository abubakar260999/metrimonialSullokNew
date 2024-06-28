import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_country_picker/country.dart';

import '../Global/constant.dart';
import 'matches/interested.dart';

class profile extends StatefulWidget {
  @override
  final String profile_image;
  final String id_card_image;
  final String full_body_image;

  final String gender;
  final String name;
  final String password;

  final String sect;
  final String caste;
  final String birth;
  final String education;
  String familymember;

  final String profession;
  final String salary;

  final String height;
  final String weight;
  final String complexion;
  final String lifestandard;
  final String martialstatus;

  final String country;
  final String city;
  final String address;

  final String phno;
  final String explain;

  final String l_start;
  final String l_end;
  final String l_caste;
  final String l_education;
  final String l_profession;
  final String l_sect;
  final String l_country;
  final String l_city;
  final String l_martialstatus;
  final String l_height;
  final String l_salary;
  final String l_explain;

  //if you have multiple values add here
  profile(
      this.profile_image,
      this.id_card_image,
      this.full_body_image,
      this.gender,
      this.name,
      this.password,
      this.sect,
      this.caste,
      this.birth,
      this.education,
      this.familymember,
      this.profession,
      this.salary,
      this.height,
      this.weight,
      this.complexion,
      this.lifestandard,
      this.martialstatus,
      this.country,
      this.city,
      this.address,
      this.phno,
      this.explain,
      this.l_caste,
      this.l_start,
      this.l_end,
      this.l_education,
      this.l_sect,
      this.l_profession,
      this.l_salary,
      this.l_height,
      this.l_martialstatus,
      this.l_country,
      this.l_city,
      this.l_explain,
      {Key? key})
      : super(key: key);

  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  List promotions = [];
  var id;
  var gender;
  var name;
  var password;

//  String profile_image;
//  String id_card_image;
//  String full_body_image;
//
//  String sect;
//  String caste;
//  String birth;
//  String education;
//  String familymember;
//
//  String profession;
//  String salary;
//
//  String height;
//  String weight;
//  String complexion;
//  String lifestandard;
//  String martialstatus;
//
//
//  String country;
//  String city ;
//  String address;
//
//  String phno;
//  String explain;
//
//
//
//  String look_caste;
//  String look_age_start;
//  String look_age_end;
//  String look_education;
//  String look_sect;
//  String look_profession;
//  String look_salary;
//  String look_height;
//  String look_martialstatus;
//  String look_city;
//  String look_country;
//  String look_explain;
//
//
//
//
//
  void initState() {
    super.initState();

    data_function();
  }

  List data = [];
  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      id = data[0];
      name = data[1];
      password.text = data[2];
      gender = data[3];
    }

    var collection = FirebaseFirestore.instance
        .collection(gender)
        .where('name', isEqualTo: name)
        .where('password', isEqualTo: password);
    var querySnapshots = await collection.get();
    for (var snapshot in querySnapshots.docs) {
      id = snapshot.id;
    }
    setState(() {});
  }

//       profile_image= data['profile_image'];
//   id_card_image= data['id_card_image'];
//    full_body_image=data['full_body_image'];
////    data['name'],
////    data['gender'],
//    sect=data['sect'];
//    caste=data['caste'];
//    birth=data['birth'];
//    education=data['education'];
//    familymember=data['fmailymembers'];
//
//    profession=data['profession'];
//    salary=data['salary'];
//    height=data['height'];
//    weight=data['weight'];
//   complexion= data['complexion'];
//   lifestandard= data['lifestandard'];
//    martialstatus=data['martialstatus'];
//
//    country=data['country'];
//    city=data['city'];
//
//    phno=data['phno'];
//    explain=data['explain'];
//
//    look_caste=data['l_caste'];
//    look_age_start=data['l_start'];
//    look_age_end=data['l_end'];
//    look_education=data['l_education'];
//   look_sect= data['l_sect'];
//    look_salary=data['l_salary'];
//    look_profession=data['l_profession'];
//    look_height=data['l_height'];
//    look_martialstatus=data['l_martialstatus'];
//    look_country=data['l_country'];
//    look_city=data['l_city'];
//    look_explain=data['l_explain'];
//
////                      print( data['l_country']);
//
//    }
//      setState(() {
//      print(look_explain);
////      print("data in edit "+data.toString());
//    });
//  }
  profile_info() {
    return Container(
        child: ListView(children: [
      //upper one
      Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 3.0,
                  right: 8.0,
                  top: 4.0,
                  bottom: 4.0,
                ),
                child: Center(
                  child: Text(
                    widget.name.substring(0).toUpperCase().toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: appcolor,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            interested(widget.name, widget.password),
                      ));
                },
                child: Text(
                  "Interested",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: concolor),
                ),
//                              fillColor: Color(0xffffce32),
                fillColor: appcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            )
          ],
        ),
      ),

      //down one
      Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
          child: Container(
            child: Column(
              children: [
//                    Container(
//                      child: Text(
//                        "Info",
//                        style: TextStyle(
//                          color:       appcolor,
//                          fontSize: 24.0,
//                          fontWeight: FontWeight.w700,
//                        ),
//                      ),
//                    ),
                ListTile(
                  leading: Icon(
                    Icons.calendar_today_outlined,
                    color: appcolor,
                  ),
                  title: Text(
                    "Age is " + widget.birth,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/cast.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    widget.caste + " by caste",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/Gender.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    widget.gender,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/edu.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    "Studied " + widget.education,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/city.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    "Lives in " + widget.city + " in" + widget.country,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/employee.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    "Profession is " + widget.profession,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Image.asset(
                    "Assets/images/religion.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    widget.sect + " by Sect",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.face,
                    color: appcolor,
                  ),
                  title: Text(
                    widget.complexion + " in Complexion",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: appcolor,
                  ),
                  title: Text(
                    widget.weight + "Kg in Weight",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.height,
                    color: appcolor,
                  ),
                  title: Text(
                    "Height is " + widget.height,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Image.asset(
                    "Assets/images/salary.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    "Monthly Income is " + widget.salary,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                ListTile(
                  leading: Icon(
                    Icons.monetization_on_outlined,
                    color: appcolor,
                  ),
                  title: Text(
                    widget.lifestandard + " in life standard",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Image.asset(
                    "Assets/images/matrimonial.png",
                    color: appcolor,
                    height: 20.0,
                    width: 20.0,
                  ),
                  title: Text(
                    "marriage status is " + widget.martialstatus,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.group_outlined,
                    color: appcolor,
                  ),
                  title: Text(
                    " No of Family member is " + widget.familymember,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: appcolor,
                  ),
                  title: Text(
                    widget.phno,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.description,
                    color: appcolor,
                  ),
                  title: Text(
                    widget.explain,
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: appcolor),
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          )),
    ]));
  }

  look_info() {
    return Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 20.0, bottom: 40.0),
        child: ListView(
          children: [
            //upper one

            ListTile(
              leading: Icon(
                Icons.calendar_today_outlined,
                color: appcolor,
              ),
              title: Text(
                "Looking for Age between " +
                    widget.l_start.toString() +
                    " and " +
                    widget.l_end.toString(),
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/cast.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Looking for " + widget.l_caste + " caste",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/edu.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Studied " + widget.l_education,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "Assets/images/employee.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "job status should be  " + widget.l_profession,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),
            ListTile(
              leading: Image.asset(
                "Assets/images/city.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Live in " + widget.l_city + " in " + widget.l_country,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/religion.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                widget.l_sect + " by Sect",
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

//                    ListTile(
//                      leading: Icon(Icons.face,color:       appcolor,),
//                      title: Text(
//                        complexion+" in Complexion",
//                        style: TextStyle(
//                             fontSize: 16.0,
//                            fontWeight: FontWeight.w600,
//                            color:       appcolor),
//                      ),
//                    ),
//
//                    ListTile(
//                      leading: Icon(Icons.fitness_center,color:       appcolor,),
//                      title: Text(
//                        physique+" in physique",
//                        style: TextStyle(
//                             fontSize: 16.0,
//                            fontWeight: FontWeight.w600,
//                            color:       appcolor),
//                      ),
//                    ),

            ListTile(
              leading: Icon(
                Icons.height,
                color: appcolor,
              ),
              title: Text(
                "Height is " + widget.l_height,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/salary.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "monthly Income acceptation is " + widget.salary,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

//                    ListTile(
//                      leading: Icon(Icons.monetization_on_outlined,color:       appcolor,),
//                      title: Text(
//                        lifestandard+" in life standard",
//                        style: TextStyle(
//                             fontSize: 16.0,
//                            fontWeight: FontWeight.w600,
//                            color:       appcolor),
//                      ),
//                    ),
            ListTile(
              leading: Image.asset(
                "Assets/images/matrimonial.png",
                color: appcolor,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Marriage status is " + widget.l_martialstatus,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.description,
                color: appcolor,
              ),
              title: Text(
                widget.l_explain,
                style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: appcolor),
              ),
            ),

            SizedBox(
              height: 40.0,
            ),
          ],
        ));
  }

  build(BuildContext context) {
    promotions = [widget.profile_image, widget.full_body_image];

    return SafeArea(
        child: DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: concolor,
        floatingActionButton: float_back_button(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
//                leading: Align(
//                  alignment: Alignment.topLeft,
//                  child: Padding(
//                    padding: const EdgeInsets.only(left: 5.0,top: 20.0),
//                    child: Gestuappcoloretector(
//                      onTap: () {
//                        Navigator.pop(context);
//                      },
//                      child: Material(
//                        elevation: 10.0,
//                        borderRadius: BorderRadius.circular(10.0),
//                        child: Container(
//                          height: 40,
//                          width: 40,
//                          decoration: BoxDecoration(
//                            color: Colors.white70,
//                            borderRadius: BorderRadius.circular(10.0),
//                          ),
//                          child: Padding(
//                            padding: const EdgeInsets.only(left: 5.0),
//                            child: Center(
//                              child: Icon(
//                                Icons.arrow_back_ios,
//                                size: 30.0,
//                                color:       appcolor,
//                              ),
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
          toolbarHeight: 250,
          leadingWidth: 10,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Swiper(
              pagination: new SwiperPagination(),
              control: new SwiperControl(),
//    layout: SwiperLayout.CUSTOM,
//    customLayoutOption:
//    new CustomLayoutOption(startIndex: -1, stateCount: 3)
//        .addRotate(
//        [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
//      new Offset(-370.0, -40.0),
//      new Offset(0.0, 0.0),
//      new Offset(370.0, -40.0)
//    ]),
              itemWidth: MediaQuery.of(context).size.width,
              itemHeight: 180,
              autoplay: true,
              itemCount: 2,
              autoplayDelay: 3000,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: FadeInImage(
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      image: NetworkImage(promotions[index]),

                      // widget.profile_image != null
                      //     ? NetworkImage(promotions[index])
                      //     : AssetImage(
                      //   "Assets/images/hover.gif",
                      // ),
                      placeholder: AssetImage(
                        "Assets/images/hover.gif",
                      )),
                );
              },
            ),
          ),
          backgroundColor: light_pink,
          bottom: TabBar(
            unselectedLabelColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // Creates border
              color: appcolor,
            ),
            indicatorWeight: 10.0,
            labelPadding: EdgeInsets.all(20.0),
            indicatorPadding: EdgeInsets.all(20.0),
            //Change background color from here
            tabs: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                    fontFamily: "poppins",
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
                child: Text(
                  "Looking for",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                    fontFamily: "poppins",
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            profile_info(),
            look_info(),
          ],
        ),
      ),
    ));
  }
}
