class Quotes {
  // late int ownerId;
  late final String owner;
  late final String quote;
  //late final String image;

  Quotes({required this.owner, required this.quote});

  Map toMap() {
    var map = new Map();

    // map['ownerId'] = ownerId;
    map['owner'] = owner;
    map['quote'] = quote;
    //  map['image'] = image;

    return map;
  }

  Quotes.fromMap(Map map) {
    //this.ownerId = map['ownerId'];
    this.owner = map['owner'];
    this.quote = map['quote'];
    // this.image = map['image'];
  }
}
