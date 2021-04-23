import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: ClipPath(
            clipper: CustomAppBar(),
            child: Container(
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nano Garage',
                    style:
                        TextStyle(color: Colors.deepOrangeAccent, fontSize: 25),
                  ),
                  Text(
                    'Success Message',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          preferredSize: Size.fromHeight(kToolbarHeight + 150)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stack(
                children: [
                  Positioned(
                    child: Container(
                        width: 319.0,
                        height: 313.0,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius:
                              BorderRadius.all(const Radius.circular(15.0)),
                        )),
                  ),
                ],
              ),
              Text(
                'Body Part Success Message',
                style: TextStyle(color: Colors.red, fontSize: 30),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    ); //
  }
}
// class ResultScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ClipPath(
//         clipper: CurvedBottomClipper(),
//         child: Column(
//           children: [
//             Container(
//               color: Colors.lightGreen,
//               height: 250.0,
//               child: Center(
//                   child: Padding(
//                 padding: EdgeInsets.only(bottom: 50),
//                 child: Text(
//                   "Nano Garage",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//             ),
//
//             ///second
//             ///container
//             Container(
//               color: Colors.indigo,
//               height: 250.0,
//               child: Center(
//                   child: Padding(
//                 padding: EdgeInsets.only(bottom: 50),
//                 child: Text(
//                   "Space here",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//             ),
//             Container(
//               color: Colors.lightGreen,
//               height: 250.0,
//               child: Center(
//                   child: Padding(
//                 padding: EdgeInsets.only(bottom: 50),
//                 child: Text(
//                   "Nano Garage",
//                   style: TextStyle(
//                     fontSize: 25,
//                     color: Colors.white,
//                   ),
//                 ),
//               )),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CurvedBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     // I've taken approximate height of curved part of view
//     // Change it if you have exact spec for it
//     final roundingHeight = size.height * 3 / 5;
//
//     // this is top part of path, rectangle without any rounding
//     final filledRectangle =
//         Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);
//
//     // this is rectangle that will be used to draw arc
//     // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
//     // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
//     final roundingRectangle = Rect.fromLTRB(
//         -5, size.height - roundingHeight * 2, size.width + 5, size.height);
//
//     final path = Path();
//     path.addRect(filledRectangle);
//
//     // so as I wrote before: arc is drawn from center of roundingRectangle
//     // 2nd and 3rd arguments are angles from center to arc start and end points
//     // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
//     path.arcTo(roundingRectangle, pi, -pi, true);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     // returning fixed 'true' value here for simplicity, it's not the part of actual question, please read docs if you want to dig into it
//     // basically that means that clipping will be redrawn on any changes
//     return true;
//   }
// }
//

class CustomAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 3 / 5;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
        Rect.fromLTRB(0, 0, size.width, size.height - roundingHeight);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        -5, size.height - roundingHeight * 2, size.width + 5, size.height);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi, -pi, true);
    path.close();

    return path;
  }
  //
  // @override
  // Path getClip(Size size) {
  //   Path path = new Path();
  //
  //   //path.lineTo(0, size.height);
  //   // path.quadraticBezierTo(
  //   //     size.width / 4, size.height - 69, size.width / 2, size.height - 20);
  //
  //   path.quadraticBezierTo(
  //       3 / 4 * size.width, size.height, size.width, size.height - 20);
  //
  //   path.lineTo(size.width, 0);
  //
  //   return path;
  // }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
