import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:life_hacks/models/Persons.dart';
import 'package:provider/provider.dart';

import 'Favourites.dart';
import 'ShowQuote.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List? data;
  Future<String?> loadJsonData() async {
    var jsonText = await rootBundle.loadString('json/quotes.json');
    setState(() => data = json.decode(jsonText));
  }

  @override
  void initState() {
    this.loadJsonData();
    // alert = DateTime.now().add(Duration(seconds: 10));
    super.initState();
  }

//TODO refactor needed
  Widget QuoteOwnersList() {
    List<Person> persons = [
      Person(
        name: 'Elon Musk ',
        image: 'images/elon-musk.jpg',
        total: 10,
      ),
      Person(
        name: 'Teddy Afro',
        image: 'images/teddyafro.jpg',
        total: 10,
      ),
      Person(
        name: 'Barack Obama',
        image: 'images/barack-obama.jpeg',
        total: 20,
      ),
      Person(
        name: 'Albert Einstein',
        image: 'images/Albert-Einstein.png',
        total: 18,
      ),
      Person(
        name: 'Jack Ma',
        image: 'images/jackma.jpg',
        total: 30,
      ),
      Person(
        name: 'Nelson Mandela',
        image: 'images/nelson-mandela.jpg',
        total: 6,
      ),
      Person(
        name: 'Stev Jobs',
        image: 'images/Steve-Jobs.jpg',
        total: 40,
      ),
    ];
    return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
        shrinkWrap: true,
        itemCount: 7,
        itemBuilder: (context, index) {
          return QuoteTile(
            index: index,
            title: persons[index].name,
            count: persons[index].total,
            image: persons[index].image,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // var index = Provider.of<AppData>(context);
    // index.setQuotes(data!);
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
          IconButton(icon: Icon(Icons.settings), onPressed: () {Navigator.push(context,
        MaterialPageRoute(builder: (context) => Favourites()));}),
        ],
      ),
      body: QuoteOwnersList(),
    );
  }
}

class QuoteTile extends StatelessWidget {
  String? image, title;
  int? count;
  String? who;
  int? index;
  QuoteTile({this.index, this.image, this.title, this.count});
  @override
  Widget build(BuildContext context) {
    var person = Provider.of<Person>(context);

    return GestureDetector(
      onTap: () {
        person.setImage(image!);
        print(person.getImage);
        person.setName(title!);
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
              ),
            ),
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
