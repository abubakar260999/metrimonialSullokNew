import 'package:flutter/material.dart';

import '../../Global/constant.dart';

class no_match_screen extends StatefulWidget {
  @override
  _no_match_screenState createState() => _no_match_screenState();
}

class _no_match_screenState extends State<no_match_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: concolor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 20.0,
              width: MediaQuery.of(context).size.width - 20,
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: appcolor,
                    size: MediaQuery.of(context).size.width * 0.3,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "No Match Here till now",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: appcolor,
                        fontSize: 20.0,
                        fontFamily: "poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
