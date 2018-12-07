import 'dart:io';

import 'package:easymkt2/Screens/MyListProduct/ProductDetail/ProductDetailPage.dart';

import 'package:easymkt2/Class/Product.dart';
import 'package:flutter/material.dart';

enum OrderOptions {orderaz, orderza}

class TrendingListPage extends StatefulWidget {
  static String tag = 'TrendingListPage';

  TrendingListPage();

  @override
  _HomePageBodyState createState() => _HomePageBodyState();


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

class _HomePageBodyState extends State<TrendingListPage> {
  ProductHelper helper = ProductHelper();

  List<Product> products = List();

  @override
  void initState() {
    super.initState();
//    Product p = Product();
////
//    p.name ="Beringela";
//    p.price = "99.9";
//    p.list = "3";
//    p.img = "assets/berinjela.jpg";
//
//    helper.saveProduct(p);

    helper.getProductList(1).then((list){
      print(list);
    });

    _getAllProducts();


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

        },
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),


      body: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _productCard(context, index);
          }
      ),
    );
  }
  Widget _productCard(BuildContext context, int index){
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: products[index].img != null ?
                      FileImage(File(products[index].img)) :
                      AssetImage("images/person.png")
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(products[index].name ?? "",
                      style: TextStyle(fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(products[index].list ?? "",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Text(products[index].price ?? "",
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
        _showOptions(context, index);
      },
    );
  }

  void _showOptions(BuildContext context, int index){
    showModalBottomSheet(
        context: context,
        builder: (context){
          return BottomSheet(
            onClosing: (){},
            builder: (context){
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
//                    Padding(
//                      padding: EdgeInsets.all(10.0),
//                      child: FlatButton(
//                        child: Text("Ligar",
//                          style: TextStyle(color: Colors.red, fontSize: 20.0),
//                        ),
//                        onPressed: (){
//                          launch("tel:${products[index].price}");
//                          Navigator.pop(context);
//                        },
//                      ),
//                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Adicionar na Lista 1",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.updateContact(products[index],1);
//                          Navigator.pop(context);
//                          _showContactPage(product: products[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Adicionar List 2",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.updateContact(products[index],2);
//                          Navigator.pop(context);
//                          _showContactPage(product: products[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Adicionar List 3",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.updateContact(products[index],3);
//                          Navigator.pop(context);
//                          _showContactPage(product: products[index]);
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                        child: Text("Adicionar List 4",
                          style: TextStyle(color: Colors.red, fontSize: 20.0),
                        ),
                        onPressed: (){
                          helper.updateContact(products[index],4);
//                          Navigator.pop(context);
//                          _showContactPage(product: products[index]);
                        },
                      ),
                    ),

                  ],
                ),
              );
            },
          );
        }
    );
  }

  void _showContactPage({Product product}) async {
    final recContact = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetailPage())
    );
    if(recContact != null){
      if(product != null){
        await helper.updateContact(recContact,1);
      } else {
        await helper.saveProduct(recContact);
      }
      _getAllProducts();
    }
  }

  void _orderList(OrderOptions result){
    switch(result){
      case OrderOptions.orderaz:
        products.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderza:
        products.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }
    setState(() {

    });
  }


  void _getAllProducts(){
    helper.getAllContacts().then((list){
      setState(() {
        products = list;
      });
    });
  }
}