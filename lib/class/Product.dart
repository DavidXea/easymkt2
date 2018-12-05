import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String productTable = "productTable";
final String idColumn = "idColumn";
final String nameColumn = "nameColumn";
final String listColumn = "listColumn";
final String priceColumn = "priceColumn";
final String imgColumn = "imgColumn";

class ProductHelper {

  static final ProductHelper _instance = ProductHelper.internal();

  factory ProductHelper() => _instance;

  ProductHelper.internal();

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
    final path = join(databasesPath, "product.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $productTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT, $listColumn TEXT,"
              "$priceColumn TEXT, $imgColumn TEXT)"
      );
    });
  }

  Future<Product> saveProduct(Product product) async {
    Database dbProduct = await db;
    product.id = await dbProduct.insert(productTable, product.toMap());
    return product;
  }

  Future<Product> getProduct(int list) async {
    Database dbProduct = await db;
    List<Map> maps = await dbProduct.query(productTable,
        columns: [idColumn, nameColumn, listColumn, priceColumn, imgColumn],
        where: "$listColumn = ?",
        whereArgs: [list]);
    if(maps.length > 0){
      return Product.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List> getProductList(int list) async {
    Database dbProduct = await db;
    List<Product> listProduct = List();
    List<Map> maps = await dbProduct.query(productTable,
        columns: [idColumn, nameColumn, listColumn, priceColumn, imgColumn],
        where: "$listColumn = ?",
        whereArgs: [list]);
    if(maps.length > 0){
      for(Map m in maps){
        listProduct.add(Product.fromMap(m));
      }
      return listProduct;
    } else {
      return null;
    }
  }

  Future<List> getAllContacts() async {
    Database dbProduct = await db;
    List listMap = await dbProduct.rawQuery("SELECT * FROM $productTable");
    List<Product> listContact = List();
    for(Map m in listMap){
      listContact.add(Product.fromMap(m));
    }
    return listContact;
  }

  Future<int> deleteContact(int id) async {
    Database dbProduct = await db;
    return await dbProduct.delete(productTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Product product, int idList) async {
    Database dbProduct = await db;

    Product p = product;

    p.list = idList.toString();

    return await dbProduct.update(productTable,
        p.toMap(),
        where: "$idColumn = ?",
        whereArgs: [product.id]);
  }



  Future<int> getNumber() async {
    Database dbProduct = await db;
    return Sqflite.firstIntValue(await dbProduct.rawQuery("SELECT COUNT(*) FROM $productTable"));
  }

  Future close() async {
    Database dbContact = await db;
    dbContact.close();
  }

}

class Product {

  int id;
  String name;
  String list;
  String price;
  String img;

  Product();

  Product.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    list = map[listColumn];
    price = map[priceColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      listColumn: list,
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
    return "Product(id: $id, name: $name, email: $list, phone: $price, img: $img)";
  }
}