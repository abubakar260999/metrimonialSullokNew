import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../Global/constant.dart';
import '../../Global/value.dart';
import '../notificaition.dart';
import 'familly_profile.dart';

class personal_info extends StatefulWidget {
  @override
  String profile_url;
  String id_card_url;
  String full_body_url;
  String pro_phno;
  String pro_password;

  personal_info(this.profile_url, this.id_card_url, this.full_body_url,
      this.pro_phno, this.pro_password);

  _personal_infoState createState() => _personal_infoState();
}

class _personal_infoState extends State<personal_info> {
  @override
  String stateValue = "";

  TextEditingController date = TextEditingController();

  TextEditingController proeducation = TextEditingController();

  TextEditingController proprofession = TextEditingController();
  TextEditingController salary = TextEditingController();

  TextEditingController proweight = TextEditingController();

  TextEditingController proaddress = TextEditingController();

  TextEditingController proexplain = TextEditingController();

  ScrollController scroller = ScrollController();
  @override
  void initState() {
    date.text = "";
    setState(() {});
//     Download.getcaste();

    super.initState();
  }

  static const education_label = "Education";
  static const profession_label = "Profession";

  String? pro_birth;
  String? pro_education;
  String? pro_profession;
  String? pro_salary;
  String? pro_height;
  String? pro_weight;
  String? pro_complexion;
  String? pro_lifestandard;
  String? pro_martialstatus;
  String? pro_country;
  String? pro_city;
  String? pro_address;
  String? pro_phno;
  String? pro_explain;
  String? employed_radio;

  bool employed_flag = false;

//  bool jobshow = false;
//  bool casteshow = false;
//  bool educationshow = false;
//  String employed_radio;
//  bool employed_flag=false;
  var gender_list = [
    'Male',
    'Female',
  ];

  TextEditingController progender = TextEditingController();
  TextEditingController proname = TextEditingController();
//  TextEditingController prophno = TextEditingController();

  String? pro_name;
  String? pro_gender;

