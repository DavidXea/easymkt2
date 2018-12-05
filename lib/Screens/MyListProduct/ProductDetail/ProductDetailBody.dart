import 'package:flutter/material.dart';
import 'package:easymkt2/Class/Product.dart';
import 'package:easymkt2/Class/ShoppingList.dart';

class ProductDetailBody extends StatelessWidget {
  final Product product;

  ProductDetailBody(this.product);

  @override
    Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: new Container(
        constraints: new BoxConstraints.expand(),
//        color: new Color.fromARGB(255, 66, 165, 245),
        child: new Column (
          children: <Widget>[
//            _getToolbar(context),
//            _getBackground(),
//            _getGradient(),
            _getHero(),
            _getName(),
            new Divider(height: 15.0,),
            new Text(
                "Informações :",
                style: new TextStyle(fontSize: 20.0, color: Colors.black),
//                textAlign: TextAlign.center,

            ),
            new Divider(height: 15.0,),
            _getInfos(),
            new Divider(height: 15.0,),
//            _getContent(),

          ],
        ),
      ),
    );
  }


  Container _getHero(){
    return new Container(
      height: 240.0,
      child: new Hero(
      tag: "produto",
      child: new Material(
        elevation: 0.3,
        child: new InkWell(
          child: new Image.asset(
            product.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
    );
}
Container _getInfos(){
  return new Container(
    width: 420.0,

//    padding: new EdgeInsets.all(10.0),
    child: new Card(
      elevation: 0.0,
      child: new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Text(
          "Peso : 99kg \n"
           "Categoria : categoria\n"
           "Marca : marca\n"
            "Cidade : cidade\n"
            "Data fabricação : 00/00/0000\n"
            "Validade : 00/00/0000",
          style: new TextStyle(fontSize: 18.0),
          textAlign: TextAlign.justify,
        ),
      ),
    ),
  );

}

  Container _getName(){
    return new Container(
//      height: 240.0,
      child : new Row(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                  new Text(
                    product.name,
                    style: new TextStyle(fontSize: 30.0, color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                  new Text(
                    "Mercado",
                    style: new TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ],
              ),
        ],
      )
    );
  }


    Container _getBackground () {
        return new Container(
            child: new Image.network(product.img,
              fit: BoxFit.cover,
              height: 300.0,
            ),
              constraints: new BoxConstraints.expand(height: 300.0),
            );
    }

  Container _getGradient() {
       return new Container(
//         margin: new EdgeInsets.only(top: 300.0),
//         height: 110.0,
         decoration: new BoxDecoration(
           gradient: new LinearGradient(
             colors: <Color>[
               new Color.fromARGB(255, 18, 68, 144),
               new Color.fromARGB(255, 66, 165, 245)
              ],
              stops: [0.0, 0.9],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 1.0),
            ),
          ),
        );
      }

  Container _getToolbar(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(
          top: MediaQuery
              .of(context)
              .padding
              .top),
      child: new BackButton(color: Colors.white),
    );
  }

}