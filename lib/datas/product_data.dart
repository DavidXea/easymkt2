import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String category;

  String id;
  String title;
  String description;

  String market;

  double price;
  String image;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"];
    image = snapshot.data["image"];
    market = snapshot.data["market"];
  }

  Map<String, dynamic> toResumedMap(){
    return{
      "title":title,
      "description": description,
      "price" : price
    };
  }
}