  final formKey = GlobalKey<FormState>();
  GlobalKey<_personal_infoState> _cscPickerKey = GlobalKey();
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
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
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
                        "Personal Profile",
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
          Positioned(
            top: 150.0,
            child: Container(
              height: MediaQuery.of(context).size.height - 150,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(20.0)),
                  color: AppColor.pink),
//              key: formKey,
//                autovalidateMode: AutovalidateMode.disabled,
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10.0),
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Personal Profile",
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
                              borderRadius: new BorderRadius.circular(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: TextFormField(
                                  onChanged: (text) {
                                    setState(() {
                                      pro_name = text;
                                    });
                                  },
                                  validator: (value) {
                                    if (value == '' || value == null) {
                                      return "Plz Enter Name";
                                    }
                                  },
                                  controller: proname,
                                  decoration: new InputDecoration(
                                    suffixIcon: Icon(
                                      Icons.person_outline,
                                      color: AppColor.purple,
                                      size: 25.0,
                                    ),

                                    hintText: "Name ",
                                    labelText: "Name",
                                    hintStyle: TextStyle(
                                      color: AppColor.purple,
                                      fontFamily: "poppins",
                                    ),
                                    fillColor: Colors.grey[400],
                                    labelStyle: TextStyle(
                                        color: AppColor.purple,
                                        fontFamily: "poppins",
                                        fontWeight: FontWeight.bold),

//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:  AppColor.purple, width: 2.0),
//                        borderRadius: new BorderRadius.circular(10.0),
//                      ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 2.0),
//                              borderRadius: new BorderRadius.circular(10.0),
//                            ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                  style: new TextStyle(
                                    color: AppColor.purple,
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
                                height: 58,
                                child: DropdownButtonFormField(
//                            validator: (value) {
//                              if (value == '' || value == null) {
//                                return "Plz Enter gender";
//                              }
//                            },

                                  decoration: InputDecoration(
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                      ),
//                      errorText: "",
//                      errorStyle: TextStyle(color: Colors.redAccent, fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
//                        borderSide: new BorderSide(color:  AppColor.purple),
                                    ),
                                  ),
                                  hint: pro_gender == null
                                      ? Text(
                                          'Gender',
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          pro_gender!,
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        ),

                                  isExpanded: true,
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),
                                  iconEnabledColor: AppColor.purple,
                                  iconDisabledColor: AppColor.purple,
                                  iconSize: 30.0,
                                  style: TextStyle(
                                      color: AppColor.purple,
                                      fontWeight: FontWeight.bold),
                                  items: gender_list.map(
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
                                        pro_gender = val;
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
                                  validator: (value) {
                                    if (value == '' || value == null) {
                                      return "Plz Enter Date of birth";
                                    }
                                  },
                                  controller: date,
                                  decoration: InputDecoration(
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
                                      hintText: "Date of Birth",
                                      labelText: "Date of Birth",
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
                                        int age =
                                            current.year - pickedDate.year;
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
                                          pro_birth = age.toString();
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
                            //pro_education
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
                                    borderRadius:
                                        new BorderRadius.circular(20.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  labelText: " Education",
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

//                      //Family member
//                      Material(
//
//                        elevation: 10.0,
//                        borderRadius: BorderRadius.circular(20.0),
//                        child: Container(
//                          height:58,
//                          decoration: BoxDecoration(
//                            borderRadius: BorderRadius.circular(20.0),
//                          ),
//                          child: TextFormField(
//                            keyboardType: TextInputType.number,
//                            onChanged: (text) {
//                              setState(() {
//                                pro_familymember = text;
//                              });
//                            },
//                            controller: profamilymember,
//                            validator: (value) {
//                              if (value.isEmpty || value == null) {
//                                return "Plz Enter Family Member";
//                              }
//                            },
//                            autovalidateMode: AutovalidateMode.onUserInteraction,
//                            decoration: new InputDecoration(
//                              hintText: "Total Family members",
//                              labelStyle: TextStyle(color:  AppColor.purple,
//                                  fontFamily: "poppins",
//                                  fontWeight:FontWeight.bold),
//
//                              labelText:"Total Family members" ,
//                              hintStyle: TextStyle(
//                                color:  AppColor.purple,
//                                fontFamily: "poppins",
//                              ),
//                              fillColor: Colors.white,
//                              errorStyle:
//                              TextStyle(color: Colors.redAccent, fontSize: 12.0),
////                              enabledBorder: OutlineInputBorder(
////                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
////                              ),
////                              focusedBorder: OutlineInputBorder(
////                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
////                              ),
//                              border: new OutlineInputBorder(
//                                borderRadius: new BorderRadius.circular(20.0),
//                                borderSide:BorderSide.none,
//                              ),
//                            ),
//                               style: new TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontFamily: "Poppins",
//                        ),
//                          ),
//                        ),
//                      ),
//
//
//                      SizedBox(
//                        height: 20.0,
//                      ),

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

                            Container(
                              height: 40.0,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Working",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.purple,
                                          fontSize: 15.0,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      //here change to your color
                                      unselectedWidgetColor: AppColor.purple,
                                    ),
                                    child: Radio(
//             title: Text("Employed",
//               style: TextStyle(
//                 color:  AppColor.purple,
//               ),),
                                      value: "Working",

                                      activeColor: AppColor.purple,
                                      groupValue: employed_radio,

                                      onChanged: (value) {
                                        setState(() {
                                          employed_flag = true;
                                          employed_radio = value.toString();
                                          proprofession.clear();
                                          pro_salary = "No Salary";
                                        });
                                      },
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "Non Working",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColor.purple,
                                          fontSize: 15.0,
                                          fontFamily: "poppins",
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      //here change to your color
                                      unselectedWidgetColor: AppColor.purple,
                                    ),
                                    child: Radio(
                                      activeColor: AppColor.purple,

//             title: Text("Unemployed",  style: TextStyle(
//               color:  AppColor.purple,
//             ),),
                                      value: "Non Working",
                                      groupValue: employed_radio,
                                      onChanged: (value) {
                                        setState(() {
                                          employed_radio = value.toString();
                                          employed_flag = false;
                                          proprofession.text = value.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: 20.0,
                            ),

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
//                     pro_profession=value.toString();
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

                            Visibility(
                              visible: employed_flag,
                              child: Material(
                                elevation: 20.0,
                                borderRadius: BorderRadius.circular(20.0),
                                child: TextFieldSearch(
                                  initialList: profession_list,
                                  label: profession_label,
                                  controller: proprofession,
                                  decoration: new InputDecoration(
                                    fillColor: Colors.white,
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
//                            enabledBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
//                            focusedBorder: OutlineInputBorder(
//                              borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                            ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
                                    ),
                                    labelText: " Profession",
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
                            ),

                            Visibility(
                              visible: employed_flag,
                              child: SizedBox(
                                height: 20.0,
                              ),
                            ),

                            //monthly income
                            Visibility(
                              visible: employed_flag,
                              child: Material(
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
                                        pro_salary = number.toString();
                                      });
                                    },
                                    controller: salary,
                                    validator: (value) {
                                      if (value!.isEmpty || value == null) {
                                        return "Plz Enter monthly income";
                                      }
                                    },
                                    decoration: new InputDecoration(
                                      hintText: "Monthly Income",
                                      labelText: "Monthly Income",
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
                                          color: Colors.redAccent,
                                          fontSize: 12.0),
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20.0),
                                        borderSide: BorderSide.none,
//                                borderSide: new BorderSide(color:  AppColor.purple),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Visibility(
                              visible: employed_flag,
                              child: SizedBox(
                                height: 20.0,
                              ),
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
//                        validator: (value) {
//                          if (value == '' || value == null) {
//                            return "Plz Enter height";
//                          }
//                        },
                                  decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                    ),
                                  ),
                                  hint: pro_height == null
                                      ? Text(
                                          'Height',
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          pro_height!,
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  isExpanded: true,
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),
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
                                        pro_height = val;
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
                                      pro_weight = number.toString();
                                    });
                                  },
                                  controller: proweight,
//                            validator: (value) {
//                              if (value.isEmpty || value == null) {
//                                return "Plz Enter Weight";
//                              }
//                            },
                                  decoration: new InputDecoration(
                                    hintText: "Weight",
                                    labelText: "Weight",
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
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
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
//                        validator: (value) {
//                          if (value == '' || value == null) {
//                            return "Plz Enter complexion";
//                          }
//                        },
                                  decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                    ),
                                  ),
                                  hint: pro_complexion == null
                                      ? Text(
                                          'complexion',
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          pro_complexion!,
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  isExpanded: true,
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),
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
                                        pro_complexion = val;
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
//                        validator: (value) {
//                          if (value == '' || value == null) {
//                            return "Plz Enter life standard";
//                          }
//                        },
                                  decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                    ),
                                  ),
                                  hint: pro_lifestandard == null
                                      ? Text(
                                          'Life standard',
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          pro_lifestandard!,
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  isExpanded: true,
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),
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
                                        pro_lifestandard = val;
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
//                        validator: (value) {
//                          if (value == '' || value == null) {
//                            return "Plz Enter martial status";
//                          }
//                        },
                                  decoration: InputDecoration(
//                          enabledBorder: OutlineInputBorder(
//                            borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                          ),
//                      errorText: "",
                                    errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
                                      borderSide: BorderSide.none,
//                            borderSide: new BorderSide(color:  AppColor.purple),
                                    ),
                                  ),
                                  hint: pro_martialstatus == null
                                      ? Text(
                                          'Martial Status',
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(
                                          pro_martialstatus!,
                                          style: TextStyle(
                                              color: AppColor.purple,
                                              fontWeight: FontWeight.bold),
                                        ),
                                  isExpanded: true,
                                  icon: Icon(
                                      Icons.arrow_drop_down_circle_outlined),

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
                                        pro_martialstatus = val;
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
                                  "Location",
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
                                  pro_country = value;
                                });
                              },
                              onStateChanged: (value) {
                                setState(() {
                                  stateValue = value!;
                                });
                              },
                              onCityChanged: (value) {
                                setState(() {
                                  pro_city = value;
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
                                      pro_address = number.toString();
                                    });
                                  },
                                  controller: proaddress,
