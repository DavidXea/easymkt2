import 'package:easymkt2/Screens/MyListProduct/myListsWidget.dart';
import 'package:easymkt2/Screens/trending/trending.dart';
import 'package:easymkt2/screens/recommended/recommendedWidget.dart';
import 'package:easymkt2/screens/Search/searchWidget.dart';
import 'package:easymkt2/drawer.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static String tag = 'homePages';

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}


class _HomeState extends State<Home> {
  int _pageIndex = 0;
  PageController _pageController;
  var _title_page = "Recomendado";


  Widget homePages(int currentIndex){
    switch (currentIndex){
      case 0:
        _title_page = 'Recomendado';
        return Recommended(icon: Icons.accessibility ,onPressed: null,tooltip:'idsjdiasjd');
      case 1:
        _title_page = 'Em Alta';
        return TrendingListPage();
      case 2:
        _title_page = 'Procurar';
        return Search();
      case 3:
        _title_page = 'Minhas Listas';
        return listaListPage();
        break;
        default:
          return Recommended();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homePages(_pageIndex),
      appBar: _appBar(_pageIndex),
      //button
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.0,
        type: BottomNavigationBarType.fixed,
        onTap:navigationTapped,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon( Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.whatshot),
            title: Text('Em Alta'),
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.search),
            title: Text('Pesquisar'),
          ),
          BottomNavigationBarItem(
              icon: Icon( Icons.view_list),
              title: Text('Listas')
          )
        ],
      ),


      //Drawer
      drawer:drawer(context) ,

    );
  }


  void navigationTapped(int page) {
    setState(() {
      _pageIndex = page;
    });
      switch (page){
        case 0:
          this._title_page = 'Recomendado';
          break;
        case 1:
          this._title_page = 'Em Alta';
          break;
        case 2:
          this._title_page = 'Pesquisar';
          break;
        case 3:
          this._title_page = 'Minhas Listas';
          break;
        default:this._title_page = 'Minhas Listas';
      }
  }

  @override
  void initState() {
    super.initState();
//    _pageController = new PageController();
    this._title_page = 'Home';
  }
  Widget _appBar(_pageIndex){
    switch (_pageIndex){
      case 0:
        _title_page = 'Recomendado';
        return AppBar(
          title: Text(_title_page),
        );
      case 1:
        return AppBar(
          title: Text(_title_page),
        );
      case 2:
        return null;
      case 3:
        _title_page = 'Minhas Listas';
        return AppBar(
          title: Text(_title_page),
        );
        break;
      default:
        return Recommended();
    }
  }


//
//  @override
//  void dispose() {
//    super.dispose();
//    _pageController.dispose();
//  }
}