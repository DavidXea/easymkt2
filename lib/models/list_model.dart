//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:easymkt2/datas/list_list_product.dart';
//import 'package:easymkt2/datas/list_product.dart';
//import 'package:easymkt2/models/user_model.dart';
//import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/material.dart';
//
//class ListModel extends Model{
//
//  UserModel user;
//
//  List<ListProduct> products =[];
//
//  ListModel(this.user);
//
//  static ListModel of(BuildContext context)=>
//      ScopedModel.of<ListModel>(context);
//
//  void addListProduct(ListProduct listProduct){
//    products.add(listProduct);
//
//  Firestore.instance.collection("users").document(user.firebaseUser.uid)
//      .collection("lists").document(listProduct.cid).collection("products").add(listProduct.toMap());
//  notifyListeners();
//  }
//
//  void addList(ProductListList listProduct, String title){
//    lists.add(listProduct);
//
//    Firestore.instance.collection("users").document(title)
//        .collection("lists").add(listProduct.toMap());
//    notifyListeners();
//  }
//
//
//
//  void removeList(ListProduct listList){
//    Firestore.instance.collection("users").document(user.firebaseUser.uid)
//        .collection("lists").document(listList.cid).delete();
//
//    products.remove(listList);
//
//    notifyListeners();
//  }
//
//  void _loadList(){
//
//  }
//}