import 'dart:async';

import 'package:easymkt2/Class/ShoppingList.dart';
import 'package:easymkt2/models/list_list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class addListPage extends StatefulWidget {

  final ShoppingList list;

  addListPage({this.list});

  @override
  _addListPageState createState() => _addListPageState();
}

class _addListPageState extends State<addListPage> {

  final _nameController = TextEditingController();
  final _dataController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
              onWillPop: _requestPop,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.red,
                  title: Text("Nova Lista"),
                  centerTitle: true,
                ),
//                floatingActionButton: FloatingActionButton(
//                  onPressed: (){
//
//                  },
//                  child: Icon(Icons.save),
//                  backgroundColor: Colors.red,
//                ),
                body: ScopedModelDescendant<ListProductModel>(
                    builder: (context, child, model){
                      return
                SingleChildScrollView(
                  padding: EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (text){
                              if(text.isEmpty) return "Invalid E-mail";
                            },
                            controller: _nameController,
                            focusNode: _nameFocus,
                            decoration: InputDecoration(labelText: "Nome"),
                          ),
                          TextFormField(
                            validator: (text){
                              if(text.isEmpty) return "Invalid E-mail";
                            },
                            controller: _dataController,
                            decoration: InputDecoration(labelText: "Data"),
                            keyboardType: TextInputType.datetime,
                          ),
                          TextFormField(
                            validator: (text){
                              if(text.isEmpty) return "Invalid E-mail";
                            },
                            controller: _descriptionController,
                            decoration: InputDecoration(labelText: "Descrição"),
                            keyboardType: TextInputType.text,
                          ),
                          RaisedButton(
                            child: Text("Criar Conta",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                            textColor: Colors.white,
                            color: Theme.of(context).primaryColor,
                            onPressed: (){
                              if(_formKey.currentState.validate()){
                                Map<String, dynamic> ProductListList={
                                  "title":_nameController.text,
                                  "data": _dataController.text,
                                  "description": _descriptionController.text
                                };
                                model.addList(productListList: ProductListList);
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ],
                      ),
                  )
                );
                    }
                )

              ),
            );
  }



  Future<bool> _requestPop(){
    if(_userEdited){
      showDialog(context: context,
          builder: (context){
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: (){
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
      );
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
