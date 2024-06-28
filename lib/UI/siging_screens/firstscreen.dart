import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/UI/siging_screens/signin.dart';
import 'package:metrimonialsullokupdated/UI/siging_screens/signup.dart';

class firstscreen extends StatefulWidget {
  @override
  _firstscreenState createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
//            Container(
//              height: MediaQuery.of(context).size.height*0.7,
//              width: MediaQuery.of(context).size.width,
//              child:Image.asset("Assets/images/firstscreen.png",
//              fit: BoxFit.fill,),
//            ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
              ),

              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signin(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        "Signin",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
//                    border: Border.all(
//                      width: 1.0,
//                      color: appColor
//                    )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(10.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => signup(),
                        ));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Center(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontFamily: "poppins",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
//                    border: Border.all(
//                      width: 1.0,
//                      color: appColor
//                    )
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signup(),
                          ));
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(
                          "Skip Now",
                          style: TextStyle(
                            fontFamily: "poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
