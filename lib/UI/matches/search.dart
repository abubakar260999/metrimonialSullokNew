import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../../Global/value.dart';
import '../../Modal/personmodel.dart';

class search extends StatefulWidget {
  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController filage = TextEditingController();

//  TextEditingController job = TextEditingController();
//  TextEditingController caste = TextEditingController();
//  TextEditingController education = TextEditingController();
  TextEditingController filcity = TextEditingController();
  TextEditingController filsect = TextEditingController();
  TextEditingController name_txt = TextEditingController();

  var fil_name;
  var fil_sect;
  var fil_caste;
  var fil_education;
  var fil_profession;
  var fil_martialstatus;
  var fil_city;
  int? fil_age;

  var zero = 0;

  String? search_x;
  List search_list = [];
  bool casteshow = false;

  var gender;

  void initState() {
    super.initState();
    data_function();
  }

  List data = [];
  String l_start = "";
  String l_end = "";
  String look_caste = "";
  String look_profession = "";
  String look_education = "";
  String look_country = "";

  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      gender = data[3];
    }
    if (gender == 'Male') {
      gender = 'Female';
    } else {
      gender = 'Male';
    }
    setState(() {
      print(gender);
    });
    if (gender != null) {
      getperson();
    }
  }

  Stream<List<Person>> getperson() => FirebaseFirestore.instance
      .collection(gender)
      .where('name',
          isGreaterThanOrEqualTo:
              (fil_name == '' || fil_name == null) ? '' : fil_name)
      .where('name',
          isLessThan:
              (fil_name == '' || fil_name == null) ? '' + 'z' : fil_name + 'z')
      .orderBy('name', descending: true)
      .where('caste', isEqualTo: fil_caste)
      .where('sect', isEqualTo: fil_sect)
      .where('profession', isEqualTo: fil_profession)
      .where('education', isEqualTo: fil_education)
//      .where('martialstatus', isEqualTo: fil_martialstatus)
      .where('city',
          isEqualTo: fil_city == '' || fil_city == null
              ? null
              : fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1))
      .snapshots()
      .map((event) => event.docs.map((e) => Person.fromJson(e.data())).toList())
      .map((event) => event
          .where((element) =>
              (element.birth == '' || element.birth == null
                  ? zero
                  : int.parse(element.birth)) <=
              (fil_age ?? 120))
          .toList());

//  Stream<List<Person>> getperson() => FirebaseFirestore.instance
//      .collection(gender)
//      .where('name', isGreaterThanOrEqualTo: (fil_name == '' || fil_name == null)
//          ? ''
//          : fil_name)
//      .where('name', isLessThan: (fil_name == '' || fil_name == null)
//          ? ''+'z'
//          : fil_name +'z')
//      .where('caste', isEqualTo: fil_caste)
//      .where('sect', isEqualTo:   fil_sect)
//      .where('profession', isEqualTo: fil_profession)
//      .where('education', isEqualTo: fil_education)
////      .where('martialstatus', isEqualTo: fil_martialstatus)
//      .where('city',
//          isEqualTo: fil_city == '' || fil_city == null
//              ? null
//              : fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1))
//      .snapshots()
//      .map((event) => event.docs.map((e) => Person.fromJson(e.data())).toList())
//      .map((event) =>
//      event
//          .where((element) =>(element.birth == '' || element.birth == null ?zero: int.parse(element.birth)) <= (fil_age==null?120:fil_age)
//  ).toList());

