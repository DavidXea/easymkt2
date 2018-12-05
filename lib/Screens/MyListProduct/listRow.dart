//import 'package:easymktf/Pages/MyListProduct/ProductList/ProductListPage.dart';
//import 'package:flutter/material.dart';
//import 'package:easymktf/Class/ShoppingList.dart';
//
//class ListRow extends StatelessWidget{
//
//  final ShoppingList list;
//
//  ListRow(this.list);
//
//  @override
//  Widget build(BuildContext context) {
//    return new Card(
//      child: new Container(
////          margin: const EdgeInsets.only(left: 0.0, right: 0.0),
//        height: 72.0,
//        child: new FlatButton(
//          onPressed: () => _navigateTo(context, list.id),
//
//          child: new Row(
//            children: <Widget>[
////              _getlistImage(list.img),
//              new Padding(padding: EdgeInsets.only(right: 10.0)),
//                  _getColumText(list.name, list.price),
//                  _getPriceWidget(list.price),
////            planetThumbnail,
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//
//  _navigateTo(context, String id) {
//    var route = new MaterialPageRoute(
//      builder: (BuildContext context) => new ProductListPage(),
//    );
//    Navigator.of(context).push(route);
//  }
//
//  Widget _getListTile(){
//    // Foi adicionado dentro de Container para adicionar altura fixa.
//    return new Container(
//      height: 72.0,
//      child: new Row(
//        crossAxisAlignment: CrossAxisAlignment.start,
//        children: <Widget>[
//          new FadeInImage.assetNetwork(placeholder: '', image: list.img,fit: BoxFit.cover,width: 95.0,height: 95.0,),
//          _getColumText(list.name,list.totalPrice),
//        ],
//      ),
//    );
//
//  }
//  Widget _getColumText(tittle,price){
//    return new Expanded(
//        child: new Container(
//          margin: new EdgeInsets.all(10.0),
//          child: new Column(
//            crossAxisAlignment:CrossAxisAlignment.start,
//            children: <Widget>[
//              _getNameWidget(list.name),
//              new Padding(padding: EdgeInsets.only(left: 30.0,right: 30.0)),
//              _getProductsWidget(),
//            ],
//          ),
//        )
//    );
//  }
//
//  Widget _getNameWidget(String curencyName){
//    return new Text(
//      curencyName,
//      maxLines: 1,
//      style: new TextStyle(
//          fontWeight: FontWeight.bold,
//          fontSize: 20.0,
//      ),
//    );
//  }
//
//  Widget _getlistImage(String img) {
//    return new Container(
//      width: 100.0,
//      height: 100.0,
//      decoration: new BoxDecoration(
//        shape: BoxShape.circle,
//        image: new DecorationImage(
//          fit: BoxFit.cover,
//          image: AssetImage(img),
//        ),
//      ),
//    );
//  }
//
//  Widget _getPriceWidget(String price){
//    return new Text(
//      "Valor total : $price",
//      style: new TextStyle(
//          color: Colors.grey,
//          fontSize: 20.0),
//      textAlign: TextAlign.end,
//    );
//  }
//  Widget _getProductsWidget(){
//    return new Text("Produtos : 10",
//      style: new TextStyle(
//          color: Colors.grey,
//          fontSize: 20.0),
//    );
//  }
//}