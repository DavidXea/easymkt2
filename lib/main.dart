import 'package:easymkt2/login_page.dart';
import 'package:easymkt2/models/list_list_model.dart';
import 'package:easymkt2/models/list_model.dart';
import 'package:easymkt2/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
        model: UserModel(),
        child: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
              return ScopedModel<ListProductModel>(
                  model: ListProductModel(model),
                  child: ScopedModelDescendant<UserModel>(builder: (context, child, model){
                    return ScopedModel<ListModel>(
                        model: ListModel(model),
                        child: MaterialApp(
                          debugShowCheckedModeBanner: false,
                          theme: ThemeData(
                            primarySwatch: Colors.blue,
                          ),
                          home: LoginPage(),
                        )
                    );
                  }
                  )
              );
            }
        )
    );
  }
}