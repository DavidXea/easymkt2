import 'package:flutter/material.dart';

class Search extends StatefulWidget{
  SearchState createState()=> SearchState();
}


class SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView(
//          mainAxisAlignment: MainAxisAlignment.center,
        children : <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 10.0),
            child:  new TextField(
              decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder()
              ),
            ),
          ),
          new Container(
            child: new ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FloatingActionButton(
                    child: new Text("Filtro",style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.red,
                    elevation: 3.0,
                    onPressed: null),
                new FloatingActionButton(
                    child: new Text("Filtro",style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.blue,
                    onPressed: null),
                new FloatingActionButton(
                    child: new Text("Filtro",style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    backgroundColor: Colors.green,
                    onPressed: null),
              ],
            ),
          ),
        ],
      ),

//      floatingActionButton: new FloatingActionButton(
//        onPressed: null,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}