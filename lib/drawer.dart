import 'package:easymkt2/login_page.dart';
import 'package:easymkt2/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';



Widget drawer(context){
    return Drawer(
      child: ListView(
        children: <Widget>[
          ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              return Container(
                height: 180.0,
                child: new UserAccountsDrawerHeader(
                  /// EMAIL ///
                  accountEmail: Text("${!model.isLoggedIn() ? "" : model.userData["email"]}",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  /// NAME ///
                  accountName:  Text("Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  currentAccountPicture:  CircleAvatar(
                    backgroundImage:  AssetImage("assets/berinjela.jpg"),
                  ),

                  decoration:  BoxDecoration(
                    color: Colors.black54,
                    gradient:  LinearGradient(
                      colors: <Color>[
                         Color.fromARGB(255, 18, 68, 144),
                         Color.fromARGB(255, 66, 165, 245)
                      ],
                      stops: [0.0, 0.9],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(0.0, 1.0),
                    ),
                  ),
                ),
              );
            }
          ),
           ListTile(
              leading: new Icon(Icons.favorite),
              title: new Text('Favoritos'),
              onTap: () {
                Navigator.pop(context);
//                Navigator.of(context).pushNamed(Home.tag);
              }
          ),
           ListTile(
              leading: new Icon(Icons.perm_identity),
              title: new Text('Conta'),
              onTap: () {
                Navigator.pop(context);
              }
          ),
           ScopedModelDescendant<UserModel>(
             builder: (context, child, model){
               return ListTile(
                   leading: new Icon(Icons.exit_to_app),
                   title: new Text('Sign Out'),
                   onTap: () {
                     model.signOut();
                     Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder: (context)=>LoginPage())
                     );
                   }
               );
             }
           ),

           Divider(),
           ListTile(
              leading: new Icon(Icons.airline_seat_individual_suite),
              title: new Text('Preferencias'),
              onTap: () {
                Navigator.pop(context);
//                Navigator.of(context).pushNamed(Home.tag);
              }
          ),
           ListTile(
              leading: new Icon(Icons.help_outline),
              title: new Text('Ajuda'),
              onTap: () {
                Navigator.pop(context);
//                Navigator.of(context).pushNamed(Home.tag);
              }
          ),
           ListTile(
              leading: new Icon(Icons.share),
              title: new Text('Compartilhar'),
              onTap: () {
                Navigator.pop(context);
//                Navigator.of(context).pushNamed(Home.tag);
              }
          ),
        ],
      )
  );
}