//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:easymkt2/datas/list_list_product.dart';
//import 'package:easymkt2/datas/list_product.dart';
//import 'package:easymkt2/models/user_model.dart';
//import 'package:scoped_model/scoped_model.dart';
//import 'package:flutter/material.dart';
//
//class ListProductModel extends Model{
//
//  UserModel user;
//
//  List<ProductListList> lists =[];
//
//  ListProductModel(this.user);
//
//  static ListProductModel of(BuildContext context)=>
//      ScopedModel.of<ListProductModel>(context);
//
//  void addList(ProductListList listProduct){
//    lists.add(listProduct);
//
//    Firestore.instance.collection("users").document(user.firebaseUser.uid)
//        .collection("lists").add(listProduct.toMap());
//    notifyListeners();
//  }
//
//  void removeList(ListProduct listList){
//    Firestore.instance.collection("users").document(user.firebaseUser.uid)
//        .collection("lists").document(listList.cid).delete();
//
//    lists.remove(listList);
//
//    notifyListeners();
//  }
//
//  void _loadList(){
//
//  }
//}