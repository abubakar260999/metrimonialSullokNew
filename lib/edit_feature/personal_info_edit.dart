import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';

import '../Global/constant.dart';
import '../Global/value.dart';
import '../UI/Metrimonial_mainpage.dart';
import '../UI/mainpage.dart';
import '../UI/notificaition.dart';
import '../UI/yourprofile.dart';
import 'edit_main.dart';

class personal_info_edit extends StatefulWidget {
  @override
//  String profile_url;
//  String id_card_url;
//  String full_body_url;
//  String gender;
//  String name;
//  String password;
//  personal_info(this.profile_url,this.id_card_url,this.full_body_url,this.gender,this.name,this.password);

  _personal_info_editState createState() => _personal_info_editState();
}

class _personal_info_editState extends State<personal_info_edit> {
  @override
  String? stateValue;

  TextEditingController date = TextEditingController();
  TextEditingController procaste = TextEditingController();
  TextEditingController proeducation = TextEditingController();
  TextEditingController profamilymember = TextEditingController();

  TextEditingController proprofession = TextEditingController();
  TextEditingController prosalary = TextEditingController();

  TextEditingController proweight = TextEditingController();

  TextEditingController proaddress = TextEditingController();

  TextEditingController prophno = TextEditingController();
  TextEditingController proexplain = TextEditingController();
  @override
  static const caste_label = "Candidate Caste";
  static const education_label = "Candidate Education";
  static const profession_label = "Candidate Profession";
  var id;
  String? sect;
  String? caste;
  String? birth;
  String? education;
  String? familymember = "";

  String? profession;
  String? salary;

  String? height;
  String? weight;
  String? complexion;
  String? lifestandard;
  String? martialstatus;

  String? country;
  String? city;
  String? address;

  String? phno;
  String? explain;

  String? employed_radio;

  bool employed_flag = false;

  void initState() {
    date.text = "";
//     Download.getcaste();
    super.initState();
    data_function();
  }

  List data = [];

  var gender = "";
  var name = "";
  var password = "";

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

      if (documentID != '') {
        sect = data['sect'];
        procaste.text = data['caste'];
        date.text = data['birth'];
        proeducation.text = data['education'];
        profamilymember.text = data['familymembers'];

        proprofession.text = data['profession'];
        prosalary.text = data['salary'];

        height = data['height'];
        proweight.text = data['weight'];
        complexion = data['complexion'];
        lifestandard = data['lifestandard'];
        martialstatus = data['martialstatus'];

        country = data['country'];
        city = data['city'];
        proaddress.text = data['address'];

        prophno.text = data['phno'];
        proexplain.text =
            data['explain'] == 'null' ? "no explaination" : data['explain'];
      }
      setState(() {});
    }
  }

//  data_function() async {
//    data=await read_data_of_list();
//    if(data !=null) {
//
//
//      print(sect);
//    }
//
//    setState(() {
//      print(sect+"again");
//      print("data in edit "+data.toString());
//    });
//  }
//

