import 'package:flutter/material.dart';
import 'package:easymkt2/drawer.dart';

class Recommended extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;



  Recommended({this.onPressed, this.tooltip, this.icon});

  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black12,
      body:  Container(
          child: _getList(),
      ),
      drawer: drawer(context),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        elevation: 2.0,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }

  Widget _getList(){
    return new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        _getContainer(),
        new Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        _getContainer(),
        new Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        _getContainer(),
        new Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
        _getContainer(),
      ],
    );
  }


  Container _getContainer(){
    return Container(
      color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),),
            new Text(
              "Recomendado para você",
              style: TextStyle(color: Colors.black,fontSize: 30.0,),
            ),
            new Text(
              "Sugestões com base no que você curtiu \n"
                "ou adicionoi a lista de compras",
              style: TextStyle(color: Colors.black38,fontSize: 14.0),
              textAlign: TextAlign.start,
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            new Container(
              child : ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                    _getContainerSmall(),
                  ]
              ),
//              width: 100.0,
              height: 200.0,
            )
          ],
        ),
//        width: 400.0,
//        height: 400.0,
    );
  }

  Container _getContainerSmall(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0)),
          Container(
            decoration:  BoxDecoration(
                border:  Border.all(
                    color: Colors.black12)
            ),
            child: Image.asset("assets/berinjela.jpg"),
          ),
          Text("Beringela",),
          Text("Apartir de 1,99 ", style: TextStyle(color: Colors.black38,fontSize: 14.0)),
        ],
      ),
      width: 200.0,
      height: 300.0,
//      color: Colors.orange,
    );
  }
}