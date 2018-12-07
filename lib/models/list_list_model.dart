import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easymkt2/datas/list_list_product.dart';
import 'package:easymkt2/datas/list_product.dart';
import 'package:easymkt2/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class ListProductModel extends Model{

  UserModel user;

  List<ProductListList> lists =[];

  ListProductModel(this.user){
    _loadLists();
  }

   ProductListList lista = ProductListList();

  static ListProductModel of(BuildContext context)=>
      ScopedModel.of<ListProductModel>(context);

  void addList({@required Map<String, dynamic> productListList}){
    lista.title = productListList["title"];
    lista.description = productListList["description"];
    lista.data = productListList["data"];
    lists.add(lista);

    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("lists").add(productListList);
    notifyListeners();


  }

  void removeList(ListProduct listList){
    Firestore.instance.collection("users").document(user.firebaseUser.uid)
        .collection("lists").document(listList.cid).delete();

    lists.remove(listList);

    notifyListeners();
  }

  void _loadLists() async {

    QuerySnapshot query = await Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("lists")
        .getDocuments();

    lists = query.documents.map((doc) => ProductListList.fromDocument(doc)).toList();

    notifyListeners();
  }

  void updateList({ProductListList productList}){
    lista.title = productList.title;
    lista.description = productList.description;
    lista.data = productList.data;


    Firestore.instance.collection("users").document(user.firebaseUser.uid).collection("lists")
        .document(productList.lid).updateData(productList.toMap());

    notifyListeners();
  }
}