//  bool jobshow = false;
//  bool casteshow = false;
//  bool educationshow = false;
//  String employed_radio;
//  bool employed_flag=false;

  final formKey = GlobalKey<FormState>();
  GlobalKey<_personal_info_editState> _cscPickerKey = GlobalKey();
  String? url;

  Widget build(BuildContext context) {
//    Stream<List<Caste>> getcaste()=>FirebaseFirestore.instance.collection('Caste').
//    snapshots().map((event) => event.docs.map((e) => Caste.fromJson(e.data())
//    ).toList());
//
//    Stream<List<Education>> geteducation()=>FirebaseFirestore.instance.collection('Education').
//    snapshots().map((event) => event.docs.map((e) => Education.fromJson(e.data())
//    ).toList());
//
//
//    Stream<List<Profession>> getprofession()=>FirebaseFirestore.instance.collection('Profession').
//    snapshots().map((event) => event.docs.map((e) => Profession.fromJson(e.data())
//    ).toList());

    return Scaffold(
      backgroundColor: AppColor.purple,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 150.0,
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20.0)),
                    color: AppColor.pink),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Personal info",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //Sect
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter Sect";
                                }
                              },
                              decoration: InputDecoration(
//                        enabledBorder: OutlineInputBorder(
//                          borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                        ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              hint: sect == null
                                  ? Text(
                                      'Candidate Sect',
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      sect!,
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: AppColor.purple,
                              iconDisabledColor: AppColor.purple,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: AppColor.purple,
                                  fontWeight: FontWeight.bold),
                              items: sect_List.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    sect = val as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

//caste
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: TextFieldSearch(
                            initialList: caste_list,
                            label: caste_label,
                            controller: procaste,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: " Candidate Caste",
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColor.purple,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

//age
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58,
                            child: TextFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter Date of birth";
                                }
                              },
                              controller: date,
                              decoration: InputDecoration(
                                  labelText: "Age",
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
                                  labelStyle: TextStyle(
                                      fontSize: 18.0,
                                      color: AppColor.purple,
                                      fontWeight: FontWeight.bold),
                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none,
//                              borderSide: new BorderSide(color: Colors.blue),
                                  ),
                                  hintText: "Candidate Date of Birth",
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "poppins",
                                    color: AppColor.purple,
                                  )),
                              readOnly: true,
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: new DateTime(2000),
                                  firstDate: new DateTime(1900),
                                  lastDate: new DateTime(2100),
                                );
                                if (pickedDate != null) {
                                  print(pickedDate);
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(formattedDate);
                                  DateTime current = DateTime.now();
                                  setState(() {
                                    date.text = formattedDate;
                                    int age = current.year - pickedDate.year;
                                    int month1 = current.month;
                                    int month2 = pickedDate.month;
                                    if (month2 > month1) {
                                      age--;
                                    } else if (month1 == month2) {
                                      int day1 = current.day;
                                      int day2 = pickedDate.day;
                                      if (day2 > day1) {
                                        age--;
                                      }
                                    }
                                    setState(() {
                                      birth = age.toString();
                                    });
                                  });
                                }
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),
                        //education
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: TextFieldSearch(
                            initialList: education_list,
                            label: education_label,
                            controller: proeducation,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: " Candidate Education",
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColor.purple,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //Family member
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  familymember = text;
                                });
                              },
                              controller: profamilymember,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Family Member";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: new InputDecoration(
                                hintText: "Candidate Total Family members",
                                hintStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                ),
                                fillColor: Colors.white,
                                labelText: "Candidate Family members",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Employement Status",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

//                      Container(
//                        height: 40.0,
//                        width: MediaQuery.of(context).size.width,
//                        child: Row(
//                          children: [
//                            Container(
//                              padding: const EdgeInsets.only(left: 10.0),
//                              height: 40,
//                              child: Align(
//                                alignment: Alignment.centerLeft,
//                                child: Text(
//                                  "Working",
//                                  maxLines: 1,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: TextStyle(
//                                    color: AppColor.purple,
//                                    fontSize: 15.0,
//                                    fontFamily: "poppins",
//                                    fontWeight: FontWeight.w400,
//                                  ),
//                                ),
//                              ),
//                            ),
//
//                            Theme(
//                              data: ThemeData(
//                                //here change to your color
//                                unselectedWidgetColor:  AppColor.purple,
//                              ),
//                              child: Radio(
////             title: Text("Employed",
////               style: TextStyle(
////                 color:  AppColor.purple,
////               ),),
//                                value: "Working",
//
//
//                                activeColor:  AppColor.purple,
//                                groupValue: employed_radio,
//
//                                onChanged: (value){
//                                  setState(() {
//                                    employed_flag=true;
//                                    employed_radio=value.toString();
//                                    proprofession.clear();
//                                  });
//                                },
//                              ),
//                            ),
//
//                            Container(
//                              padding: const EdgeInsets.only(left: 10.0),
//                              height: 40,
//                              child: Align(
//                                alignment: Alignment.centerLeft,
//                                child: Text(
//                                  "Non Working",
//                                  maxLines: 1,
//                                  overflow: TextOverflow.ellipsis,
//                                  style: TextStyle(
//                                    color: AppColor.purple,
//                                    fontSize: 15.0,
//                                    fontFamily: "poppins",
//                                    fontWeight: FontWeight.w400,
//                                  ),
//                                ),
//                              ),
//                            ),
//
//                            Theme(
//
//                              data: ThemeData(
//                                //here change to your color
//                                unselectedWidgetColor:  AppColor.purple,
//                              ),
//                              child: Radio(
//
//                                activeColor:  AppColor.purple,
//
////             title: Text("Unemployed",  style: TextStyle(
////               color:  AppColor.purple,
////             ),),
//                                value: "Non Working",
//                                groupValue: employed_radio,
//                                onChanged: (value){
//                                  setState(() {
//                                    employed_radio=value.toString();
//                                    employed_flag=false;
//                                    proprofession.text=value.toString();
//                                  });
//                                },
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),

//                      SizedBox(
//                        height: 20.0,
//                      ),

                        //allaaag

