import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/Global/constant.dart';

class admin extends StatefulWidget {
  @override
  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Support",
          style: TextStyle(color: appColor),
        ),
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 50.0,
        backgroundColor: Colors.transparent,
//        brightness: Brightness.light,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: appColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
//                      print(Caste.fromJson(json).id);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Card(
                        elevation: 2.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Icon(Icons.phone,
                                  color: appColor, size: 30.0),
                            ),
                            Expanded(
                              flex: 4,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Call us",
                                  style: TextStyle(
                                      color: appColor,
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      fontFamily: "poppins"),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Card(
                      elevation: 2.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.chat_outlined,
                              color: appColor,
                              size: 30.0,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Chat with us",
                                style: TextStyle(
                                    color: appColor,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "poppins"),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
