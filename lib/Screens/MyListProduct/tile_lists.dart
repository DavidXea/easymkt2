import 'package:easymkt2/Screens/MyListProduct/listList.dart';
import 'package:easymkt2/datas/list_list_product.dart';
import 'package:flutter/material.dart';

class ListaTile extends StatelessWidget {

  final ProductListList list;

  ListaTile(this.list);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
//        Navigator.of(context).push(
//            MaterialPageRoute(builder: (context)=>ProductListScreen(list))
//        );
      },
      child: GestureDetector(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        list.title,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(list.description,
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                    child :Text(list.data,
                      style: TextStyle(
                          fontSize: 18.0
                      ),
                    )
                ),

              ],
            ),
          ),
        ),

        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ProductListScreen(list))
          );
        },
      )
    );
  }
}