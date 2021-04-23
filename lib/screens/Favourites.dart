import 'package:flutter/material.dart';
import 'package:life_hacks/models/Quotes.dart';
import 'package:life_hacks/utils/database_helper.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List? quotes;
  DatabaseHelper db = new DatabaseHelper();
  // ignore: missing_return

  @override
  void initState() {
    super.initState();
    db.getAllQuotes().then((quotes) {
      setState(() {
        quotes.forEach((quotes) {
          quotes.add(Quotes.fromMap(quotes));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // var quotes = Provider.of<AppData>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
            shrinkWrap: true,
            itemCount: quotes!.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.black45.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)),
                  child: quotes!.length > 0
                      ? Column(
                          children: [
                            Text(
                              ' "${quotes![index].owner}" ',
                              style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontSize: 15,
                                  color: Colors.black,
                                  //Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('${quotes![index].quote}'),
                          ],
                        )
                      : Text("No Fav Quote's Found"));
            }),
      ),
    );
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
