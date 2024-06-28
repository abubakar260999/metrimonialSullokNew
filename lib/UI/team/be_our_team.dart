import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import '../../upload.dart';
import '../mainpage.dart';
import '../notificaition.dart';
//import 'package:flutter_country_picker/country.dart';
//import 'package:flutter_country_picker/flutter_country_picker.dart';

class be_our_team extends StatefulWidget {
  @override
  _be_our_teamState createState() => _be_our_teamState();
}

class _be_our_teamState extends State<be_our_team> {
  @override
  TextEditingController teamname = TextEditingController();
  TextEditingController teamaddress = TextEditingController();
  TextEditingController teamcity = TextEditingController();
  TextEditingController teamidcard = TextEditingController();
  TextEditingController teamphno = TextEditingController();
  TextEditingController teamprofession = TextEditingController();

  String? team_name;
  String? team_address;
  String? team_city;
  String? team_idcard;
  String? team_phno;
  String? team_profession;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    data_function();
  }

  List? data;
  String? done_value;

  data_function() async {
    data = await read_data_of_team();
    setState(() {
      print("my profile data" + data.toString());
    });
    done_value = data![6];
  }

  team_form() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                //Name
                TextFormField(
                  controller: teamname,
                  onChanged: (text) {
                    setState(() {
                      team_name = text;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter Name";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    hintText: " Name",
                    prefixIcon: Icon(
                      Icons.person,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                //Adresss
                TextFormField(
                  controller: teamaddress,
                  onChanged: (text) {
                    setState(() {
                      team_address = text;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter Address";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    hintText: "Address",
                    prefixIcon: Icon(
                      Icons.location_history,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 20.0,
                ),

                //city
                TextFormField(
                  controller: teamcity,
                  onChanged: (text) {
                    setState(() {
                      team_city = text;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter city";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    hintText: " City",
                    prefixIcon: Icon(
                      Icons.location_city_rounded,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: teamidcard,
                  onChanged: (number) {
                    setState(() {
                      team_idcard = number;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter Id Card";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.credit_card_outlined,
                    ),
                    hintText: " Id Card",
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: teamphno,
                  onChanged: (text) {
                    setState(() {
                      team_phno = text;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter Contact No";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone,
                    ),
                    hintText: " Contact no",
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

//profession
                TextFormField(
                  controller: teamprofession,
                  onChanged: (text) {
                    setState(() {
                      team_profession = text;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || value == null) {
                      return "Plz Enter Profession";
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: new InputDecoration(
                    hintText: "Profession",
                    prefixIcon: Icon(
                      Icons.account_box_sharp,
                    ),
                    hintStyle: TextStyle(
                      fontFamily: "poppins",
                    ),
                    fillColor: Colors.white,
                    errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 12.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColor.purple, width: 0.0),
                    ),
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                  ),
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),

                SizedBox(
                  height: 30.0,
                ),

                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
//                      ScaffoldMessenger.of(context).showSnackBar(
//                        const SnackBar(content: Text('Processing Data')),
//                      );

                      processing_Message();

                      Upload.add_team(
                        teamname.text,
                        teamaddress.text,
                        teamidcard.text,
                        teamcity.text,
                        teamphno.text,
                        teamprofession.text,
                      ).then((value) {
                        add_data_to_team_list(
                          teamname.text,
                          teamaddress.text,
                          teamidcard.text,
                          teamcity.text,
                          teamphno.text,
                          teamprofession.text,
                        );

                        successful_Message();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mainpage()));

//                          Get.to(be_our_team());
                      });
                    }
                  },
                  child: Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColor.purple,
                            AppColor.purple,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: Center(
                      child: Text(
                        'Done'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  team_done() {
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
                      "Your are now in our team",
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
              Image.asset(
                "Assets/images/user_confiremed.png",
                height: 130,
                width: MediaQuery.of(context).size.width * 0.7,
              ),
              SizedBox(
                height: 60.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
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
                        'GO BACK'.toUpperCase(),
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: done_value == "done"
          ? null
          : AppBar(
              toolbarHeight: 80,
              elevation: 0.0,
              leadingWidth: 60.0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
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
              title: Text(
                "Be our Team",
                style: TextStyle(
                  color: AppColor.purple,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.white, //change
//        automaticallyImplyLeading: false,
            ),
      body: done_value == "done" ? team_done() : team_form(),
    );
  }
}