//  Stream<List<Caste>> getcaste() => FirebaseFirestore.instance
//      .collection('Caste')
//      .snapshots()
//      .map((event) => event.docs.map((e) => Caste.fromJson(e.data())).toList());
//
//  Stream<List<Education>> geteducation() => FirebaseFirestore.instance
//      .collection('Education')
//      .snapshots()
//      .map((event) =>
//          event.docs.map((e) => Education.fromJson(e.data())).toList());
//
//  Stream<List<Profession>> getprofession() => FirebaseFirestore.instance
//      .collection('Profession')
//      .snapshots()
//      .map((event) =>
//          event.docs.map((e) => Profession.fromJson(e.data())).toList());

  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      backgroundColor: concolor,
      key: _scaffoldKey,
      endDrawer: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0)),
        ),
        child: Drawer(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Center(
                              child: Icon(
                                Icons.close_rounded,
                                size: 40.0,
                                color: appcolor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Filters",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: appcolor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
//                  StreamBuilder<List<Caste>>(
//                    stream: getcaste(),
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      height: 58,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide:
                                new BorderSide(color: appcolor, width: 2.0),
                          ),
                        ),
                        hint: fil_caste == null
                            ? Text(
                                'Filter By Caste',
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                fil_caste,
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                        isExpanded: true,
                        icon: Icon(Icons.filter_list),
                        iconEnabledColor: appcolor,
                        iconDisabledColor: appcolor,
                        iconSize: 30.0,
                        style: TextStyle(
                            color: appcolor, fontWeight: FontWeight.bold),
                        items:
//                              snapshot.data.map(
                            caste_list.map(
                          (val) {
                            print("heelo");
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
//                                    child: Text(val.caste),
//                                    value: val.caste,
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              fil_caste = val;
                            },
                          );
                        },
                      ),
                    ),
                  ),
//              ;
//                      } else {
//                        return Center(child: CircularProgressIndicator());
//                      }
//                    },
//                  ),

                  SizedBox(
                    height: 20.0,
                  ),
//                  StreamBuilder<List<Profession>>(
//                    stream: getprofession(),
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      height: 58,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide:
                                new BorderSide(color: appcolor, width: 2.0),
                          ),
                        ),
                        hint: fil_profession == null
                            ? Text(
                                'Filter By Profession',
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                fil_profession,
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                        isExpanded: true,
                        icon: Icon(Icons.filter_list),
                        iconEnabledColor: appcolor,
                        iconDisabledColor: appcolor,
                        iconSize: 30.0,
                        style: TextStyle(
                            color: appcolor, fontWeight: FontWeight.bold),
                        items:
//                              snapshot.data.map(
                            profession_list.map(
                          (val) {
                            print("heelo");
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              fil_profession = val;
                            },
                          );
                        },
                      ),
                    ),
                  ),
//              ;
//                      } else {
//                        return Center(child: CircularProgressIndicator());
//                      }
//                    },
//                  ),

                  SizedBox(
                    height: 20.0,
                  ),
//                  StreamBuilder<List<Education>>(
//                    stream: geteducation(),
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      height: 58,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide:
                                new BorderSide(color: appcolor, width: 2.0),
                          ),
                        ),
                        hint: fil_education == null
                            ? Text(
                                'Filter By  Education',
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                fil_education,
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                        isExpanded: true,
                        icon: Icon(Icons.filter_list),
                        iconEnabledColor: appcolor,
                        iconDisabledColor: appcolor,
                        iconSize: 30.0,
                        style: TextStyle(
                            color: appcolor, fontWeight: FontWeight.bold),
                        items: education_list.map(
                          (val) {
                            print("heelo");
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              fil_education = val;
                            },
                          );
                        },
                      ),
                    ),
                  ),
//              ;
//                      } else {
//                        return Center(child: CircularProgressIndicator());
//                      }
//                    },
//                  ),

                  SizedBox(
                    height: 20.0,
                  ),
