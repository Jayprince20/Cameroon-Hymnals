import 'package:cameroon_hymnal/Screens/HomePage.dart';
import 'package:cameroon_hymnal/Widgets/SplashScreen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      loadingTextPadding: EdgeInsets.all(10),
      useLoader: true,
      seconds: 3,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Cameroon Hymnal',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40.0,
          color: Colors.white,
        ),
      ),
      image: Image.asset(
        "assets/images/praise.png",
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height,
      ),
      backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 100.0,
      onClick: () => print(""),
      loaderColor: Colors.blue,
    );
  }
}
