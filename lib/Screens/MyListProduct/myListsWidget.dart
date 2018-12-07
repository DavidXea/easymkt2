import 'package:easymkt2/Screens/MyListProduct/addListPage.dart';
import 'package:easymkt2/Screens/MyListProduct/tile_lists.dart';
import 'package:easymkt2/datas/list_list_product.dart';
import 'package:easymkt2/models/list_list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
enum OrderOptions {orderaz, orderza}

class listaListPage extends StatelessWidget {
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

  ProductListList list = ProductListList();

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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>AddListPage())
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),

        body: ScopedModelDescendant<ListProductModel>(
            builder: (context, child, model){
              return  ListView(
                children: <Widget>[
                  Column(
                    children: model.lists.map(
                    (list){
                  return ListaTile(list);
                }
            ).toList(),
          ),
//          DiscountCard(),
//          ShipCard(),
//          CartPrice(() async {
//            String orderId = await model.finishOrder();
//            if(orderId != null)
//              Navigator.of(context).pushReplacement(
//                  MaterialPageRoute(builder: (context)=>OrderScreen(orderId))
//              );
//          }),
        ],
      );
    }
    )
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

//  void _showContactPage({ShoppingList list}) async {
//    final recContact = await Navigator.push(context,
//        MaterialPageRoute(builder: (context) => addListPage())
//    );
//    if(recContact != null){
//      if(list != null){
//        await helper.updateContact(recContact);
//      } else {
//        await helper.saveList(recContact);
//      }
//      _getAllContacts();
//    }
//  }

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