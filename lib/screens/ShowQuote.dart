import 'package:flutter/material.dart';
import 'package:life_hacks/models/Persons.dart';
import 'package:life_hacks/models/Quotes.dart';
import 'package:life_hacks/providers/Providers.dart';
import 'package:life_hacks/utils/database_helper.dart';
import 'package:life_hacks/widgets/PictureCard.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

///---the screen start here----
class ShowQuote extends StatefulWidget {
  @override
  _ShowQuoteState createState() => _ShowQuoteState();
}

class _ShowQuoteState extends State<ShowQuote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        color: Colors.white30,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quote's ",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.indigo,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("World",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.purple,
                          fontFamily: "",
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                height: 5.0,
              ),
            ),
            Expanded(
              child: CenterContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

///picture and icon views are gooing here
class CenterContainer extends StatelessWidget {
  DatabaseHelper db = new DatabaseHelper();
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    double buttonSize = 24;
    var index = Provider.of<AppData>(context);
    var person = Provider.of<Person>(context);
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          ///picture card view going here
          Container(
            height: constraints.maxHeight * .76,
            child: PictureCard(),

            ///
          ),

          ///Row for icons is going here
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Container(
              height: constraints.maxHeight * .2,
              padding: EdgeInsets.only(left: 23),
              // color: Colors.green.withOpacity(.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      db.saveQuote(Quotes(
                        quote: index.getQuote!,
                        owner: person.getName!,
                      ));
                      index.setFavourite(index.getIndex);
                    },
                    child: LikeButton(
                      onTap: onLikeButtonTapped,
                      size: buttonSize,
                      circleColor: CircleColor(
                          start: Color(0xff00ddff), end: Color(0xff0099cc)),
                      bubblesColor: BubblesColor(
                        dotPrimaryColor: Colors.red,
                        dotSecondaryColor: Colors.redAccent,
                      ),
                      likeBuilder: (bool isLiked) {
                        return Icon(
                          Icons.favorite_outline_outlined,
                          color:
                              isLiked ? Colors.deepPurpleAccent : Colors.black,
                          size: buttonSize,
                        );
                      },
                    ),
                  ),
                  InkWell(
                    highlightColor: Colors.redAccent,

                    splashColor: Colors.blue,
                    // When the user taps the button, show a snackbar.
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Tap'),
                      ));
                    },
                    child: IconButton(
                        icon: Icon(
                          Icons.navigate_before_outlined,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          index.indexDown();
                        }),
                  ),
                  IconButton(
                      color: Colors.white,
                      icon: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        index.indexUp();
                      }),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
