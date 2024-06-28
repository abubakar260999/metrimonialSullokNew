import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Global/constant.dart';
import '../notificaition.dart';

class interested extends StatefulWidget {
  String? name;
  String? password;

  interested(this.name, this.password, {Key? key}) : super(key: key);

  _interestedState createState() => _interestedState();
}

class _interestedState extends State<interested> {
  @override
  TextEditingController whatsapp = TextEditingController();
  String? message;

  String? name_request_sender;
  String? password_request_sender;
  String? gender_request_sender;

  void initState() {
    super.initState();
    data_function();
  }

  List data = [];
  data_function() async {
    data = await read_data_of_list();
    if (data != null) {
      name_request_sender = data[1];
      password_request_sender = data[2];
      gender_request_sender = data[3];
    }
    message = "Id name" +
        "  " +
        name_request_sender! +
        " having password" +
        " " +
        password_request_sender! +
        "Requesting  to " +
        widget.name! +
        " " +
        widget.password!;
    whatsapp.text = "Id name" +
        "  " +
        name_request_sender! +
        " having password" +
        " " +
        password_request_sender! +
        " to " +
        widget.name!;
    setState(() {
      print(gender_request_sender);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: float_back_button(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
            child: Container(
              child: Center(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "A Request Will send to Admin ",
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
//                        onChanged: (text) {
//                          setState(() {
//                            message = text;
//                          });
//                        },
                          keyboardType: TextInputType.multiline,
                          minLines: 2,
                          maxLines: null,
                          decoration: new InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: appcolor, width: 0.0),
                            ),

                            labelText: "Interest Message",
                            fillColor: Colors.white,
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 12.0),
                            prefixIcon: Icon(
                              Icons.chat_outlined,
                              color: appcolor,
                            ),
//                      enabledBorder: OutlineInputBorder(
//                        borderSide: BorderSide(color: app_color, width: 0.0),
//                      ),
                            labelStyle:
                                TextStyle(fontSize: 14.0, color: appcolor),
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: new BorderSide(color: Colors.blue),
                            ),
                          ),
                          style: new TextStyle(
                            color: appcolor,
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
                                  request_Message();
                                }
                              } else {
                                empty_whatsapp_message();
                              }
                            },
                            child: Container(
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: appcolor,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Send Request'.toUpperCase(),
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

//                  GestureDetector(
//                    onTap: () async {
//
//                      Uri url = Uri( scheme: 'mailto',
//                          path: mail);
//                      if (await canLaunch(url.toString()) != null) {
//                        await launch(url.toString());
//                      } else {
//                      }
//
//                    },
//                    child: Container(
//                      width: MediaQuery.of(context).size.width,
//                      height: 90,
//
//
//                      child: Card(
//                        elevation: 2.0,
//                        color: appcolor,
//
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//
//                            Expanded(
//                              flex: 2,
//                              child: Icon(Icons.chat_outlined,
//                                color:Colors.white,
//                                size: 25.0,),
//                            ),
//
//                            Expanded(
//                              flex: 4,
//                              child: FittedBox(
//                                fit:BoxFit.scaleDown,
//                                child: Text(
//                                  "Mail us",
//                                  style: TextStyle(
//                                      color:Colors.white,
//                                      fontSize: 15.0,
//                                      fontWeight: FontWeight.w800,
//                                      fontFamily: "poppins"
//                                  ),
//                                ),
//                              ),
//                            ),
//
//                            Expanded(
//                              flex: 3,
//                              child: Container(
//                              ),
//
//
//                            )
//                          ],
//                        ),
//                      ),
//                    ),
//                  )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