//                  Material(
//                    elevation: 10.0,
//                    borderRadius: new BorderRadius.circular(20.0),
//                    child: Container(
//                      height: 58,
//                      child: DropdownButtonFormField(
//                        decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderRadius: new BorderRadius.circular(20.0),
//                            borderSide: BorderSide(color: appcolor, width: 2.0),
//                          ),
//                          border: new OutlineInputBorder(
//                            borderRadius: new BorderRadius.circular(20.0),
//                            borderSide: new BorderSide(color: appcolor, width: 2.0),
//                          ),
//                        ),
//                        hint: fil_martialstatus == null
//                            ? Text(
//                                'Filter By  Martial Status',
//                                style: TextStyle(
//                                    color: appcolor, fontWeight: FontWeight.bold),
//                              )
//                            : Text(
//                                fil_martialstatus,
//                                style: TextStyle(
//                                    color: appcolor, fontWeight: FontWeight.bold),
//                              ),
//                        isExpanded: true,
//                        icon: Icon(Icons.filter_list),
//                        iconEnabledColor: appcolor,
//                        iconDisabledColor: appcolor,
//                        iconSize: 30.0,
//                        style:
//                            TextStyle(color: appcolor, fontWeight: FontWeight.bold),
//                        items: martialstatus_list.map(
//                          (val) {
//                            print("heelo");
//                            return DropdownMenuItem<String>(
//                              child: Text(val),
//                              value: val,
//                            );
//                          },
//                        ).toList(),
//                        onChanged: (val) {
//                          setState(
//                            () {
//                              fil_martialstatus = val;
//                            },
//                          );
//                        },
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 20.0,
//                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      height: 58,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide:
                                new BorderSide(color: appcolor, width: 2.0),
                          ),
                        ),
                        hint: fil_sect == null
                            ? Text(
                                'Filter By  Sect',
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                fil_sect,
                                style: TextStyle(
                                    color: appcolor,
                                    fontWeight: FontWeight.bold),
                              ),
                        isExpanded: true,
                        icon: Icon(Icons.filter_list),
                        iconEnabledColor: appcolor,
                        iconDisabledColor: appcolor,
                        iconSize: 30.0,
                        style: TextStyle(
                            color: appcolor, fontWeight: FontWeight.bold),
                        items: sect_List.map(
                          (val) {
                            print("heelo");
                            return DropdownMenuItem<String>(
                              child: Text(val),
                              value: val,
                            );
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                            () {
                              fil_sect = val;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            fil_city = text;
                          });
                        },
                        controller: filcity,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: appcolor,
                            size: 25.0,
                          ),
                          hintText: "Filter By city",
                          hintStyle: TextStyle(
                            color: appcolor,
                            fontFamily: "poppins",
                          ),
                          fillColor: Colors.grey[400],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Material(
                    elevation: 10.0,
                    borderRadius: new BorderRadius.circular(20.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: TextFormField(
                        onChanged: (text) {
                          setState(() {
                            fil_age = int.parse(text);
                          });
                        },
                        controller: filage,
                        decoration: new InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: appcolor,
                            size: 25.0,
                          ),
                          hintText: "Filter By Maximum Age ",
                          hintStyle: TextStyle(
                            color: appcolor,
                            fontFamily: "poppins",
                          ),
                          fillColor: Colors.grey[400],
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: appcolor, width: 2.0),
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),

      //body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: back_button(context),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 10.0,
                borderRadius: new BorderRadius.circular(20.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: TextFormField(
                    onChanged: (text) {
                      setState(() {
                        fil_name = text;
                      });
                    },
                    controller: name_txt,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: appcolor,
                        size: 25.0,
                      ),
                      hintText: "Search by name",
                      hintStyle: TextStyle(
                        color: appcolor,
                        fontFamily: "poppins",
                      ),
                      fillColor: Colors.grey[400],
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 2.0),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        filage.clear();
                        filcity.clear();
                        name_txt.clear();
                        setState(() {
                          fil_name = null;
                          fil_age = null;
                          fil_sect = null;
                          fil_martialstatus = null;
                          fil_education = null;
                          fil_profession = null;
                          fil_city = null;
                          fil_caste = null;
                        });
                      },
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          decoration: BoxDecoration(
//                            color: light_blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Refresh",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: appcolor,
                                      fontSize: 20.0,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.refresh_outlined,
                                    size: 30.0,
                                    color: appcolor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        if (_scaffoldKey.currentState!.isDrawerOpen) {
                          Navigator.pop(context);
                        }
                        {
                          _scaffoldKey.currentState?.openEndDrawer();
                        }
                      },
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 50,
                          decoration: BoxDecoration(
//                            color: light_blue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Filters",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: appcolor,
                                      fontSize: 20.0,
                                      fontFamily: "poppins",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.filter_alt_outlined,
                                    size: 30.0,
                                    color: appcolor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            gender != null
                ? Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 10.0),
                    child: StreamBuilder<List<Person>>(
                      stream: getperson(),
                      builder: (context, snapshot) =>
                          profile_first_page(snapshot),
//    {
//                    if(snapshot.hasData)
//                      {
//                       if(snapshot.data !=null)
//                         {
//                           return  profile_first_page(snapshot);
//                         }
//                       else{
//                         return no_data(context);
//                       }
//
//                      }
//                    else{
//
//                      return Center(
//                        child: CircularProgressIndicator(
//                          color: appcolor,
//                        ),
//                      );
//                    }
//                  }
                    ))
                : signin_first(context),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