//                       Container(
//     height: 40.0,
//     width: MediaQuery.of(context).size.width,
//     child: Row(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   height: 40,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Working",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                     color: AppColor.purple,
//                     fontSize: 15.0,
//                     fontFamily: "poppins",
//                     fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Theme(
//                   data: ThemeData(
//                     //here change to your color
//                     unselectedWidgetColor:  AppColor.purple,
//                   ),
//                   child: Radio(
////             title: Text("Employed",
////               style: TextStyle(
////                 color:  AppColor.purple,
////               ),),
//                     value: "Working",
//
//
//                     activeColor:  AppColor.purple,
//                     groupValue: employed_radio,
//
//                     onChanged: (value){
//                       setState(() {
//                    employed_flag=true;
//                     employed_radio=value.toString();
//                       });
//                     },
//                   ),
//                 ),
//
//                 Container(
//                   padding: const EdgeInsets.only(left: 10.0),
//                   height: 40,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       "Non Working",
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                     color: AppColor.purple,
//                     fontSize: 15.0,
//                     fontFamily: "poppins",
//                     fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 Theme(
//
//                   data: ThemeData(
//                     //here change to your color
//                     unselectedWidgetColor:  AppColor.purple,
//                   ),
//                   child: Radio(
//
//                     activeColor:  AppColor.purple,
//
////             title: Text("Unemployed",  style: TextStyle(
////               color:  AppColor.purple,
////             ),),
//                     value: "Non Working",
//                     groupValue: employed_radio,
//                     onChanged: (value){
//                       setState(() {
//                     employed_radio=value.toString();
//                     employed_flag=false;
//                     profession=value.toString();
//                       });
//                     },
//                   ),
//                 ),
//               ],
//     ),
//   ),
//
//
//                      SizedBox(
//                        height: 20.0,
//                      ),

                        Material(
                          elevation: 20.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: TextFieldSearch(
                            initialList: profession_list,
                            label: profession_label,
                            controller: proprofession,
                            decoration: new InputDecoration(
                              fillColor: Colors.white,
                              errorStyle: TextStyle(
                                  color: Colors.redAccent, fontSize: 12.0),
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              labelText: " Candidate Profession",
                              suffixIcon: Icon(
                                Icons.search,
                                color: AppColor.purple,
                              ),
                              labelStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //monthly income
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (number) {
                                setState(() {
                                  salary = number.toString();
                                });
                              },
                              controller: prosalary,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter monthly income";
                                }
                              },
                              decoration: new InputDecoration(
                                hintText: "Candidate Monthly Income",
                                labelText: "Candidate Monthly Income",
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                    fontFamily: "poppins",
                                    color: AppColor.purple),
                                fillColor: Colors.white,
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                                borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Physical Apperance",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter height";
                                }
                              },
                              decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                              hint: height == null
                                  ? Text(
                                      'Candidate Height',
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      height!,
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: AppColor.purple,
                              iconDisabledColor: AppColor.purple,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: AppColor.purple,
                                  fontWeight: FontWeight.bold),
                              items: height_list.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    height = val;
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
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            height: 58,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (number) {
                                setState(() {
                                  weight = number.toString();
                                });
                              },
                              controller: proweight,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Weight";
                                }
                              },
                              decoration: new InputDecoration(
                                hintText: "Candidate Weight",
                                labelText: "Candidate Weight",
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                    fontFamily: "poppins",
                                    color: AppColor.purple),
                                fillColor: Colors.white,
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                                borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //complexion
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter complexion";
                                }
                              },
                              decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                              hint: complexion == null
                                  ? Text(
                                      'Candidate complexion',
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      complexion!,
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: AppColor.purple,
                              iconDisabledColor: AppColor.purple,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: AppColor.purple,
                                  fontWeight: FontWeight.bold),
                              items: complexion_list.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    complexion = val as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //life standard
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter life standard";
                                }
                              },
                              decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                              hint: lifestandard == null
                                  ? Text(
                                      'Candidate Life standard',
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      lifestandard!,
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: AppColor.purple,
                              iconDisabledColor: AppColor.purple,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: AppColor.purple,
                                  fontWeight: FontWeight.bold),
                              items: lifestandard_list.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    lifestandard = val as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        //martial status
                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            child: DropdownButtonFormField(
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return "Plz Enter martial status";
                                }
                              },
                              decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                              hint: martialstatus == null
                                  ? Text(
                                      'Candidate Martial Status',
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      martialstatus!,
                                      style: TextStyle(
                                          color: AppColor.purple,
                                          fontWeight: FontWeight.bold),
                                    ),
                              isExpanded: true,
                              icon: Icon(Icons.arrow_drop_down_circle_outlined),
                              iconEnabledColor: AppColor.purple,
                              iconDisabledColor: AppColor.purple,
                              iconSize: 30.0,
                              style: TextStyle(
                                  color: AppColor.purple,
                                  fontWeight: FontWeight.bold),
                              items: martialstatus_list.map(
                                (val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Text(val),
                                  );
                                },
                              ).toList(),
                              onChanged: (val) {
                                setState(
                                  () {
                                    martialstatus = val as String?;
                                  },
                                );
                              },
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Update Location from below",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          country != null
                              ? country! + "  Selected Country"
                              : "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.purple,
                            fontSize: 16.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Text(
                          city != null ? city! + " Selected City" : " ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColor.purple,
                            fontSize: 16.0,
                            fontFamily: "poppins",
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        CSCPicker(
                          showStates: true,
                          showCities: true,
                          layout: Layout.vertical,
                          // style: TextStyle(
                          //   color: AppColor.purple,
                          //   fontFamily: "poppins",
                          // ),
                          onCountryChanged: (value) {
                            setState(() {
                              country = value;
                            });
                          },
                          onStateChanged: (value) {
                            setState(() {
                              stateValue = value;
                            });
                          },
                          onCityChanged: (value) {
                            setState(() {
                              city = value;
                            });
                          },
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              onChanged: (number) {
                                setState(() {
                                  address = number.toString();
                                });
                              },
                              controller: proaddress,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Address";
                                }
                              },
                              decoration: new InputDecoration(
                                hintText: "Candidate Address",
                                labelText: "Candidate Address",
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                    fontFamily: "poppins",
                                    color: AppColor.purple),
                                fillColor: Colors.white,
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                      errorText: "",
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
//                                borderSide: new BorderSide(color:  AppColor.purple),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Contact Info",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              onChanged: (text) {
                                setState(() {
                                  phno = text;
                                });
                              },
                              controller: prophno,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return "Plz Enter Contact no";
                                }
                              },
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: new InputDecoration(
                                hintText: "Contact no",
                                labelText: 'contact no',
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                ),
                                fillColor: Colors.white,
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                          focusedBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),

                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          height: 40,
                          width: MediaQuery.of(context).size.width,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Additional info",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.purple,
                                fontSize: 20.0,
                                fontFamily: "poppins",
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            height: 58,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextField(
                              onChanged: (text) {
                                setState(() {
                                  explain = text;
                                });
                              },
                              controller: proexplain,
//                            validator: (value) {
//                              if (value.isEmpty || value == null) {
//                                return "Plz Enter Description";
//                              }
//                            },
//                            autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: new InputDecoration(
                                hintText: "Any Thing You Want Explain",
                                labelText: 'Any Thing You Want Explain',
                                labelStyle: TextStyle(
                                    color: AppColor.purple,
                                    fontFamily: "poppins",
                                    fontWeight: FontWeight.bold),
                                hintStyle: TextStyle(
                                  color: AppColor.purple,
                                  fontFamily: "poppins",
                                ),
                                fillColor: Colors.white,
                                errorStyle: TextStyle(
                                    color: Colors.redAccent, fontSize: 12.0),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.0,
                        ),

                        GestureDetector(
                          onTap: () {
                            if (sect != null &&
                                procaste.text != null &&
                                birth != null &&
                                proeducation.text != null &&
                                profamilymember.text != null &&
                                proprofession.text != null &&
                                prosalary.text != null &&
                                height != null &&
                                proweight.text != null &&
                                complexion != null &&
                                lifestandard != null &&
                                martialstatus != null &&
                                country != null &&
                                city != null &&
                                proaddress.text != null &&
                                prophno.text != null &&
                                proexplain.text != null) {
                              var collection =
                                  FirebaseFirestore.instance.collection(gender);
                              collection.doc(id).update({
                                'sect': sect,
                                'caste': procaste.text,
                                'birth': birth,
                                'education': proeducation.text,
                                'familymembers': profamilymember.text,
                                'profession': proprofession.text,
                                'salary': prosalary.text,
                                'height': height,
                                'weight': proweight.text,
                                'complexion': complexion,
                                'lifestandard': lifestandard,
                                'martialstatus': martialstatus,
                                'country': country,
                                'city': city,
                                'address': proaddress.text,
                                'phno': prophno.text,
                                'explain': proexplain.text,
                              }) // <-- Updated data
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
                            } else {
                              fill_Message();
                            }
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.purple,
                                    AppColor.pink,
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
                          height: 300.0,
                        ),
                      ]),
                    ),
                  ),
                )),
          ),
          Positioned(
            top: 0.0,
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20.0),

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

                  //name
                  SizedBox(
                    height: 20.0,
                  ),

                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Profile",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontFamily: "poppins",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//              Visibility(
