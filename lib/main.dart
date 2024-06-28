import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:metrimonialsullokupdated/theme.dart';

import 'UI/splashscreen.dart';


//class MyHttpOverrides extends HttpOverrides{
//  @override
//  HttpClient createHttpClient(SecurityContext context){
//    return super.createHttpClient(context)
//      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
//  }
//}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  // Use the generated options
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme
      theme: Themes().lightTheme(),
      darkTheme: Themes().darkTheme(),
      themeMode: ThemeMode.dark,

      home: Splashscreen(),
    );
  }
}

// personal_info("url", "url", "url","name","name"),
//      profile_image_screen()

//      profile(),
//    select_login(),
//      profile_login(),
//      edit_main(),
//      name_password_screen("url", "url", "url"),
//      profile_image_screen(),
//        name_password_screen(),
//        Splashscreen(),
//      profile_login(),
//id_card_screen("url"),
//      full_body_image_screen("url","url"),
//      admin_main()
//      name_password_screen(),
//      sesarch(),
//      user_confirmed(),
//      mprofile("url","url","url"),
//        Signuppage(),
//          Loginpage(),
//        Referedpage(),
//      getinfo(),
//      admin_login(),
