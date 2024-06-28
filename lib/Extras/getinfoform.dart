//import 'dart:html';
//
//import 'package:flutter/material.dart';
//import 'package:flutter_country_picker/flutter_country_picker.dart';
//
//
//class getinfo extends StatefulWidget {
//  @override
//  _getinfoState createState() => _getinfoState();
//}
//
//class _getinfoState extends State<getinfo> {
//  @override
//
// Country _selected;
//
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        scrollDirection:Axis.vertical,
//        child: Column(
//          children: <Widget>[
////            Container(
////        width: MediaQuery.of(context).size.width,
////        height: MediaQuery.of(context).size.height/3.5,
////        decoration: BoxDecoration(
////            gradient: LinearGradient(
////              begin: Alignment.topCenter,
////              end: Alignment.bottomCenter,
////              colors: [
////                Color(0xff6bceff),
////                Color(0xff6bceff)
////              ],
////            ),
////            borderRadius: BorderRadius.only(
////                bottomLeft: Radius.circular(90)
////            )
////        ),
////              child: Column(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: <Widget>[
////                  Spacer(),
////                  Align(
////                    alignment: Alignment.center,
////                    child: Icon(Icons.person,
////                      size: 90,
////                      color: Colors.white,
////                    ),
////                  ),
////                  Spacer(),
////
////                  Align(
////                    alignment: Alignment.bottomRight,
////                    child: Padding(
////                      padding: const EdgeInsets.only(
////                          bottom: 32,
////                          right: 32
////                      ),
////                      child: Text('Login',
////                        style: TextStyle(
////                            color: Colors.white,
////                            fontSize: 18
////                        ),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////            ),
//
//            Container(
//              height: MediaQuery.of(context).size.height,
//              width: MediaQuery.of(context).size.width,
//              padding: EdgeInsets.only(top: 62),
//
//
//
//              child: Column(
//                children: <Widget>[
//
//                  //username
//
//                  Container(
//                    width: MediaQuery.of(context).size.width/1.2,
//                    height: 45,
//                    padding: EdgeInsets.only(
//                        top: 4,left: 16, right: 16, bottom: 4
//                    ),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(
//                            Radius.circular(50)
//                        ),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 5
//                          )
//                        ]
//                    ),
//                    child: TextField(
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        icon: Icon(Icons.person,
//                          color: Color(0xff6bceff),
//
//                        ),
//                        hintText: 'Name',
//                        hintStyle: TextStyle(
//                          fontSize: 19.0,
//                        )
//                      ),
//                    ),
//                  ),
//
//                  //contact
//
//                  Container(
//                    width: MediaQuery.of(context).size.width/1.2,
//                    height: 45,
//                    margin: EdgeInsets.only(top: 32),
//                    padding: EdgeInsets.only(
//                        top: 4,left: 16, right: 16, bottom: 4
//                    ),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(
//                            Radius.circular(50)
//                        ),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 5
//                          )
//                        ]
//                    ),
//                    child: TextField(
//                      obscureText: true,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        icon: Icon(Icons.vpn_key,
//                          color: Color(0xff6bceff),
//                        ),
//                        hintText: 'Password',
//                          hintStyle: TextStyle(
//                            fontSize: 19.0,
//                          )
//                      ),
//                    ),
//                  ),
//
//                  Align(
//                    alignment: Alignment.centerRight,
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          top: 16, right: 32
//                      ),
//                      child: Text('Forgot Password ?',
//                        style: TextStyle(
//                            color: Colors.grey
//                        ),
//                      ),
//                    ),
//                  ),
//                  Spacer(),
//
//                  Container(
//                    width: MediaQuery.of(context).size.width/1.2,
//                    height: 45,
//                    margin: EdgeInsets.only(top: 32),
//                    padding: EdgeInsets.only(
//                        top: 4,left: 16, right: 16, bottom: 4
//                    ),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(
//                            Radius.circular(50)
//                        ),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 5
//                          )
//                        ]
//                    ),
//                    child: TextField(
//                      obscureText: true,
//                      decoration: InputDecoration(
//                        border: InputBorder.none,
//                        icon: Icon(Icons.vpn_key,
//                          color: Color(0xff6bceff),
//                        ),
//                        hintText: 'Password',
//
//                          hintStyle: TextStyle(
//                            fontSize: 19.0,
//                          )
//                      ),
//                    ),
//                  ),
//
//
//
//                  //
//
//                  Container(
//                    width: MediaQuery.of(context).size.width/1.2,
//                    height: 45,
//                    margin: EdgeInsets.only(top: 32),
//                    padding: EdgeInsets.only(
//                        top: 4,left: 16, right: 16, bottom: 4
//                    ),
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(
//                            Radius.circular(50)
//                        ),
//                        color: Colors.white,
//                        boxShadow: [
//                          BoxShadow(
//                              color: Colors.black12,
//                              blurRadius: 5
//                          )
//                        ]
//                    ),
//                    child: TextField(
//                      decoration: InputDecoration(
//                          border: InputBorder.none,
////                              icon: Icon(Icons.vpn_key,
////                                color: Color(0xff6bceff),
////                              ),
//                        icon: CountryPicker(
//
//                            nameTextStyle: TextStyle(
//                              fontSize: 18.0,
//                              fontWeight: FontWeight.w700,
//                            ),
//                            dense: false,
//                            showFlag: true,  //displays flag, true by default
//                            showDialingCode: false, //displays dialing code, false by default
//                            showName: false, //displays country name, true by default
//                            showCurrency: false, //eg. 'British pound'
//                            showCurrencyISO: false, //eg. 'GBP'
//                            onChanged: (Country country) {
//                              setState(() {
//                                _selected = country;
//                              });
//                            },
//                            selectedCountry: _selected,
//                          ),
//
//                          hintText: 'Contact no',
//                          hintStyle: TextStyle(
//                            fontSize: 18.0,
//                          )
//                      ),
//                    ),
//                  ),
//
//
//
//
//
//                  InkWell(
//                    onTap: (){
//                      Navigator.pushNamed(context, '/');
//                    },
//                    child: Container(
//                      height: 45,
//                      width: MediaQuery.of(context).size.width/1.2,
//                      decoration: BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: [
//                              Color(0xff6bceff),
//                              Color(0xFF00abff),
//                            ],
//                          ),
//                          borderRadius: BorderRadius.all(
//                              Radius.circular(50)
//                          )
//                      ),
//                      child: Center(
//                        child: Text('Login'.toUpperCase(),
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//
////
////            SizedBox(
////              height: 50,
////            ),
////            InkWell(
////              child: Row(
////                mainAxisAlignment: MainAxisAlignment.center,
////                children: <Widget>[
////                  Text("Dnon't have an account ?"),
////                  Text("Sign Up",style: TextStyle(color: Color(0xff6bceff)),),
////                ],
////              ),
////              onTap: (){
////                Navigator.pushNamed(context, '/signup');
////              },
////            ),
//
//
//          ],
//
//        ),
//      ),
//    );
//  }
//}
//
//
//
//













//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:metrimonialsulook/Global/constant.dart';
//import 'package:metrimonialsulook/Modal/personmodel.dart';
//import 'package:metrimonialsulook/UI/Metrimonial_mainpage.dart';
//import 'package:metrimonialsulook/UI/profile.dart';
//
//class search extends StatefulWidget {
//  @override
//  _searchState createState() => _searchState();
//}
//
//class _searchState extends State<search> {
//  @override
//  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//
//  TextEditingController filgender = TextEditingController();
//  TextEditingController job = TextEditingController();
//  TextEditingController caste = TextEditingController();
//  TextEditingController education = TextEditingController();
//  TextEditingController filcity = TextEditingController();
//  TextEditingController filreligion = TextEditingController();
//  TextEditingController search_txt = TextEditingController();
//
//
//  var fil_gender;
//  var fil_religion;
//  var fil_caste;
//  var fil_education;
//  var fil_profession;
//  var fil_martialstatus;
//  var fil_city;
//  var first_age;
//  var end_age;
//  String search_x;
//  List search_list;
//  bool casteshow = false;
//  var caste_list = [
//    "Rajpoot",
//    "Butt",
//    "Jutt",
//    "Malik",
//    "Sheikh",
//    "Mughal",
//    "Gujjar",
//    "Qureshi",
//    "Pathan",
//    "Jatt",
//    "Awan",
//    "Parsi",
//    "Sayyed",
//    "Baloch",
//    "Ghosi",
//    "Kalash",
//    "Gujjar",
//    "Arain",
//    "Dalit",
//    "Bhils",
//    "Siddis",
//    "Dar",
//    "Kashmiri",
//    "Abro",
//    "Bhati",
//    "Ansari",
//    "other"
//  ];
//
//  bool jobshow = false;
//  var profession_list = [
//    "Chartered Accountant",
//    "MBBS Doctor",
//    "Marketing Manager",
//    "HR Manager",
//    "Telecommunication Engineer",
//    "project Manager",
//    "Creative Designer",
//    "Mechanical Engineer",
//    "Chemical Engineer",
//    "Biomedical Enginering",
//    "Electrical Engineer",
//    "Software Engineering",
//    "Megatronics Engineering",
//    "Civil Engineering",
//    "Architecture",
//    "Graphic designer",
//    "Bachelor in Computer Science",
//    "Aviation",
//    "University Lecturer",
//    "School Lecturer",
//    "College Lecturer"
//        "Lawyer",
//    "Physiotherapist",
//    "Supply Chain Manager",
//    "D-Pharmacy",
//    "Bachelors in Dental Surgery (BDS)",
//    "Sc Physiotherapy",
//    "Nursing",
//    "Medical Laboratory Technology",
//    "Doctor of physiotherapy",
//    "other"
//  ];
//
//  var religion_List = [
//    "Muslim",
//    "Athe",
//    "Bahá’í",
//    "Buddh",
//    "Christian",
//    "Confucian",
//    "Druze",
//    "Gnostic",
//    "Hindu",
//    "Jain",
//    "Juda",
//    "Rastafarian",
//    "Shinto",
//    "Sikh",
//    "Zoroastrian",
//    "Traditional African Religions",
//    "African Diaspora Religions",
//    "Indigenous American Religions",
//  ];
//
//  var martialstatus_list = [
//    'Never married',
//    'One mariage',
//    'Two marriages',
//    'Three marriages',
//    'Four marriages'
//  ];
//
//  var lifestandard_list = [
//    'poor',
//    'lower middle class',
//    'Middle Class',
//    'Rich',
//  ];
//
//  bool educationshow = false;
//  var education_list = [
//    "illiterate",
//    "Middle",
//    "Matric",
//    "Intermediate",
//    "Diploma",
//    "Bs",
//    "BSc",
//    "MSc",
//    "Mphil",
//    "BA",
//    "BCom",
//    "MA",
//    "MBBS",
//    "Engineering",
//    "LLB",
//    "BBA",
//    "MBA",
//    "PhD",
//    "other"
//  ];
//
//  var gender_list = [
//    'Male',
//    'Female',
//    'Others',
//  ];
//
//  void initState(){
//    super.initState();
//    data_function();
//    getperson();
//  }
//
//  List data;
//  String l_start="";
//  String l_end="";
//  String look_caste="";
//  String look_profession ="";
//  String look_education="";
//  String look_country="" ;
//
//  data_function() async {
//    data=await read_data_of_list();
//    setState(() {
//      print("mu data"+data.toString());
//    });
//
//    if(data !=null) {
//      l_start = data[20];
//      l_end = data[21];
//      look_caste = data[19];
//      look_profession = data[25];
//      look_education = data[22];
//      look_country = data[28];
//    }
//
//  }
//
//
//
//  Stream<List<Person>> getperson() =>
//      FirebaseFirestore.instance.collection('Male').
//      where('profession', isGreaterThanOrEqualTo: search_x=='' || search_x==null?null:search_x.substring(0, 1).toUpperCase() + search_x.substring(1)).
//      where('profession', isLessThan: search_x=='' || search_x==null?null:search_x.substring(0, 1).toUpperCase() + search_x.substring(1)+'z').
//      where('city', isGreaterThanOrEqualTo: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)).
//      where('city', isLessThan: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)+'z').
//      snapshots().map((event) =>
//          event.docs.map((e) => Person.fromJson(e.data())).toList());
//
//
//
//
//  Widget build(BuildContext context) {
//
//
//    return Scaffold(
//      //appbar
//
//      key: _scaffoldKey,
//      endDrawer: Drawer(
//        child: SingleChildScrollView(
//          child: Container(
//            color: Colors.white,
//            child: Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Column(children: [
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  color: Colors.white,
//                  child: Center(
//                    child: Text(
//                      "Filters",
//                      style: TextStyle(
//                        fontSize: 24.0,
//                        color: appColor,
//                        fontWeight: FontWeight.w500,
//                      ),
//                    ),
//                  ),
//                ),
//
////                Container(
////                  width: MediaQuery.of(context).size.width,
////                  height: MediaQuery.of(context).size.height * 0.1,
////                  child: DropdownButtonFormField(
////                    isDense: true,
////                    decoration: InputDecoration(
////                      enabledBorder: OutlineInputBorder(
////                        borderSide: BorderSide(color: appColor, width: 0.0),
////                      ),
////                      border: new OutlineInputBorder(
////                        borderRadius: new BorderRadius.circular(10.0),
////                        borderSide: new BorderSide(color: appColor),
////                      ),
////                    ),
////                    hint: fil_gender == null
////                        ? Text(
////                            ' Gender',
////                            style: TextStyle(color: appColor),
////                          )
////                        : Text(
////                            fil_gender,
////                            style: TextStyle(color: appColor),
////                          ),
////                    isExpanded: true,
////                    iconEnabledColor: appColor,
////                    iconDisabledColor: appColor,
////                    iconSize: 30.0,
////                    style: TextStyle(color: appColor),
////                    items: gender_list.map(
////                      (val) {
////                        return DropdownMenuItem<String>(
////                          value: val,
////                          child: Text(val),
////                        );
////                      },
////                    ).toList(),
////                    onChanged: (val) {
////                      setState(
////                        () {
////                          fil_gender = val;
////                        },
////                      );
////                    },
////                  ),
////                ),
//
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: DropdownButtonFormField(
//                    isDense: true,
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                        borderSide: new BorderSide(color: appColor),
//                      ),
//                    ),
//                    hint: fil_religion == null
//                        ? Text(
//                      'Religion',
//                      style: TextStyle(color: appColor),
//                    )
//                        : Text(
//                      fil_religion,
//                      style: TextStyle(color: appColor),
//                    ),
//                    isExpanded: true,
//                    iconEnabledColor: appColor,
//                    iconDisabledColor: appColor,
//                    iconSize: 30.0,
//                    style: TextStyle(color: appColor),
//                    items: religion_List.map(
//                          (val) {
//                        return DropdownMenuItem<String>(
//                          value: val,
//                          child: Text(val),
//                        );
//                      },
//                    ).toList(),
//                    onChanged: (val) {
//                      setState(
//                            () {
//                          fil_religion = val;
//                        },
//                      );
//                    },
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: DropdownButtonFormField(
//                    isDense: true,
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                        borderSide: new BorderSide(color: appColor),
//                      ),
//                    ),
//                    hint: fil_caste == null
//                        ? Text(
//                      ' caste',
//                      style: TextStyle(color: appColor),
//                    )
//                        : Text(
//                      fil_caste,
//                      style: TextStyle(color: appColor),
//                    ),
//                    isExpanded: true,
//                    iconEnabledColor: appColor,
//                    iconDisabledColor: appColor,
//                    iconSize: 30.0,
//                    style: TextStyle(color: appColor),
//                    items: caste_list.map(
//                          (val) {
//                        return DropdownMenuItem<String>(
//                          value: val,
//                          child: Text(val),
//                        );
//                      },
//                    ).toList(),
//                    onChanged: (val) {
//                      setState(
//                            () {
//                          if (val == "other") {
//                            casteshow = true;
//                          } else {
//                            fil_caste = val;
//                            casteshow = false;
//                          }
//                        },
//                      );
//                    },
//                  ),
//                ),
//
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Visibility(
//                  visible: casteshow,
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height * 0.1,
//                    child: TextFormField(
//                      onChanged: (text) {
//                        setState(() {
//                          fil_caste = text;
//                        });
//                      },
//                      controller: job,
//                      decoration: new InputDecoration(
//                        hintText: "caste",
//                        hintStyle: TextStyle(
//                          color: appColor,
//                          fontFamily: "poppins",
//                        ),
//                        fillColor: Colors.white,
//                        errorStyle:
//                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        border: new OutlineInputBorder(
//                          borderRadius: new BorderRadius.circular(10.0),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//
//                Visibility(
//                  visible: casteshow,
//                  child: SizedBox(
//                    height: 20.0,
//                  ),
//                ),
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: DropdownButtonFormField(
//                    isDense: true,
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
////                      errorText: "",
//                      errorStyle:
//                      TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                        borderSide: new BorderSide(color: appColor),
//                      ),
//                    ),
//                    hint: fil_education == null
//                        ? Text(
//                      ' Education',
//                      style: TextStyle(color: appColor),
//                    )
//                        : Text(
//                      fil_education,
//                      style: TextStyle(color: appColor),
//                    ),
//                    isExpanded: true,
//                    iconEnabledColor: appColor,
//                    iconDisabledColor: appColor,
//                    iconSize: 30.0,
//                    style: TextStyle(color: appColor),
//                    items: education_list.map(
//                          (val) {
//                        return DropdownMenuItem<String>(
//                          value: val,
//                          child: Text(val),
//                        );
//                      },
//                    ).toList(),
//                    onChanged: (val) {
//                      setState(
//                            () {
//                          if (val == "other") {
//                            educationshow = true;
//                          } else {
//                            fil_education = val;
//                          }
//                        },
//                      );
//                    },
//                  ),
//                ),
//
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                //fil_education others
//                Visibility(
//                  visible: educationshow,
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height * 0.1,
//                    child: TextFormField(
//                      onChanged: (text) {
//                        setState(() {
//                          fil_education = text;
//                        });
//                      },
//                      controller: education,
//                      decoration: new InputDecoration(
//                        hintText: " Education",
//                        hintStyle: TextStyle(
//                          color: appColor,
//                          fontFamily: "poppins",
//                        ),
//                        fillColor: Colors.white,
//                        errorStyle:
//                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        border: new OutlineInputBorder(
//                          borderRadius: new BorderRadius.circular(10.0),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//
//                Visibility(
//                  visible: educationshow,
//                  child: SizedBox(
//                    height: 20.0,
//                  ),
//                ),
//
//                //job
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: DropdownButtonFormField(
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                        borderSide: new BorderSide(color: appColor),
//                      ),
//                    ),
//                    hint: fil_profession == null
//                        ? Text(
//                      ' profession',
//                      style: TextStyle(color: appColor),
//                    )
//                        : Text(
//                      fil_profession,
//                      style: TextStyle(color: appColor),
//                    ),
//                    isExpanded: true,
//                    iconEnabledColor: appColor,
//                    iconDisabledColor: appColor,
//                    iconSize: 30.0,
//                    style: TextStyle(color: appColor),
//                    items: profession_list.map(
//                          (val) {
//                        return DropdownMenuItem<String>(
//                          value: val,
//                          child: Text(val),
//                        );
//                      },
//                    ).toList(),
//                    onChanged: (val) {
//                      setState(
//                            () {
//                          if (val == "other") {
//                            jobshow = true;
//                          } else {
//                            fil_profession = val;
//                          }
//                        },
//                      );
//                    },
//                  ),
//                ),
//
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Visibility(
//                  visible: jobshow,
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: MediaQuery.of(context).size.height * 0.1,
//                    child: TextFormField(
//                      onChanged: (text) {
//                        setState(() {
//                          fil_profession = text;
//                          jobshow = false;
//                        });
//                      },
//                      controller: job,
//                      decoration: new InputDecoration(
//                        hintText: " Job",
//                        hintStyle: TextStyle(
//                          color: appColor,
//                          fontFamily: "poppins",
//                        ),
//                        fillColor: Colors.white,
//                        errorStyle:
//                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color: appColor, width: 0.0),
//                        ),
//                        border: new OutlineInputBorder(
//                          borderRadius: new BorderRadius.circular(10.0),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//
//                Visibility(
//                  visible: jobshow,
//                  child: SizedBox(
//                    height: 20.0,
//                  ),
//                ),
//
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: DropdownButtonFormField(
//                    decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                        borderSide: new BorderSide(color: appColor),
//                      ),
//                    ),
//                    hint: fil_martialstatus == null
//                        ? Text(
//                      ' Martial Status',
//                      style: TextStyle(color: appColor),
//                    )
//                        : Text(
//                      fil_martialstatus,
//                      style: TextStyle(color: appColor),
//                    ),
//                    isExpanded: true,
//                    iconEnabledColor: appColor,
//                    iconDisabledColor: appColor,
//                    iconSize: 30.0,
//                    style: TextStyle(color: appColor),
//                    items: martialstatus_list.map(
//                          (val) {
//                        return DropdownMenuItem<String>(
//                          value: val,
//                          child: Text(val),
//                        );
//                      },
//                    ).toList(),
//                    onChanged: (val) {
//                      setState(
//                            () {
//                          fil_martialstatus = val;
//                        },
//                      );
//                    },
//                  ),
//                ),
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Container(
//                  width: MediaQuery.of(context).size.width,
//                  height: MediaQuery.of(context).size.height * 0.1,
//                  child: TextFormField(
//                    onChanged: (text) {
//                      setState(() {
//                        fil_city = text;
//                      });
//                    },
//                    controller: filcity,
//                    autovalidateMode: AutovalidateMode.onUserInteraction,
//                    decoration: new InputDecoration(
//                      hintText: "City",
//                      hintStyle: TextStyle(
//                        color: appColor,
//                        fontFamily: "poppins",
//                      ),
//                      fillColor: Colors.white,
//                      errorStyle:
//                      TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: appColor, width: 0.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                    ),
//                    style: new TextStyle(
//                      fontFamily: "Poppins",
//                    ),
//                  ),
//                ),
//
//                SizedBox(
//                  height: 20.0,
//                ),
//
//                Container(
//                    padding:
//                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(Radius.circular(2)),
//                      color: Colors.white,
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: [
//                        Expanded(
//                          flex: 4,
//                          child: Container(
//                            child: TextField(
//                              onChanged: (val) {
//                                setState(() {
//                                  first_age = val;
//                                });
//                              },
//                              decoration: InputDecoration(
//                                  border: InputBorder.none,
//                                  icon: Icon(
//                                    Icons.calendar_today_sharp,
//                                    color: red,
//                                  ),
//                                  hintText: 'Age',
//                                  hintStyle: TextStyle(
//                                    fontSize: 19.0,
//                                  )),
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          flex: 2,
//                          child: Text(
//                            "To",
//                            style: TextStyle(
//                              fontSize: 19.0,
//                              fontWeight: FontWeight.w500,
//                              color: appColor,
//                            ),
//                          ),
//                        ),
//                        Expanded(
//                          flex: 4,
//                          child: Container(
//                            child: TextField(
//                              onChanged: (val) {
//                                setState(() {
//                                  end_age = val;
//                                });
//                              },
//                              decoration: InputDecoration(
//                                  border: InputBorder.none,
//                                  hintText: 'Age',
//                                  hintStyle: TextStyle(
//                                    fontSize: 19.0,
//                                  )),
//                            ),
//                          ),
//                        ),
//                      ],
//                    )),
//
//                Container(
//                  color: Colors.white,
//                  height: MediaQuery.of(context).size.height * 0.04,
//                ),
//
//                Padding(
//                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
//                  child: GestureDetector(
//                    onTap: () {
//
//
//                      Navigator.pop(context,
//                          MaterialPageRoute(builder: (context) => search()));
//                    },
//                    child: Container(
//                      width: MediaQuery.of(context).size.width * 0.6,
//                      height: MediaQuery.of(context).size.height * 0.07,
//                      decoration: BoxDecoration(
//                          gradient: LinearGradient(
//                            colors: [
//                              appColor2,
//                              appColor,
//                            ],
//                          ),
//                          borderRadius: BorderRadius.all(Radius.circular(5))),
//                      child: Center(
//                        child: Text(
//                          'Apply'.toUpperCase(),
//                          style: TextStyle(
//                              fontSize: 18.0,
//                              color: Colors.white,
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//
//                Container(
//                  color: Colors.white,
//                  height: MediaQuery.of(context).size.height * 0.04,
//                ),
//              ]),
//            ),
//          ),
//        ),
//      ),
//
//      //body
//      body: SingleChildScrollView(
//
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//
//
//
//
//            SizedBox(
//              height: 50.0,
//            ),
//
//
//
//
//            Row(
//              children: [
//
//                SizedBox(
//                  width: 10.0,
//                ),
//
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: GestureDetector(
//                    onTap: () {},
//                    child: Material(
//                      elevation: 10.0,
//                      borderRadius: BorderRadius.circular(10.0),
//                      child: Container(
//                        decoration: BoxDecoration(
//                          color: Colors.white70,
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
//                        child: Padding(
//                          padding: const EdgeInsets.all(10.0),
//                          child: Center(
//                            child: Icon(
//                              Icons.arrow_back_ios,
//                              size: 30.0,
//                              color: red,
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//
//                Spacer(),
//                Align(
//                  alignment: Alignment.centerLeft,
//                  child: GestureDetector(
//                    onTap: () {
//                      if (_scaffoldKey.currentState.isDrawerOpen) {
//                        Navigator.pop(context);
//                      }
//                      {
//                        _scaffoldKey.currentState.openEndDrawer();
//                      }
//                    },
//                    child: Material(
//                      elevation: 10.0,
//                      borderRadius: BorderRadius.circular(10.0),
//                      child: Container(
//                        decoration: BoxDecoration(
////                            color: light_blue,
//                          borderRadius: BorderRadius.circular(10.0),
//                        ),
//                        child: Padding(
//                          padding: const EdgeInsets.all(10.0),
//                          child: Center(
//                            child: Row(
//                              children: [
//                                Text(
//                                  "Filters",
//                                  maxLines: 1,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: TextStyle(
//                                    color: red,
//                                    fontSize: 20.0,
//                                    fontFamily: "poppins",
//                                    fontWeight: FontWeight.w500,
//                                  ),
//                                ),
//                                Icon(
//                                  Icons.filter_alt_outlined,
//                                  size: 30.0,
//                                  color: red,
//                                ),
//                              ],
//                            ),
//                          ),
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                SizedBox(
//                  width: 10.0,
//                ),
//              ],
//            ),
//
////            Padding(
////              padding: const EdgeInsets.only(left: 20.0,top: 10.0),
////              child: GestureDetector(
////                onTap: () {
////                  if (_scaffoldKey.currentState.isDrawerOpen) {
////                    Navigator.pop(context);
////                  } {
////                    _scaffoldKey.currentState.openEndDrawer();
////                  }
////                },
////                child: Container(
////                  height: 30,
////                  width: MediaQuery.of(context).size.width*0.4,
////                  decoration: BoxDecoration(
////                   color:appColor,
////                      borderRadius: BorderRadius.all(Radius.circular(10))),
////                  child: Row(
////                    mainAxisAlignment: MainAxisAlignment.center,
////                    children: [
////                      Icon(
////                        Icons.filter_alt_outlined,
////                        color: Colors.white,
////                      ),
////
////                      Text(
////                        'Filter'.toUpperCase(),
////                        style: TextStyle(
////                            fontSize: 18.0,
////                            color: Colors.white,
////                            fontWeight: FontWeight.bold),
////                      ),
////
////                    ],
////                  ),
////                ),
////              ),
////            ),
//
//
//            SizedBox(
//              height: 10.0,
//            ),
//
//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Material(
//                elevation: 10.0,
//                borderRadius: new BorderRadius.circular(20.0),
//                child: Container(
//                  width: MediaQuery.of(context).size.width,
//                  height:50,
//
//                  child: TextFormField(
//                    onChanged: (text) {
//                      setState(() {
//                        search_x = text;
//
//
//                      });
//                    },
//                    controller: search_txt,
//                    decoration: new InputDecoration(
//                      prefixIcon: Icon(Icons.search,color: red,size: 25.0,),
//                      hintText: "Search",
//                      hintStyle: TextStyle(
//                        color:red,
//                        fontFamily: "poppins",
//                      ),
//                      fillColor: Colors.grey[400],
//
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(20.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: red, width: 2.0),
//                        borderRadius: new BorderRadius.circular(20.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(20.0),
//                      ),
//                    ),
//                    style: new TextStyle(
//                      fontFamily: "Poppins",
//                    ),
//                  ),
//                ),
//              ),
//            ),
//
//
//
//            StreamBuilder<List<Person>>(
//                stream: getperson(),
//                builder: (context, snapshot) {
//                  return ListView.builder(
//                      shrinkWrap: true,
//                      physics: NeverScrollableScrollPhysics(),
//                      itemCount: snapshot.data?.length ?? 0,
//                      itemBuilder: (context, index) {
//
//
////                        if(snapshot.data[index]==read_data_of_list())
////                        print("country"+snapshot.data[index].country);
//
//                        return GestureDetector(
//                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => profile()));
//                          },
//                          child: Container(
//                            width: MediaQuery.of(context).size.width,
//                            height: 160,
//                            child: Card(
//                              elevation: 10.0,
//                              shape: RoundedRectangleBorder(
//                                borderRadius: BorderRadius.circular(20.0),
//                              ),
//                              child: Padding(
//                                padding: const EdgeInsets.only(
//                                    left: 10.0,
//                                    right: 10.0,
//                                    top: 20.0,
//                                    bottom: 20.0),
//                                child: Column(
//                                  children: [
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.start,
//                                      children: [
//                                        //filfile
//                                        Align(
//                                          alignment: Alignment.topLeft,
//                                          child: Material(
//                                            elevation: 10.0,
//                                            borderRadius: BorderRadius.all(
//                                                Radius.circular(20.0)),
//                                            child: ClipRRect(
//                                              child: FadeInImage(
//                                                  fit: BoxFit.fill,
//                                                  width:80,
//                                                  height:90,
//                                                  image: NetworkImage(
//                                                      snapshot.data[index].image),
//                                                  placeholder: AssetImage("Assets/images/hover.gif",
//                                                  )),
//
//                                              borderRadius: BorderRadius.all(
//                                                  Radius.circular(20.0)),
//
//
//                                            ),
//                                          ),
//                                        ),
//
//                                        SizedBox(
//                                          width: 20.0,
//                                        ),
//
//                                        Container(
//                                          height:90,
//                                          width: MediaQuery.of(context).size.width-150,
//
//                                          child: Column(
//                                            crossAxisAlignment: CrossAxisAlignment.start,
//                                            children: [
//
//
//                                              Container(
//                                                height: 20.0,
//                                                width: 200,
//
//                                                child: Row(
//                                                  children: [
//
//                                                    Image.asset(
//                                                      "Assets/images/user.png",
//                                                      color: grey,
//                                                      height: 18.0,
//                                                      width: 18.0,
//                                                    ),
//
//                                                    SizedBox(
//                                                      width: 10,
//                                                    ),
//
//
//                                                    Container(
//                                                      height: 20.0,
//                                                      width: 170,
//                                                      child: Text(
//                                                        snapshot.data[index].name != null
//                                                            ? snapshot.data[index].name
//                                                            : "name",
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        style: TextStyle(
//                                                          color: grey,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight: FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//
//
//                                              Container(
//                                                height: 20,
//                                                width:155,
//                                                child: Row(
//                                                  children: [
//                                                    Icon(
//                                                      CupertinoIcons.calendar_circle,
//                                                      color: grey,
//                                                      size: 15.0,
//                                                    ),
//
//                                                    SizedBox(
//                                                      width: 10,
//                                                    ),
//
//                                                    Container(
//                                                      height: 20.0,
//                                                      width:60,
//                                                      child: Text(
//                                                        snapshot
//                                                            .data[
//                                                        index]
//                                                            .birth
//                                                            .toString() !=
//                                                            null
//                                                            ? snapshot.data[index]
//                                                            .birth
//                                                            .toString() +" Year" +
//                                                            ", "
//                                                            : "Age",
//                                                        maxLines: 1,
//                                                        overflow:
//                                                        TextOverflow.ellipsis,
//                                                        style: TextStyle(
//                                                          color: grey,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight:
//                                                          FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                    Container(
//                                                      height: 20,
//                                                      width:40,
//                                                      child: Text(
//                                                        snapshot.data[index]
//                                                            .height
//                                                            .toString() !=
//                                                            null
//                                                            ? snapshot.data[index]
//                                                            .height
//                                                            .toString()
//                                                            : "Height",
//                                                        maxLines: 1,
//                                                        overflow:
//                                                        TextOverflow.ellipsis,
//                                                        style: TextStyle(
//                                                          color: grey,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight:
//                                                          FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//
//                                              Container(
//                                                height: 20.0,
//                                                width: 150,
//                                                child: Row(
//                                                  children: [
//
//                                                    Image.asset(
//                                                      "Assets/images/city.png",
//                                                      color: grey,
//                                                      height: 20.0,
//                                                      width: 20.0,
//                                                    ),
//
//                                                    SizedBox(
//                                                      width: 10,
//                                                    ),
//
//
//                                                    Container(
//                                                      height: 20.0,
//                                                      width: 120,
//                                                      child: Text(
//                                                        snapshot.data[index]. country!= null || snapshot.data[index].country !=""
//                                                            ? snapshot.data[index].country+" "+snapshot.data[index].city
//                                                            : "Country",
//                                                        maxLines: 1,
//                                                        overflow: TextOverflow.ellipsis,
//                                                        style: TextStyle(
//                                                          color: grey,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight: FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//
//
//                                              Container(
//                                                height: 20,
//                                                width: MediaQuery.of(context).size.width,
//                                                child: Row(
//                                                  children: [
//
//                                                    Image.asset(
//                                                      "Assets/images/cast.png",
//                                                      color:grey,
//                                                      height: 20.0,
//                                                      width: 20.0,
//                                                    ),
//
//                                                    SizedBox(
//                                                      width: 10,
//                                                    ),
//
//                                                    Container(
//                                                      height: 20,
//                                                      width:100,
//                                                      child: Text(
//                                                        snapshot.data[index].caste !=
//                                                            null
//                                                            ? snapshot
//                                                            .data[index].caste
//                                                            : "caste",
//                                                        maxLines: 1,
//                                                        overflow:
//                                                        TextOverflow.ellipsis,
//                                                        style: TextStyle(
//                                                          color: grey,
//                                                          fontSize: 14.0,
//                                                          fontFamily: "poppins",
//                                                          fontWeight: FontWeight.w500,
//                                                        ),
//                                                      ),
//                                                    ),
//                                                  ],
//                                                ),
//                                              ),
//
//                                              SizedBox(
//                                                height: 10.0,
//                                              ),
//                                            ],
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//
//                                    Container(
//                                      width: MediaQuery.of(context).size.width,
//                                      height: 20.0,
//                                      child: Row(
//                                        children: [
////                                                  SizedBox(
////                                                    width: 20.0,
////                                                  ),
//                                          Icon(CupertinoIcons.heart_solid,
//                                            color: red,
//                                            size: 20.0,),
//
//                                          Spacer(),
//
//                                          Material(
//                                            elevation: 10.0,
//                                            borderRadius:
//                                            BorderRadius.circular(
//                                                5.0),
//                                            child: Container(
//                                              height:20,
//                                              width:MediaQuery.of(context).size.width-200,
//                                              decoration: BoxDecoration(
//                                                color:light_green,
//                                                borderRadius:
//                                                BorderRadius.circular(
//                                                    5.0),
//                                              ),
//
//                                              child: Padding(
//                                                padding: const EdgeInsets.all(2.0),
//                                                child: Center(
//                                                  child: Text(
//                                                    "View",
//                                                    maxLines: 1,
//                                                    overflow:
//                                                    TextOverflow.ellipsis,
//                                                    style: TextStyle(
//                                                      color: Colors.white,
//                                                      fontSize: 14.0,
//                                                      fontFamily: "poppins",
//                                                      fontWeight: FontWeight.w500,
//                                                    ),
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                          ),
//                                          Spacer(),
//
//                                          Icon(CupertinoIcons.star_fill,
//                                            color: Color(0xffFFD700),
//                                            size: 20.0,),
//
//
//                                        ],
//                                      ),
//                                    )
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        );
//                      });
//                }),
//          ],
//        ),
//      ),
//    );
//  }
//}
////
////var _genderRadioBtnVal = "";
////var _marriageRadioBtnVal = "";
////var _religionRadioBtnVal = "";
////var _LifestandardRadioBtnVal = "";
////var _employedRadioBtnVal = "";
////
////void _handleGenderChange(String value) {
////  setState(() {
////    _genderRadioBtnVal = value;
////  });
////}
////
////void _handleMarriageChange(String value) {
////  setState(() {
////    _marriageRadioBtnVal = value;
////  });
////}
////
////void _handleReligionChange(String value) {
////  setState(() {
////    _religionRadioBtnVal = value;
////  });
////}
////
////void _handleLifestandardChange(String value) {
////  setState(() {
////    _LifestandardRadioBtnVal = value;
////  });
////}
////
////void _handleEmployedChange(String value) {
////  setState(() {
////    _employedRadioBtnVal = value;
////  });
////}
//
////Container(
////padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
////decoration: BoxDecoration(
////borderRadius: BorderRadius.all(Radius.circular(2)),
////color: Colors.white,
////),
////child: Row(
////mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////children: <Widget>[
////IconButton(
////icon: Image.asset(
////"Images/Gender.png",
////color: appColor,
////height: 28.0,
////width: 28.0,
////),
////),
////Expanded(
////child: Radio<String>(
////activeColor: appColor,
////value: "Male",
////groupValue: _genderRadioBtnVal,
////onChanged: _handleGenderChange,
////),
////),
////Expanded(flex: 3, child: Text("Male")),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "Female",
////groupValue: _genderRadioBtnVal,
////onChanged: _handleGenderChange,
////),
////),
////Expanded(flex: 3, child: Text("Female")),
////],
////),
////),
////
////Container(
////height: 20,
////color: Colors.white,
////),
//////_marriagestatus
////
////Container(
////padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
////decoration: BoxDecoration(
////borderRadius: BorderRadius.all(Radius.circular(2)),
////color: Colors.white,
////),
////child: Row(
////mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////children: <Widget>[
////IconButton(
////icon: Image.asset(
////"Images/matrimonial.png",
////color: appColor,
////height: 28.0,
////width: 28.0,
////),
////),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "Never married",
////groupValue: _marriageRadioBtnVal,
////onChanged: _handleMarriageChange,
////),
////),
////Expanded(flex: 3, child: Text("Never married")),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "married",
////groupValue: _marriageRadioBtnVal,
////onChanged: _handleMarriageChange,
////),
////),
////Expanded(flex: 3, child: Text("married")),
////],
////),
////),
////
////Container(
////height: 20,
////color: Colors.white,
////),
////
//////religion
////
////Container(
////padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
////decoration: BoxDecoration(
////borderRadius: BorderRadius.all(Radius.circular(2)),
////color: Colors.white,
////),
////child: Row(
////mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////children: <Widget>[
////IconButton(
////icon: Image.asset(
////"Images/religion.png",
////color: appColor,
////height: 28.0,
////width: 28.0,
////),
////),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "Muslim",
////groupValue: _religionRadioBtnVal,
////onChanged: _handleReligionChange,
////),
////),
////Expanded(flex: 3, child: Text("Muslim")),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "Non muslim",
////groupValue: _religionRadioBtnVal,
////onChanged: _handleReligionChange,
////),
////),
////Expanded(flex: 3, child: Text("Non Muslim")),
////],
////),
////),
////
////Container(
////height: 20,
////color: Colors.white,
////),
////
//////EMPLOYED
////Container(
////padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
////decoration: BoxDecoration(
////borderRadius: BorderRadius.all(Radius.circular(2)),
////color: Colors.white,
////),
////child: Row(
////mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////children: <Widget>[
////IconButton(
////icon: Image.asset(
////"Images/employee.png",
////color: appColor,
////height: 28.0,
////width: 28.0,
////),
////),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "employed",
////groupValue: _employedRadioBtnVal,
////onChanged: _handleEmployedChange,
////),
////),
////Expanded(flex: 3, child: Text("employed")),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "unemployed",
////groupValue: _employedRadioBtnVal,
////onChanged: _handleEmployedChange,
////),
////),
////Expanded(flex: 3, child: Text("unemployed")),
////],
////),
////),
////Container(
////color: Colors.white,
////height: MediaQuery.of(context).size.height * 0.04,
////),
////
//////life standard
////
////
////Container(
////padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
////decoration: BoxDecoration(
////borderRadius: BorderRadius.all(Radius.circular(2)),
////color: Colors.white,
////),
////child: Row(
////mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////children: <Widget>[
////IconButton(
////icon: Image.asset(
////"Images/healths.png",
////color: appColor,
////height: 28.0,
////width: 28.0,
////),
////),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "Rich",
////groupValue: _LifestandardRadioBtnVal,
////onChanged: _handleLifestandardChange,
////),
////),
////Expanded(flex: 3, child: Text("Rich")),
////Expanded(
////flex: 1,
////child: Radio<String>(
////activeColor: appColor,
////value: "mediocre",
////groupValue: _LifestandardRadioBtnVal,
////onChanged: _handleLifestandardChange,
////),
////),
////Expanded(flex: 3, child: Text("Middle class")),
////],
////),
////),
////Container(
////color: Colors.white,
////height: MediaQuery.of(context).size.height * 0.04,
////),






































//add_data_to_list

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
