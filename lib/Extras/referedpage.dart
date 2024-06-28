//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_country_picker/country.dart';
//import 'package:flutter_country_picker/flutter_country_picker.dart';
//import 'package:metrimonialsulook/Global/constant.dart';
//import 'loginpage.dart';
//
//class Referedpage extends StatefulWidget {
//  @override
//  _ReferedpageState createState() => _ReferedpageState();
//}
//
//class _ReferedpageState extends State<Referedpage> {
//  @override
//  Country _selected;
//  Widget build(BuildContext context) {
//    return Scaffold(
//
//      body: Container(
//        width: MediaQuery.of(context).size.width,
//        height: MediaQuery.of(context).size.height,
//        child: Column(
//
//          children: [
//
//
//            Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height/2.5,
//              decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      appColor2,
//                      appColor,
//                    ],
//                  ),
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(90)
//                  )
//              ),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Spacer(),
//                  Spacer(),
//
//                  Align(
//                    alignment: Alignment.bottomRight,
//                    child: Padding(
//                      padding: const EdgeInsets.only(
//                          bottom: 32,
//                          right: 32
//                      ),
//                      child: Text('Referred by',
//                        style: TextStyle(
//                            color: Colors.white,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 25.0,
//                        ),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//
//
//
//            //refereealll plz
//
//            SizedBox(
//              height: 40.0,
//            ),
//
//            Center(
//              child: Container(
//                width: MediaQuery.of(context).size.width/1.2,
//                height: 45,
//                margin: EdgeInsets.only(top: 32),
//                padding: EdgeInsets.only(
//                    top: 4,left: 16, right: 16, bottom: 4
//                ),
//                decoration: BoxDecoration(
//                    borderRadius: BorderRadius.all(
//                        Radius.circular(50)
//                    ),
//                    color: Colors.white,
//                    boxShadow: [
//                      BoxShadow(
//                          color: Colors.black12,
//                          blurRadius: 5
//                      )
//                    ]
//                ),
//                child: TextField(
//                  decoration: InputDecoration(
//                      border: InputBorder.none,
////                              icon: Icon(Icons.vpn_key,
////                                color: Color(0xff6bceff),
////                              ),
//                      icon: CountryPicker(
//
//                        nameTextStyle: TextStyle(
//                          fontSize: 18.0,
//                          fontWeight: FontWeight.w700,
//                        ),
//                        dense: false,
//                        showFlag: true,  //displays flag, true by default
//                        showDialingCode: false, //displays dialing code, false by default
//                        showName: false, //displays country name, true by default
//                        showCurrency: false, //eg. 'British pound'
//                        showCurrencyISO: false, //eg. 'GBP'
//                        onChanged: (Country country) {
//                          setState(() {
//                            _selected = country;
//                          });
//                        },
//                        selectedCountry: _selected,
//                      ),
//
//                      hintText: 'Contact no',
//                      hintStyle: TextStyle(
//                        fontSize: 18.0,
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//      SizedBox(
//        height: 80.0,
//      ),
//
//           GestureDetector(
//             onTap:(){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Loginpage()),
//               );
//             },
//             child: Container(
//                height: 45,
//                width: MediaQuery.of(context).size.width/1.2,
//                decoration: BoxDecoration(
//                    gradient: LinearGradient(
//                      colors: [
//                      appColor2,
//                        appColor,
//                      ],
//                    ),
//                    borderRadius: BorderRadius.all(
//                        Radius.circular(50)
//                    )
//                ),
//                child: Center(
//                  child: Text('Done'.toUpperCase(),
//                    style: TextStyle(
//                      fontSize: 18.0,
//                        color: Colors.white,
//                        fontWeight: FontWeight.bold
//                    ),
//                  ),
//                ),
//              ),
//           ),
//
//          ],
//        ),
//
//      ),
//    );
//  }
//}
