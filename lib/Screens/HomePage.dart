import 'dart:convert';

import 'package:cameroon_hymnal/Screens/DetailPage.dart';
import 'package:cameroon_hymnal/Widgets/searchWidget.dart';
import 'package:cameroon_hymnal/models/Hymns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = '/hymn-lists';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Hymns> _items = [];
  List<Hymns> result = [];
  TextEditingController txtQuery = new TextEditingController();
  String query = '';
  RxBool _isLightTheme = false.obs;

  // Fetch content from the json file
  Future<List<Hymns>> loadJson() async {
    final response = await rootBundle.loadString('assets/sample.json');
    final data = jsonDecode(response);
    var list = data as List<dynamic>;
    setState(() {
      _items = list.map((e) => Hymns.fromJson(e)).toList();
    });
    throw Exception("No error");
  }

  @override
  void initState() {
    super.initState();
    this.loadJson();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Cameroon Hymnal"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(64, 75, 96, .9),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
            leading: Text("Change Theme"),
            trailing: ObxValue(
              (data) => Switch(
                value: _isLightTheme.value,
                onChanged: (val) {
                  _isLightTheme.value = val;
                  Get.changeThemeMode(
                    _isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
                  );
                },
              ),
              false.obs,
            ),
          ),
        ],
      )),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtQuery,
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                ),
                suffixIcon: IconButton(
                  icon: Icon(CupertinoIcons.clear_thick_circled),
                  onPressed: () {
                    setState(() {
                      txtQuery.text = '';
                      search(txtQuery.text);
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(top: size.height * .48 - 340),
                child: query.isEmpty
                    ? ListView.builder(
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(64, 75, 96, .9),
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //     offset: Offset(0, 5),
                                //     blurRadius: 33,
                                //   ),
                                // ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0, color: Colors.white),
                                    ),
                                  ),
                                  child: Text(
                                    _items[index].id!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  _items[index].name!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      DetailPage.routeName,
                                      arguments: jsonEncode(_items[index]));
                                },
                              ),
                            ),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(64, 75, 96, .9),
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //     offset: Offset(0, 5),
                                //     blurRadius: 33,
                                //   ),
                                // ],
                              ),
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10.0),
                                leading: Container(
                                  padding: EdgeInsets.only(right: 12.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                          width: 1.0, color: Colors.white),
                                    ),
                                  ),
                                  child: Text(
                                    result[index].id!,
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  result[index].name!,
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                trailing: Icon(
                                  Icons.keyboard_arrow_right,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      DetailPage.routeName,
                                      arguments: jsonEncode(result[index]));
                                },
                              ),
                            ),
                          );
                        },
                      )),
          ),
        ],
      ),
    );
  }

  void search(String query) {
    if (query.isEmpty) {
      setState(() {
        result = _items;
      });
      return;
    }

    query = query.toLowerCase();
    print(query);
    result = _items.where((u) {
      var id = u.id!.toLowerCase();
      var name = u.name!.toLowerCase();
      return id.contains(query) || name.contains(query);
    }).toList();

    // _items.forEach((p) {
    //   var name = p.name.toString().toLowerCase();
    //   var id = p.id.toString().toLowerCase();
    //   if (name.contains(query) || id.contains(query)) {
    //     result.add(p);
    //   }
    // });

    setState(() {
      this._items = _items;
      this.query = query;
    });
  }
}
