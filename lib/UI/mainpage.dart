import 'package:card_swiper/card_swiper.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Global/constant.dart';
import '../admin/admin_login.dart';
import 'Metrimonial_mainpage.dart';
import 'notificaition.dart';
import 'outcome_screeen/coming_soon.dart';

class mainpage extends StatefulWidget {
  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> with TickerProviderStateMixin {
  @override
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = Tween<double>(begin: -10, end: 10).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
    animationController?.forward();
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  TextEditingController whatsapp = TextEditingController();
  String? message;

  List images = [
    "Assets/images/matrimonial.png",
    "Assets/images/team.png",
    "Assets/images/campaign.png",
    "Assets/images/financial.png",
    "Assets/images/educational.png",
    "Assets/images/healths.png",
  ];

  List promotions = [
    "Assets/images/marriage_bg_1.jpg",
    "Assets/images/marriage_bg_2.jpg",
    "Assets/images/marriage_bg_3.jpg",
  ];

//  List<Color> colors = [
//    Color(0xffFAC4B9),
//    Color(0xffC8BEFF),
//    Color(0xffFEBFE6),
//    Color(0xffC0E3FD),
//    Color(0xffC8BBFD),
//    Color(0xffBAEBC8),
//  ];

  List categories = [
    "Matrimonial Support",
    "Be Our Team",
    "Current Campaigns",
    "Financial Support",
    "Educational Support",
    "Health Support",
  ];

  final _drawerController = ZoomDrawerController();

  Widget build(BuildContext context) {
    List<Widget> home_pages = [
      // contact_us_body(),
      homebody(),
      // team_body(),
    ];

    return Scaffold(
      drawer: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          elevation: 10.0,
          borderRadius: BorderRadius.circular(10.0),
          child: GestureDetector(
            onTap: () {
              _drawerController.open!();
            },
            child: Container(
              decoration: BoxDecoration(
                color: appcolor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.menu_outlined,
                  size: 24.0,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shadowColor: appcolor,
              pinned: true,
              expandedHeight: 100.0,
              toolbarHeight: 80,
              titleSpacing: 0.0,
              floating: true,
              backgroundColor: concolor,
              elevation: 10.0,
              leadingWidth: 80,
              centerTitle: true,
              forceElevated: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              //
              leading: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Transform.translate(
                  offset: Offset(0, animation!.value),
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      onTap: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: appcolor,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.menu_outlined,
                            size: 24.0,
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Transform.translate(
                    offset: Offset(0, animation!.value),
                    child: Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: GestureDetector(
                        onTap: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => team_profile(),));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => admin_login(),
                              ));
                        },
                        child: Container(
                          width: 50,
                          decoration: BoxDecoration(
                            color: appcolor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(
                              Icons.admin_panel_settings_outlined,
//                            Icons.group_outlined,
                              size: 24.0,
                              color: textColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],

//            flexibleSpace: FlexibleSpaceBar(
//             centerTitle: true,
//              title: Container(
//              height: 30.0,
//              child: Padding(
//                padding: const EdgeInsets.only(top: 8.0),
//                child: Text(
//          "Prefect Match For You",style: TextStyle(
//          fontFamily: "poppins",
//          fontSize: 14.0,
//          fontWeight: FontWeight.w600,
//          color: appcolor
//          ),
//          ),
//              )
//          ),
//
//
////              background: Container(
////                height: 80,
////                width: MediaQuery.of(context).size.width,
////                child: Padding(
////                  padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 10.0),
////                  child: Swiper(
////                    layout: SwiperLayout.CUSTOM,
////                    customLayoutOption:
////                    new CustomLayoutOption(startIndex: -1, stateCount: 3)
////                        .addRotate(
////                        [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
////                      new Offset(-370.0, -40.0),
////                      new Offset(0.0, 0.0),
////                      new Offset(370.0, -40.0)
////                    ]),
////                    itemWidth: MediaQuery.of(context).size.width,
////                    itemHeight: 140,
////                    autoplay: true,
////                    itemCount: promotions.length,
////                    autoplayDelay: 3000,
////                    itemBuilder: (context, index) {
////                      return ClipRRect(
////                        borderRadius: BorderRadius.circular(10),
////                        child: Image.asset(
////                          promotions[index],
////                          fit: BoxFit.fill,
////                        ),
////                      );
////                    },
////                  ),
////                ),
////              ),
//            ),
            ),
          ];
        },
        body: home_pages[_page],
      ),
      bottomNavigationBar: custombottombar(),
      backgroundColor: concolor,

//      body: home_pages[_page],
//      bottomNavigationBar: custombottombar(),
    );
  }

  Widget custombottombar() {
    return CurvedNavigationBar(
      backgroundColor: concolor,
      color: concolor,
      buttonBackgroundColor: appcolor,
      key: _bottomNavigationKey,
      index: 0,

      items: <Widget>[
        // Icon(CupertinoIcons.conversation_bubble, size: 30,color: _page==0?textColor:appcolor,),
//        Icon(CupertinoIcons.conversation_bubble, size: 30,color: _page==0?textColor:appcolor,),
        Icon(
          CupertinoIcons.home,
          size: 30,
          color: _page == 0 ? textColor : appcolor,
        ),
        // Icon(
        //   //Icons.admin_panel_settings_outlined,
        //   Icons.group_outlined,
        //   size: 30,color: _page==2?textColor:appcolor,),
      ],

      // onTap: (index) {
      //   setState(() {
      //  _page=index;
      //   });
      // },
    );
  }

