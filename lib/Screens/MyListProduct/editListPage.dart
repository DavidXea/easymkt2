import 'dart:async';

import 'package:easymkt2/Class/ShoppingList.dart';
import 'package:easymkt2/datas/list_list_product.dart';
import 'package:easymkt2/models/list_list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class EditListPage extends StatefulWidget {

  final ProductListList list;

  EditListPage(this.list);




  @override
  _EditListPageState createState() => _EditListPageState(list);
}

class _EditListPageState extends State<EditListPage> {

  final ProductListList list;

  _EditListPageState(this.list);

  TextEditingController _nameController = TextEditingController();
  TextEditingController _dataController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: list.title);
    _dataController = new TextEditingController(text: list.data);
    _descriptionController = new TextEditingController(text: list.description);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Editar Lista"),
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
                                if(text.isEmpty) return "Invalid Name";
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
                            SizedBox(height: 20,),
                            RaisedButton(
                              child: Text("Editar Lista",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                              textColor: Colors.white,
                              color: Theme.of(context).primaryColor,
                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  list.title = _nameController.text;
                                  list.description = _descriptionController.text;
                                  list.data = _dataController.text;

                                  Map<String, dynamic> ProductListList={
                                    "title":_nameController.text,
                                    "data": _dataController.text,
                                    "description": _descriptionController.text
                                  };
                                  model.updateList(productList: list);
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