//                            validator: (value) {
//                              if (value.isEmpty || value == null) {
//                                return "Plz Enter Address";
//                              }
//                            },
                                  decoration: new InputDecoration(
                                    hintText: "Address",
                                    labelText: "Address",
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
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
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
                                      pro_explain = text;
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
                                    labelText: "Any Thing You Want Explain",
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
                                        color: Colors.redAccent,
                                        fontSize: 12.0),
//                              enabledBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
//                              focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color:  AppColor.purple, width: 1.0),
//                              ),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0),
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
                                if ((progender.text.isEmpty) ||
                                    (proname.text.isEmpty) ||
                                    (pro_birth == null) ||
                                    (proeducation.text.isEmpty) ||
                                    (proprofession.text.isEmpty) ||
                                    (proweight.text.isEmpty) ||
                                    (pro_complexion == null) ||
                                    (pro_lifestandard == null) ||
                                    (pro_martialstatus == null) ||
                                    (pro_country == null) ||
                                    (pro_city == null) ||
                                    (pro_address == null) ||
                                    (pro_phno == null) ||
                                    (proexplain.text.isEmpty)) {
                                  empty_Message('Field');
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => family_profile(
                                          widget.profile_url,
                                          widget.id_card_url,
                                          widget.full_body_url,
                                          pro_gender,
                                          pro_name,
                                          widget.pro_password,
                                          pro_birth,
                                          proeducation.text,
                                          proprofession.text,
                                          pro_salary,
                                          pro_height,
                                          pro_weight,
                                          pro_complexion,
                                          pro_lifestandard,
                                          pro_martialstatus,
                                          pro_country!,
                                          pro_city!,
                                          pro_address,
                                          widget.pro_phno,
                                          pro_explain,
                                        ),
                                      ));
                                }