//
//var _genderRadioBtnVal = "";
//var _marriageRadioBtnVal = "";
//var _religionRadioBtnVal = "";
//var _LifestandardRadioBtnVal = "";
//var _employedRadioBtnVal = "";
//
//void _handleGenderChange(String value) {
//  setState(() {
//    _genderRadioBtnVal = value;
//  });
//}
//
//void _handleMarriageChange(String value) {
//  setState(() {
//    _marriageRadioBtnVal = value;
//  });
//}
//
//void _handleReligionChange(String value) {
//  setState(() {
//    _religionRadioBtnVal = value;
//  });
//}
//
//void _handleLifestandardChange(String value) {
//  setState(() {
//    _LifestandardRadioBtnVal = value;
//  });
//}
//
//void _handleEmployedChange(String value) {
//  setState(() {
//    _employedRadioBtnVal = value;
//  });
//}

//Container(
//padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(2)),
//color: Colors.white,
//),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//IconButton(
//icon: Image.asset(
//"Images/Gender.png",
//color: appColor,
//height: 28.0,
//width: 28.0,
//),
//),
//Expanded(
//child: Radio<String>(
//activeColor: appColor,
//value: "Male",
//groupValue: _genderRadioBtnVal,
//onChanged: _handleGenderChange,
//),
//),
//Expanded(flex: 3, child: Text("Male")),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "Female",
//groupValue: _genderRadioBtnVal,
//onChanged: _handleGenderChange,
//),
//),
//Expanded(flex: 3, child: Text("Female")),
//],
//),
//),
//
//Container(
//height: 20,
//color: Colors.white,
//),
////_marriagestatus
//
//Container(
//padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(2)),
//color: Colors.white,
//),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//IconButton(
//icon: Image.asset(
//"Images/matrimonial.png",
//color: appColor,
//height: 28.0,
//width: 28.0,
//),
//),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "Never married",
//groupValue: _marriageRadioBtnVal,
//onChanged: _handleMarriageChange,
//),
//),
//Expanded(flex: 3, child: Text("Never married")),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "married",
//groupValue: _marriageRadioBtnVal,
//onChanged: _handleMarriageChange,
//),
//),
//Expanded(flex: 3, child: Text("married")),
//],
//),
//),
//
//Container(
//height: 20,
//color: Colors.white,
//),
//
////religion
//
//Container(
//padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(2)),
//color: Colors.white,
//),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//IconButton(
//icon: Image.asset(
//"Images/religion.png",
//color: appColor,
//height: 28.0,
//width: 28.0,
//),
//),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "Muslim",
//groupValue: _religionRadioBtnVal,
//onChanged: _handleReligionChange,
//),
//),
//Expanded(flex: 3, child: Text("Muslim")),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "Non muslim",
//groupValue: _religionRadioBtnVal,
//onChanged: _handleReligionChange,
//),
//),
//Expanded(flex: 3, child: Text("Non Muslim")),
//],
//),
//),
//
//Container(
//height: 20,
//color: Colors.white,
//),
//
////EMPLOYED
//Container(
//padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(2)),
//color: Colors.white,
//),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//IconButton(
//icon: Image.asset(
//"Images/employee.png",
//color: appColor,
//height: 28.0,
//width: 28.0,
//),
//),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "employed",
//groupValue: _employedRadioBtnVal,
//onChanged: _handleEmployedChange,
//),
//),
//Expanded(flex: 3, child: Text("employed")),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "unemployed",
//groupValue: _employedRadioBtnVal,
//onChanged: _handleEmployedChange,
//),
//),
//Expanded(flex: 3, child: Text("unemployed")),
//],
//),
//),
//Container(
//color: Colors.white,
//height: MediaQuery.of(context).size.height * 0.04,
//),
//
////life standard
//
//
//Container(
//padding: EdgeInsets.only(top: 4, left: 4, right: 16, bottom: 4),
//decoration: BoxDecoration(
//borderRadius: BorderRadius.all(Radius.circular(2)),
//color: Colors.white,
//),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//children: <Widget>[
//IconButton(
//icon: Image.asset(
//"Images/healths.png",
//color: appColor,
//height: 28.0,
//width: 28.0,
//),
//),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "Rich",
//groupValue: _LifestandardRadioBtnVal,
//onChanged: _handleLifestandardChange,
//),
//),
//Expanded(flex: 3, child: Text("Rich")),
//Expanded(
//flex: 1,
//child: Radio<String>(
//activeColor: appColor,
//value: "mediocre",
//groupValue: _LifestandardRadioBtnVal,
//onChanged: _handleLifestandardChange,
//),
//),
//Expanded(flex: 3, child: Text("Middle class")),
//],
//),
//),
//Container(
//color: Colors.white,
//height: MediaQuery.of(context).size.height * 0.04,
//),

