import 'package:easymkt2/Class/Product.dart';
import 'package:easymkt2/Class/ShoppingList.dart';


class User {
  final String id;
  final String name;
  final String email;
  final String img;
  final String password;
  final String address;

  User({this.id, this.name, this.email, this.img, this.address, this.password});


//  List<Product> productos = [
//    const Product(
//      id: "1",
//      name: "Beringela",
//      price: "99",
//      img: "assets/berinjela.jpg",
//    ),
//    const Product(
//      id: "1",
//      name: "Beringela",
//      price: "99",
//      img: "assets/berinjela.jpg",
//    ),
//  ];

//  static ShoppingList getListById(id) {
//    return lists.where((p)=> p.id == id).first;
////    return products.
////        .where((p) => p.id == id)
////        .first;
//  }
}