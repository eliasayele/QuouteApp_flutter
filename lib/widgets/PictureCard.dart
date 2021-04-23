import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_hacks/widgets/Card.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:life_hacks/models/Persons.dart';
class PictureCard extends StatefulWidget {
  @override
  _PictureCardState createState() => _PictureCardState();
}

class _PictureCardState extends State<PictureCard> {
  List<Widget> widgetList = [];
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return LayoutBuilder(builder: (context, constraints) {
      var maxHeight = constraints.maxHeight;
      var maxWidth = constraints.maxWidth;

      return Stack(children: [
        ProfileCard(
          screenWidth,
          screenHeight,
          maxHeight,
          maxWidth,
        ),
      ]
        // widgetList =
        //     buildCardList(maxWidth, maxHeight, screenHeight, screenWidth),
      );
    });
  }

//List for storing list cards
// List<Widget> buildCardList(double maxWidth, double maxWeight,
//     double screenHeight, double screenWidth) {
//   widgetList.add(ProfileCard());
//   return widgetList;
// }
}