//caste
//    where('caste', isGreaterThanOrEqualTo: fil_caste=='' || fil_caste==null?null:fil_caste.substring(0, 1).toUpperCase() + fil_caste.substring(1)).
//    where('caste', isLessThan: fil_caste=='' || fil_caste==null?null:fil_caste.substring(0, 1).toUpperCase() + fil_caste.substring(1)+'z').
//      //educatiom
//    where('education', isGreaterThanOrEqualTo: fil_education=='' || fil_education==null?null:fil_education.substring(0, 1).toUpperCase() + fil_education.substring(1)).
//    where('education', isLessThan: fil_education=='' || fil_education==null?null:fil_education.substring(0, 1).toUpperCase() + fil_education.substring(1)+'z').
////age
//    where('age', isGreaterThanOrEqualTo: fil_age=='' || fil_age==null?null:fil_age.substring(0, 1).toUpperCase() + fil_age.substring(1)).
//    where('age', isLessThan: fil_age=='' || fil_age==null?null:fil_age.substring(0, 1).toUpperCase() + fil_age.substring(1)+'z').
////religion
//    where('religion', isGreaterThanOrEqualTo:   fil_sect=='' ||   fil_sect==null?null:  fil_sect.substring(0, 1).toUpperCase() +   fil_sect.substring(1)).
//    where('religion', isLessThan:   fil_sect=='' ||   fil_sect==null?null:  fil_sect.substring(0, 1).toUpperCase() +   fil_sect.substring(1)+'z').
//
//        //martial status
//    where('martialstatus', isGreaterThanOrEqualTo: fil_martialstatus=='' || fil_martialstatus==null?null:fil_martialstatus.substring(0, 1).toUpperCase() + fil_martialstatus.substring(1)).
//    where('martialstatus', isLessThan: fil_martialstatus=='' || fil_martialstatus==null?null:fil_martialstatus.substring(0, 1).toUpperCase() + fil_martialstatus.substring(1)+'z').
//
//        //country
//    where('country', isGreaterThanOrEqualTo: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)).
//    where('country', isLessThan: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)+'z').
//
//    //city
//    where('city', isGreaterThanOrEqualTo: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)).
//    where('city', isLessThan: fil_city=='' || fil_city==null?null:fil_city.substring(0, 1).toUpperCase() + fil_city.substring(1)+'z').
//
//    where('profession', isGreaterThanOrEqualTo: fil_profession=='' || fil_profession==null?null:fil_profession.substring(0, 1).toUpperCase() + fil_profession.substring(1)).
//    where('profession', isLessThan: fil_profession=='' || fil_profession==null?null:fil_profession.substring(0, 1).toUpperCase() + fil_profession.substring(1)+'z').
