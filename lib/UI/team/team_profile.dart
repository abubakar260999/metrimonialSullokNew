import 'package:flutter/material.dart';

import '../../Global/constant.dart';
import 'be_our_team.dart';

class team_profile extends StatefulWidget {
  @override
  _team_profileState createState() => _team_profileState();
}

class _team_profileState extends State<team_profile> {
  @override
  String? name;
  String? address;
  String? city;
  String? idcard;
  String? phno;
  String? job;

  final formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    data_function();
  }

  List data = [];
  String? done_value;

  data_function() async {
    data = await read_data_of_team();
    setState(() {
      print("my profile data" + data.toString());
    });
    name = data[0];
    address = data[1];
    city = data[2];
    idcard = data[3];
    phno = data[4];
    job = data[5];
    done_value = data[6];
  }

  info() {
    return Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 20.0, bottom: 40.0),
        child: ListView(
          children: [
            //upper one

            Container(
              child: Center(
                child: Text(
                  "Your info",
                  style: TextStyle(
                    // color: red,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 30.0,
            ),

            ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                size: 20.0,
              ),
              title: Text(
                name!.toUpperCase(),
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.credit_card_rounded,
                size: 20.0,
              ),
              title: Text(
                idcard!,
                style: TextStyle(
                  fontSize: 16.0, fontWeight: FontWeight.w600,
                  // color: red
                ),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/employee.png",
                // color: red,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "job is " + job!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.phone,
                // color: red,
                size: 20.0,
              ),
              title: Text(
                phno!,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/city.png",
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Lives in " + city! + "at Address " + address!,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            SizedBox(
              height: 40.0,
            ),
          ],
        ));
  }

  team_login_first() {
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
                      "Plz make your be our team account first".toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
//                          color:Color(0xff32D554),,
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
//                   decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         colors: [
//                           purple,
//                           purple,
// //                          Color(0xff32D554),
// //                          Color(0xff32D554),
//                         ],
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(10))),

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

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: float_back_button(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: done_value == "done" ? info() : team_login_first(),
    );
  }
}
