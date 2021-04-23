import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_hacks/models/Persons.dart';
import 'package:life_hacks/providers/Providers.dart';
import 'package:provider/provider.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List? quotes;
  // DatabaseHelper db = new DatabaseHelper();
  // ignore: missing_return
  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => quotes = json.decode(jsonText));
  }

  @override
  void initState() {
    super.initState();
    this.loadJsonData();
    // db.getAllQuotes().then((quotes) {
    //   setState(() {
    //     quotes.forEach((quotes) {
    //       quotes.add(Quotes.fromMap(quotes));
    //     });
    //   });
    // });
  }

  List images = [
    "images/p1.jpg",
    "images/p2.jpg",
    "images/p3.jpg",
    "images/p4.jpg",
    "images/p5.jpeg",
    "images/p6.jpg",
  ];
  int ind = 0;
  @override
  Widget build(BuildContext context) {
    var quotess = Provider.of<AppData>(context);
    var person = Provider.of<Person>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Quote's",
              style: TextStyle(fontSize: 40),
            ),
            Text("World", style: TextStyle(fontSize: 40, color: Colors.red)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
              shrinkWrap: true,
              itemCount: quotes!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('${images[quotess.getInd]}'),
                        ),
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Wrap(children: [
                          Text(' \" ${quotes![index]['text']} \" ',
                              style: Theme.of(context).textTheme.headline6),
                        ]),
                      ),
                    ),
                    // : Text("No Fav Quote's Found"));
                  ),
                );
              }),
        ),
      ),
    );
    // );
  }
}

// class _CompletedState extends State<Quotes> {
//   // List<Quotes> quotes = [
//   //   Quotes(owner: 'Abebe Kebede', quote: 'Tesla', image: 'assets/carblue.jpg'),
//   //   Quotes(owner: 'Abebe Kebede', quote: 'Tesla', image: 'assets/images.jpeg'),
//   //   Quotes(owner: 'Abebe Kebede', quote: 'Tesla', image: 'assets/images.jpeg'),
//   //   Quotes(owner: 'Abebe Kebede', quote: 'Tesla', image: 'assets/car3.jpeg'),
//   // ];
//
//   Widget quoteDetailCard(Quotes quote) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Card(
//         color: Colors.grey[800],
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                     width: 50.0,
//                     height: 50.0,
//                     decoration: new BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: new DecorationImage(
//                             fit: BoxFit.cover,
//                             image: AssetImage(quote.image)))),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     quote.owner,
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   Text(
//                     quote.quote,
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[900],
//       body: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Text(
//                   "Quote's",
//                   style: TextStyle(fontSize: 40),
//                 ),
//                 Text("World",
//                     style: TextStyle(fontSize: 40, color: Colors.red)),
//               ],
//             ),
//             Column(
//                 children: quotes.map((p) {
//               return quoteDetailCard(p);
//             }).toList())
//           ],
//         ),
//       ),
//     );
//   }
// }
