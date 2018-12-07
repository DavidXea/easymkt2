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

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(list.title),
        centerTitle: true,
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
//                Text(
//                  "R\$ ${product.price.toStringAsFixed(2)}",
//                  style: TextStyle(
//                      fontSize: 22.0,
//                      fontWeight: FontWeight.bold,
//                      color: primaryColor
//                  ),
//                ),
                SizedBox(height: 16.0,),
                Text(
                  "Tamanho",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(
                  height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.5
                    ),
//                    children: list.sizes.map(
//                            (s){
//                          return GestureDetector(
//                            onTap: (){
//                              setState(() {
//                                size = s;
//                              });
//                            },
//                            child: Container(
//                              decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
//                                  border: Border.all(
//                                      color: s == size ? primaryColor : Colors.grey[500],
//                                      width: 3.0
//                                  )
//                              ),
//                              width: 50.0,
//                              alignment: Alignment.center,
//                              child: Text(s),
//                            ),
//                          );
//                        }
//                    ).toList(),
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
