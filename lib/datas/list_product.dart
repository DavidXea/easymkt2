import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymkt2/datas/product_data.dart';

class ListProduct{


  String category;
  String pid;
  int quantity;

  String cid;
  String description;
  String title;


  ProductData productData;

  ListProduct();

  ListProduct.fromDocument(DocumentSnapshot document){
    cid = document.documentID;
    category = document.data["category"];
    pid = document.data["pid"];
    quantity = document["quatity"];
  }

  Map<String, dynamic> toMap(){
    return {
      "category": category,
      "pid": pid,
      "quantity": quantity,
//      "product": productData.toResumedMap()
    };
  }
}