//                visible: casteshow,
//                child: Container(
//                 height:70,
//                  child: TextFormField(
//                    onChanged: (text) {
//                      setState(() {
//                        caste = text;
//                      });
//                    },
//                    controller: caste,
//                    validator: (value) {
//                      if (value.isEmpty || value == null) {
//                        return "Plz Enter caste";
//                      }
//                    },
//                    decoration: new InputDecoration(
//                      helperText: "Plz enter your caste if not find it above",
//                      hintText: "caste",
//                      hintStyle: TextStyle(
//                        color:  AppColor.purple,
//                        fontFamily: "poppins",
//                      ),
//                      fillColor: Colors.white,
//                      errorStyle:
//                          TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                      ),
//                      focusedBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                      ),
//                      border: new OutlineInputBorder(
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                    ),
//                  ),
//                ),
//              ),

//              Visibility(
//                visible: casteshow,
//                child: SizedBox(
//                  height: 20.0,
//                ),
//              ),

//education

//StreamBuilder<List<Education>>(
//                      stream: geteducation(),
//                      builder: (context, snapshot) {
//                        if (snapshot.hasData) {
//                          return Container(
//                           height:58,
//                            child: DropdownButtonFormField(
//                              validator: (value) {
//                                if (value == '' || value == null) {
//                                  return "Plz Enter education";
//                                }
//                              },
//                              decoration: InputDecoration(
//                                enabledBorder: OutlineInputBorder(
//                                  borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                                ),
////                      errorText: "",
//                                errorStyle:
//                                    TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                                border: new OutlineInputBorder(
//                                  borderRadius: new BorderRadius.circular(10.0),
//                                  borderSide: new BorderSide(color:  AppColor.purple),
//                                ),
//                              ),
//                              hint: education == null
//                                  ? Text(
//                                      'Candidate Education',
//                                      style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                                    )
//                                  : Text(
//                                      education,
//                                     style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                                    ),
//                              isExpanded: true,
//                               icon: Icon(Icons.arrow_drop_down_circle_outlined),
//
//                        iconEnabledColor:  AppColor.purple,
//                              iconDisabledColor:  AppColor.purple,
//                              iconSize: 30.0,
//                             style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                              items: snapshot.data.map(
//                                (val) {
//                                  return DropdownMenuItem<String>(
//                                    value: val.education,
//                                    child: Text(val.education),
//                                  );
//                                },
//                              ).toList(),
//                              onChanged: (val) {
//                                setState(
//                                  () {
//                                    if (val == "other") {
//                                      educationshow = true;
//                                    } else {
//                                      education = val;
//                                      educationshow=false;
////                              educationshow==true?educationshow=false:educationshow=true;
//                                    }
//                                  },
//                                );
//                              },
//                            ),
//                          );
//                        } else {
//                          return CircularProgressIndicator();
//                        }
//                      },
//                    ),
//
//                    SizedBox(
//                      height: 20.0,
//                    ),

