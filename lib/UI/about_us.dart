import 'package:flutter/material.dart';

import '../Global/constant.dart';

class about_us extends StatefulWidget {
  // const about_us(Key key) : super(key: key);
  @override
  State<about_us> createState() => _about_usState();
}

class _about_usState extends State<about_us> {
  @override
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
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "About Us",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w800,
                        color: appcolor),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Image.asset(
                  "Assets/images/sulook_logo.png",
                  height: 200,
                  width: MediaQuery.of(context).size.width * 0.80,
                  color: appcolor,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    app_name,
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.w800,
                        color: appcolor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "$app_name is a multi purpose App.For now, it provides you matrimonial suppport. In which you can make profile and see propective partners profile,Your matches,Your prefect matches,the profiles looking for you.More over you can search and filter more profiles.And Reach out to us from contact us page.",
                    style: TextStyle(
                        wordSpacing: 1.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800,
                        color: appcolor),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
