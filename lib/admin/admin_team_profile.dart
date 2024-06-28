import 'package:flutter/material.dart';

import '../Global/constant.dart';

class team_profile_admin extends StatefulWidget {
  @override
  final String name;
  final String address;
  final String city;
  final String idcard;
  final String phno;
  final String profession;

//if you have multiple values add here
  team_profile_admin(this.name, this.address, this.city, this.idcard, this.phno,
      this.profession,
      {required Key key})
      : super(key: key);
  _team_profile_adminState createState() => _team_profile_adminState();
}

class _team_profile_adminState extends State<team_profile_admin> {
  @override
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
                    color: red,
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
                color: red,
                size: 20.0,
              ),
              title: Text(
                widget.name.toUpperCase(),
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600, color: red),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.credit_card_rounded,
                color: red,
                size: 20.0,
              ),
              title: Text(
                widget.idcard,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600, color: red),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/employee.png",
                color: red,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "job is " + widget.profession,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600, color: red),
              ),
            ),

            ListTile(
              leading: Icon(
                Icons.phone,
                color: red,
                size: 20.0,
              ),
              title: Text(
                widget.phno,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600, color: red),
              ),
            ),

            ListTile(
              leading: Image.asset(
                "Assets/images/city.png",
                color: red,
                height: 20.0,
                width: 20.0,
              ),
              title: Text(
                "Lives in " + widget.city + "at Address " + widget.address,
                style: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w600, color: red),
              ),
            ),

            SizedBox(
              height: 40.0,
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: float_back_button(context),
      body: info(),
    );
  }
}