//                        Container(
//                          height:58,
//                          child: DropdownButtonFormField(
//                            validator: (value) {
//                              if (value == '' || value == null) {
//                                return "Plz Enter Weight";
//                              }
//                            },
//                            decoration: InputDecoration(
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
////                      errorText: "",
//                              errorStyle:
//                              TextStyle(color: Colors.redAccent, fontSize: 12.0),
//                              border: new OutlineInputBorder(
//                                borderRadius: new BorderRadius.circular(10.0),
//                                borderSide: new BorderSide(color:  AppColor.purple),
//                              ),
//                            ),
//                            hint: physique == null
//                                ? Text(
//                              'Candidate Weight',
//                              style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                            )
//                                : Text(
//                              weight,
//                              style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                            ),
//                            isExpanded: true,
//                            icon: Icon(Icons.arrow_drop_down_circle_outlined),
//                            iconEnabledColor:  AppColor.purple,
//                            iconDisabledColor:  AppColor.purple,
//                            iconSize: 30.0,
//                            style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                            items: physique_list.map(
//                                  (val) {
//                                return DropdownMenuItem<String>(
//                                  value: val,
//                                  child: Text(val),
//                                );
//                              },
//                            ).toList(),
//                            onChanged: (val) {
//                              setState(
//                                    () {
//                                  phys = val;
//                                },
//                              );
//                            },
//                          ),
//                        ),
