import 'package:flutter/material.dart';

class ShowQuote extends StatefulWidget {
  @override
  _ShowQuoteState createState() => _ShowQuoteState();
}

class _ShowQuoteState extends State<ShowQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Quote's"),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white30,
        child: Stack(
          children: [
            Positioned(
              // height: MediaQuery.of(context).size.height * 0.5,
              //
              child: Center(
                child: Card(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '"they Said You can do it yes',
                        style: TextStyle(color: Colors.black),
                      ),
                      Image.asset(
                        'images/elon-musk.jpg',
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                  elevation: 0.3,
                ),
              ),
            ),
            Positioned(
              bottom: 170,
              child: Row(
                children: [
                  IconButton(
                      color: Colors.black,
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                      onPressed: null),
                  IconButton(
                      color: Colors.black,
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black,
                      ),
                      onPressed: null),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
