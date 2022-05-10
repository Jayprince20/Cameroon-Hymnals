import 'dart:convert';

import 'package:cameroon_hymnal/models/Hymns.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  DetailPage({
    Key? key,
  }) : super(key: key);
  static const String routeName = '/hymn-detail';

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var hymnDescrip = "";
  Hymns? hymns;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    var hymnString = ModalRoute.of(context)?.settings.arguments as String;
    print('page 2');
    print(hymnString);

    var productJson = jsonDecode(hymnString);
    print(productJson);

    setState(() {
      hymns = Hymns.fromJson(productJson);
      hymnDescrip = hymns!.name!;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 10.0),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: new AssetImage("assets/images/splash.png"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  padding: EdgeInsets.all(40.0),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50.0),
                        Icon(
                          Icons.chrome_reader_mode_sharp,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        Container(
                          width: 90.0,
                          child: new Divider(color: Colors.green),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          hymns!.name!,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 6,
                              child: Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                  "Lets Pray",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 8.0,
                  top: 60.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                hymns!.description!,
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
