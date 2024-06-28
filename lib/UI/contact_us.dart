import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global/constant.dart';
import 'notificaition.dart';

class contact_us extends StatefulWidget {
  const contact_us({Key? key}) : super(key: key);

  @override
  State<contact_us> createState() => _contact_usState();
}

class _contact_usState extends State<contact_us> {
  @override
  TextEditingController whatsapp = TextEditingController();
  String? message;

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),

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
                                  color: appcolor,
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

                SizedBox(
                  height: 20.0,
                ),

                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Contact Us",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w800,
                        color: appcolor),
                  ),
                ),

                SizedBox(
                  height: 50,
                ),

                Column(
                  children: [
                    TextField(
                      controller: whatsapp,
                      onChanged: (text) {
                        setState(() {
                          message = text;
                        });
                      },
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: null,
                      decoration: new InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appcolor, width: 0.0),
                        ),

                        labelText: "Whatsapp Message",
                        fillColor: Colors.white,
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 12.0),
                        prefixIcon: Icon(
                          Icons.chat_outlined,
                          color: appcolor,
                        ),
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: app_color, width: 0.0),
//                      ),
                        labelStyle: TextStyle(fontSize: 14.0, color: appcolor),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: new BorderSide(color: Colors.blue),
                        ),
                      ),
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () async {
                          if ((whatsapp.text.isNotEmpty)) {
                            if ((message != '')) {
                              await launch(
                                  "https://wa.me/${phone}?text=$message");
                            }
                          } else {
                            empty_whatsapp_message();
                          }
                        },
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Send Whatsapp Message'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                  ],
                ),

//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: GestureDetector(
//                      onTap: () async {
//                        Uri url = Uri(scheme: "tel", path: phone);
//                        if (await canLaunch(url.toString()) != null) {
//                        await launch(url.toString());
//                        } else {
//                        }
//                      },
//                      child: Container(
//
//                        width: MediaQuery.of(context).size.width,
//                        height:70,
//                        child: Card(
//                          elevation: 2.0,
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.start,
//                            children: [
//                              Expanded(
//                                flex: 2,
//                                child: Icon(Icons.phone, color: purple,
//                                    size: 30.0),
//                              ),
//                              Expanded(
//                                flex: 4,
//                                child: FittedBox(
//                                  fit:BoxFit.scaleDown,
//                                  child: Text(
//                                    "Call us",
//                                    style: TextStyle(
//                                        color: purple,
//                                        fontSize: 12.0,
//                                        fontWeight: FontWeight.w300,
//                                        fontFamily: "poppins"
//                                    ),
//                                  ),
//                                ),
//                              ),
//
//                              Expanded(
//                                flex: 3,
//                                child: Container(
//
//                                ),
//                              )
//                            ],
//                          ),
//                        ),
//                      ),
//                  ),
//                   ),

                GestureDetector(
                  onTap: () async {
                    Uri url = Uri(scheme: 'mailto', path: mail);
                    if (await canLaunch(url.toString()) != null) {
                      await launch(url.toString());
                    } else {}
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    child: Card(
                      elevation: 2.0,
                      color: appcolor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.chat_outlined,
                              color: Colors.white,
                              size: 25.0,
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Mail us",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w800,
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
    ));
  }
}
