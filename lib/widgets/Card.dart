import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_hacks/models/Persons.dart';
import 'package:life_hacks/providers/Providers.dart';
import 'package:provider/provider.dart';

///for car view
class ProfileCard extends StatefulWidget {
  final screenWidth;
  final screenHeight;
  final maxHeight;
  final maxWidth;

  ProfileCard(
      this.screenWidth, this.screenHeight, this.maxHeight, this.maxWidth);
  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  List? data;

  // ignore: missing_return
  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
  }

  @override
  void initState() {
    this.loadJsonData();
    super.initState();
  }

  // int i = 0;
  @override
  Widget build(BuildContext context) {
    var person = Provider.of<Person>(context);
    var appdata = Provider.of<AppData>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(person.getImage!),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 32,
              left: 24,
              right: 0,
              child: Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.8),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, top: 10, bottom: 20),
                  child: data == null
                      ? Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.orange[400],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.getName!,
                              style: TextStyle(
                                  fontFamily: "Proxima Nova Bold",
                                  fontSize: 25,
                                  color: Colors.black,
                                  //color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              ' "${data![appdata.getIndex]["text"]}" ',
                              style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontSize: 15,
                                  color: Colors.black,
                                  //Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // height: MediaQuery.of(context).size.height * 0.90,
  }
}