////                      && _image != null
//                  ) {
////                    ScaffoldMessenger.of(context).showSnackBar(
////                      const SnackBar(content: Text('Processing Data')),
////                    );

//                    print(casteshow);
//                    print(jobshow);
//                    if (casteshow == true) {
//                      Upload.add_caste(pro_caste);
//                    }
//                    if (jobshow == true) {
//                      Upload.add_profession(pro_profession);
//                    }
//                    if (educationshow == true) {
//                      Upload.add_education(pro_education);
//                    }
//

//                    Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child:       lookingfor(
//                      widget.profile_url,
//                      widget.id_card_url,
//                      widget.full_body_url,
//                      widget.pro_gender,
//                      widget.pro_name,
//                      widget.pro_password,
//
//                      pro_sect,
//                      procaste.text,
//                      pro_birth,
//                      proeducation.text,
//                      pro_familymember,
//
//                      proprofession.text,
//                      pro_salary,
//
//                      pro_height,
//                      pro_weight,
//                      pro_complexion,
//                      pro_lifestandard,
//                      pro_martialstatus,
//
//                      pro_country,
//                      pro_city,
//                      pro_address,
//
//                      pro_phno,
//                      pro_explain,
//                    ), ));
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Row(
                                  children: [
                                    Spacer(),
                                    Text(
                                      'Next'.toUpperCase(),
                                      style: TextStyle(
                                          fontFamily: "poppins",
                                          fontSize: 20.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
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
                          ]),
                    ),
                  ),
                ),
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
//                        pro_caste = text;
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
//                              hint: pro_education == null
//                                  ? Text(
//                                      'Education',
//                                      style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//                                    )
//                                  : Text(
//                                      pro_education,
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
//                                      pro_education = val;
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
//                            hint: pro_physique == null
//                                ? Text(
//                              'Weight',
//                              style: TextStyle(color:  AppColor.purple,fontWeight:FontWeight.bold),
//
//                            )
//                                : Text(
//                              pro_weight,
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
//                                  pro_phys = val;
//                                },
//                              );
//                            },
//                          ),
//                        ),