  Widget homebody() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Promotions",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                    color: appcolor),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              child: Swiper(
//                layout: SwiperLayout.CUSTOM,

//                customLayoutOption: new CustomLayoutOption(startIndex: -1, stateCount: 3)
//                    .addRotate(
//                    [-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
//                  new Offset(-370.0, -40.0),
//                  new Offset(0.0, 0.0),
//                  new Offset(370.0, -40.0)
//                ]),
                pagination: new SwiperPagination(),
//                control: new SwiperControl(),
                outer: true,
                viewportFraction: 0.8,
                scale: 0.9,
                itemWidth: MediaQuery.of(context).size.width,
                itemHeight: 100,
                autoplay: true,
                itemCount: promotions.length,
                autoplayDelay: 1000,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      promotions[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Features",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: appcolor),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                    childAspectRatio: 1),

                // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //
                //   mainAxisExtent: 150,
                //     maxCrossAxisExtent:150,
                //     childAspectRatio: 1/2,
                //     crossAxisSpacing: 20,
                //     mainAxisSpacing: 20),
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, index) {
                  if (index == 2 || index == 3 || index == 4 || index == 5) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => coming_soon(),
                            ));
                      },
                      child: Card(
                          elevation: 5.0,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: appcolor,
                          shadowColor: appcolor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Transform.translate(
                                  offset: Offset(0, animation!.value),
                                  child: Image.asset(images[index],
                                      width: 80, height: 70, fit: BoxFit.cover),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    categories[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => be_our_team(),
//                        ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => matrimonial_mainpage(),
                              ));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => coming_soon(),
                              ));
                        }
                      },
                      child: Card(
                          elevation: 5.0,
                          semanticContainer: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
//                    color: colors[index],
                          color: appcolor,
                          shadowColor: appcolor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Transform.translate(
                                    offset: Offset(0, animation!.value),
                                    child: Image.asset(images[index],
                                        width: 80,
                                        height: 70,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    categories[index],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400,
                                      color: textColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }

  Widget contact_us_body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
        child: Container(
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Contact us",
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
    );
  }

  Widget team_body() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage("Assets/images/coming_soon.png"),
      )),
    );
  }
}

//Widget body_card(index) {
//  return GestureDetector(
//    onTap: (){
//      Navigator.pushReplacement(context,
//          MaterialPageRoute(builder:
//              (context) =>Metrimonail_support(),
//          )
//      );
//    },
//    child: Padding(
//      padding: const EdgeInsets.only(bottom: 10.0),
//      child: Container(
//        height: MediaQuery.of(context).size.height*0.3,
//        width: MediaQuery.of(context).size.width,
//        child: Card(
//          elevation: 10.0,
//          semanticContainer: true,
//          shape: RoundedRectangleBorder(
//            borderRadius: BorderRadius.circular(15),
//          ),
//          color: colors[index],
//          shadowColor: appColor,
//          child: Row(
//            children: <Widget>[
//
////Image.network(net_image[index],
////    width: MediaQuery.of(context).size.width,
////    height: MediaQuery.of(context).size.height*0.2,
////    fit: BoxFit.fill,
////),
//
//
//              Expanded(
//                child: Container(
//                  width: MediaQuery
//                      .of(context)
//                      .size
//                      .width *0.50,
//                  height: MediaQuery.of(context).size.height,
//                  child: Center(
//                    child: Text(categories[index]
//                      , maxLines: 2,
//                      overflow: TextOverflow.ellipsis,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//
//                        fontSize: 20.0,
//                        fontWeight: FontWeight.bold,
//                        color: contrastColor,
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//
//              Expanded(
//
//                child: ClipRRect(
//                  borderRadius: BorderRadius.only(
//                    topRight: Radius.circular(15.0),
//                    bottomRight:  Radius.circular(15.0),
//                  ),
//
//                  child: Image.network(net_image[index],
//                      //work onit
//                      width: MediaQuery
//                          .of(context)
//                          .size
//                          .width *0.50,
//                      height: MediaQuery.of(context).size.height,
////                                         .media_details.sizes.thumbnail.source_url
//                      fit:BoxFit.fill
//
//                  ),
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      ),
//    ),
//  );
//}

//Widget homebody() {
//  return Padding(
//    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
//    child: ListView.builder(
//
//        scrollDirection: Axis.vertical,
//        itemCount: categories.length,
//        itemBuilder: (context,index){
//          return body_card(index);
//        }),
//
//  );
//}

//Widget _body() {
//  List<Widget> pages = [
//    homebody(),
//    Container(
//      alignment: Alignment.center,
//      child: Text("SECOND ONE",
//        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
//    ),
//    Container(
//      alignment: Alignment.center,
//      child: Text("Contact",
//        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
//    ),
//
//  ];
//  return IndexedStack(
//    index: _currentIndex,
//    children: pages,
//  );
//}
//
