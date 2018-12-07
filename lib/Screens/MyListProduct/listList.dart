import 'package:easymkt2/Screens/MyListProduct/editListPage.dart';
import 'package:easymkt2/datas/list_list_product.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {

  final ProductListList list;

  ProductListScreen(this.list);

  @override
  _ProductListScreenState createState() => _ProductListScreenState(list);
}

class _ProductListScreenState extends State<ProductListScreen> {

  final ProductListList list;

  String size;

  _ProductListScreenState(this.list);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(list.title),
        centerTitle: true,
          actions: <Widget>[
            PopupMenuButton(
              itemBuilder: (context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => EditListPage(list))
                        );
//                          model.updateList(list);
                          },
                        child: Text(
                            "Editar"
                        ),
                      ),
//                value: OrderOptions.orderaz,
                ),
                PopupMenuItem(
                  child: Text("Excluir"),
//                value: OrderOptions.orderza,
                ),
              ],
            ),
          ]
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  list.title,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16.0,),
                Text(
                  list.data,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 10.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5
                    ),
                  ),
                ),
                SizedBox(height: 16.0,),
//                SizedBox(
//                  height: 44.0,
//                  child: RaisedButton(
//                    onPressed: size != null ?
//                        (){
//                      if(UserModel.of(context).isLoggedIn()){
//
//                        CartProduct cartProduct = CartProduct();
//                        cartProduct.size = size;
//                        cartProduct.quantity = 1;
//                        cartProduct.pid = product.id;
//                        cartProduct.category = product.category;
//                        cartProduct.productData = product;
//
//                        CartModel.of(context).addCartItem(cartProduct);
//
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (context)=>CartScreen())
//                        );
//
//                      } else {
//                        Navigator.of(context).push(
//                            MaterialPageRoute(builder: (context)=>LoginScreen())
//                        );
//                      }
//                    } : null,
//                    child: Text(UserModel.of(context).isLoggedIn() ? "Adicionar ao Carrinho"
//                        : "Entre para Comprar",
//                      style: TextStyle(fontSize: 18.0),
//                    ),
//                    color: primaryColor,
//                    textColor: Colors.white,
//                  ),
//                ),
                SizedBox(height: 16.0,),
                Text(
                  "Descrição",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  list.description,
                  style: TextStyle(
                      fontSize: 16.0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
