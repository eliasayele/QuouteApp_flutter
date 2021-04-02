import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ShowQuote.dart';

class QList {
  final String? name;
  final String? image;
  final int? total;

  QList({this.name, this.image, this.total});
}

List<QList> persons = [
  QList(
    name: 'Elon Musk ',
    image: 'images/elon-musk.jpg',
    total: 10,
  ),
  QList(
    name: 'Barack Obama',
    image: 'images/barack-obama.jpeg',
    total: 20,
  ),
  QList(
    name: 'Albert Einstein',
    image: 'images/Albert-Einstein.png',
    total: 18,
  ),
  QList(
    name: 'Jack Ma',
    image: 'images/jackma.jpg',
    total: 30,
  ),
  QList(
    name: 'Nelson Mandela',
    image: 'images/nelson-mandela.jpg',
    total: 6,
  ),
  QList(
    name: 'Stev Jobs',
    image: 'images/Steve-Jobs.jpg',
    total: 40,
  ),
  QList(
    name: 'Teddy Afro',
    image: 'images/teddyafro.jpg',
    total: 10,
  ),
];

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget QuoteOwnersList() {
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return QuoteTile(
            title: persons[index].name,
            count: persons[index].total,
            image: persons[index].image,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: null),
        ],
      ),
      body: QuoteOwnersList(),
    );
  }
}

class QuoteTile extends StatelessWidget {
  String? image, title;
  int? count;
  QuoteTile({this.image, this.title, this.count});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ShowQuote()));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        height: 170,
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  image!,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                )),
            Container(
              height: 170,
              decoration: BoxDecoration(
                  color: Colors.black45.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6)),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    count!.toString() + ' quotes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
