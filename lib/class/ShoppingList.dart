import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String listTable = "listTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String dataColumn = "dataColumn";
final String priceColumn = "priceColumn";
final String imgColumn = "imgColumn";

class ListHelper {

  static final ListHelper _instance = ListHelper.internal();

  factory ListHelper() => _instance;

  ListHelper.internal();

  Database _db;

  Future<Database> get db async {
    if(_db != null){
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "list1.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $listTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $dataColumn TEXT,"
              "$priceColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<ShoppingList> saveList(ShoppingList list) async {
    Database dbList = await db;
    list.id = await dbList.insert(listTable, list.toMap());
    return list;
  }

  Future<ShoppingList> getList(int id) async {
    Database dbList = await db;
    List<Map> maps = await dbList.query(listTable,
        columns: [idColumn, nameColumn, dataColumn, priceColumn, imgColumn],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if(maps.length > 0){
      return ShoppingList.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteContact(int id) async {
    Database dbList = await db;
    return await dbList.delete(listTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContact(ShoppingList contact) async {
    Database dbList = await db;
    return await dbList.update(listTable,
        contact.toMap(),
        where: "$idColumn = ?",
        whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    Database dbList = await db;
    List listMap = await dbList.rawQuery("SELECT * FROM $listTable");
    List<ShoppingList> listList = List();
    for(Map m in listMap){
      listList.add(ShoppingList.fromMap(m));
    }
    return listList;
  }

  Future<int> getNumber() async {
    Database dbList = await db;
    return Sqflite.firstIntValue(await dbList.rawQuery("SELECT COUNT(*) FROM $listTable"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

}

class ShoppingList {

  int id;
  String name;
  String data;
  String price;
  String img;

  ShoppingList();

  ShoppingList.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    data = map[dataColumn];
    price = map[priceColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      dataColumn: data,
      priceColumn: price,
      imgColumn: img
    };
    if(id != null){
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "List(id: $id, name: $name, email: $data, phone: $price, img: $img)";
  }

}


//import 'package:easymktf/Class/Product.dart';
//class ShoppingList {
//
//  final String id;
//  final String name;
//  final String totalPrice;
//  final String img;
//
//  const ShoppingList({this.id, this.name, this.totalPrice,this.img});
//
//  static final  List<Product> products= [
//    const Product(
//      id: "1",
//      name: "Beringela",
//      price: "99",
//      img: "assets/berinjela.jpg",
//    ),
//    const Product(
//      id: "2",
//      name: "mandioca",
//      price: "99",
//      img: "assets/mandioca.jpg",
//    ),
//    const Product(
//      id: "3",
//      name: "Beringela",
//      price: "99",
//      img: "assets/berinjela.jpg",
//    ),
//  ];
//
//  static Product getProductById(id) {
//    return products.where((p)=> p.id == id).first;
//  }
//}