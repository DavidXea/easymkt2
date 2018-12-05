import 'dart:io';

import 'package:easymkt2/Class/ShoppingList.dart';
import 'package:easymkt2/Screens/MyListProduct/ProductList/ProductListPage.dart';
import 'package:easymkt2/Screens/MyListProduct/addListPage.dart';
import 'package:flutter/material.dart';
enum OrderOptions {orderaz, orderza}

class ListPage extends StatelessWidget {
  static String tag = 'ListPage';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  ListHelper helper = ListHelper();

  List<ShoppingList> lists = List();

  @override
  void initState() {
    super.initState();

//    ShoppingList l = ShoppingList();
//
//    l.name ="Lista 1";
//    l.price = "99.9";
//    l.data = "1";
//    l.img = "assets/berinjela.jpg";
//
//    helper.saveList(l);

    helper.getAllContacts().then((list){
      print(list);
    });



    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return new  Scaffold(
//      appBar: AppBar(
//        title: Text("Produtos"),
//        backgroundColor: Colors.red,
//        centerTitle: true,
//        actions: <Widget>[
//          PopupMenuButton<OrderOptions>(
//            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
//              const PopupMenuItem<OrderOptions>(
//                child: Text("Ordenar de A-Z"),
//                value: OrderOptions.orderaz,
//              ),
//              const PopupMenuItem<OrderOptions>(
//                child: Text("Ordenar de Z-A"),
//                value: OrderOptions.orderza,
//              ),
//            ],
//            onSelected: _orderList,
//          )
//        ],
//      ),

      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: (){

          _showContactPage();

        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),


      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: lists.length,
          itemBuilder: (context, index) {
            return _listCard(context, index);
          }
      ),
    );
  }
  Widget _listCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(lists[index].name ?? "",
                      style: TextStyle(fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(lists[index].data ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(lists[index].price ?? "",
                      style: TextStyle(fontSize: 18.0),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ProductListPage(lists[index]))
        );
//        lists[index]


//        _showOptions(context, index);
      },
    );
  }

//  void _showOptions(BuildContext context, int index){
//    showModalBottomSheet(
//        context: context,
//        builder: (context){
//          return BottomSheet(
//            onClosing: (){},
//            builder: (context){
//              return Container(
//                padding: EdgeInsets.all(10.0),
//                child: Column(
//                  mainAxisSize: MainAxisSize.min,
//                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: FlatButton(
//                        child: Text("Ligar",
//                          style: TextStyle(color: Colors.red, fontSize: 20.0),
//                        ),
//                        onPressed: (){
////                          launch("tel:${products[index].price}");
//                          Navigator.pop(context);
//                        },
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: FlatButton(
//                        child: Text("Editar",
//                          style: TextStyle(color: Colors.red, fontSize: 20.0),
//                        ),
//                        onPressed: (){
//                          Navigator.pop(context);
//                          _showContactPage(list: lists[index]);
//                        },
//                      ),
//                    ),
//                    Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: FlatButton(
//                        child: Text("Excluir",
//                          style: TextStyle(color: Colors.red, fontSize: 20.0),
//                        ),
//                        onPressed: (){
//                          helper.deleteContact(lists[index].id);
//                          setState(() {
//                            lists.removeAt(index);
//                            Navigator.pop(context);
//                          });
//                        },
//                      ),
//                    ),
//                  ],
//                ),
//              );
//            },
//          );
//        }
//    );
//  }

  void _showContactPage({ShoppingList list}) async {
    final recContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => addListPage())
    );
    if(recContact != null){
      if(list != null){
        await helper.updateContact(recContact);
      } else {
        await helper.saveList(recContact);
      }
      _getAllContacts();
    }
  }

//  void _orderList(OrderOptions result){
//    switch(result){
//      case OrderOptions.orderaz:
//        lists.sort((a, b) {
//          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
//        });
//        break;
//      case OrderOptions.orderza:
//        lists.sort((a, b) {
//          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
//        });
//        break;
//    }
//    setState(() {
//
//    });
//  }


  void _getAllContacts(){
    helper.getAllContacts().then((list){
      setState(() {
        lists = list;
      });
    });
  }
}



//import 'package:flutter/material.dart';
//import 'package:easymktf/Pages/MyListProduct/listList.dart';
//import 'package:easymktf/drawer.dart';
//
//
//class MyLists extends StatefulWidget{
//  MyListsState createState()=> MyListsState();
//}
//
//
//class MyListsState extends State<MyLists> {
//  @override
//  Widget build(BuildContext context) {
//    return new  Scaffold(
//      body: new listList(),
//
//
//      floatingActionButton: new FloatingActionButton(
//        onPressed: null,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ),
//
//      drawer:drawer(context) ,
//    );
//
//
//  }
//}