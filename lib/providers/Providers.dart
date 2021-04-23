//import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  int _index = 0;

  ///for getting
  List? _data;
  List<int>? _fav;
  String? quote;
  int ind = -1;
  int get getInd {
    if (ind == 5) {
      ind = -1;
      return 5;
    }
    ind++;
    return ind;
  }

  ///store index of fav icons
  bool _isFavourite = false;

  int get getIndex => _index;

  ///for holding current fav this is called when I store to database
  String? get getQuote => quote;
  void setQuote(quote) async {
    this.quote = quote;
    notifyListeners();
    //savePreferences();
  }

  bool get getIsFavourite => _isFavourite;
  List? get getQuotes => _data;
  List<int>? get getFavourites => _fav!.toList();

  void setFavourite(quote) async {
    _fav!.add(quote);
    notifyListeners();
    //savePreferences();
  }

  void setIsFavourite() async {
    if (_isFavourite) {
      _isFavourite = false;
      notifyListeners();
    } else {
      _isFavourite = true;
      notifyListeners();
    }
    //savePreferences();
  }

  void setQuotes(List data) async {
    _data = data;
    notifyListeners();

    //savePreferences();
  }

  ///setter
  ///decreasing index
  void indexDown() {
    if (_index == 0) {
      _index = 100;
      notifyListeners();
    }
    _index--;
    notifyListeners();
    //savePreferences();
  }

  ///increasing index
  void indexUp() {
    _index++;
    notifyListeners();
    //savePreferences();
  }
}
