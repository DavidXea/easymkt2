import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymkt2/datas/list_product.dart';

class ProductListList{
  String lid;

  String description;
  String title;
  String lpId;

  ListProduct listProduct;

  ProductListList();

  ProductListList.fromDocument(DocumentSnapshot document){
    lid = document.documentID;
    description = document.data["description"];
    title = document.data["title"];
  }

  Map<String, dynamic> toMap(){
    return{
      "description": description,
      "title": title,
      "list": listProduct
    };
  }
}