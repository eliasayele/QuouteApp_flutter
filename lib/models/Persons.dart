import 'package:flutter/foundation.dart';

///this class is for person for quote owners
class Person extends ChangeNotifier {
  String? name;
  String? image;
  int? total; // total number of quotes they have

  Person({this.name, this.image, this.total});

  ///getter method for person prop
  String? get getName => name;
  String? get getImage => image;
  int? get getTotal => total;

  ///may not be used but let's set seter methods..
  void setName(String namee) {
    name = namee;
    notifyListeners();

    //savePreferences();
  }

  void setImage(String imagee) {
    image = imagee;
    notifyListeners();

    //savePreferences();
  }

  void setTotal(String total) {
    total = total;
    notifyListeners();

    //savePreferences();
  }

  ///lets create list of person for displaying in the list

  //List<Person> get GetPersonList => persons;
}
