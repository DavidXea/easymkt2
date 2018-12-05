import 'package:easymkt2/login_page.dart';
import 'package:easymkt2/models/user_model.dart';
import 'package:easymkt2/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SingUpPage extends StatefulWidget {
  static String tag = 'singUpPage';
  @override
  _SingUpPageState createState() => new _SingUpPageState();
}


class _SingUpPageState extends State<SingUpPage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final address = TextFormField(
      controller: _addressController,
      autofocus: false,
      validator: (text){
        if(text.isEmpty || text.length <6) return "Invalid address";
      },
      decoration: InputDecoration(
        labelText: 'Address',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(),
      ),
    );

    final fullName = TextFormField(
      controller: _nameController,
      autofocus: false,
      validator: (text){
        if(text.isEmpty || text.length <6) return "Invalid Name";
      },
      decoration: InputDecoration(
        labelText: 'Full Name',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(),
      ),
    );

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (text){
        if(text.isEmpty || !text.contains("@")) return "Invalid E-mail";
      },
      decoration: InputDecoration(
        labelText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(),
      ),
    );

    final password = TextFormField(
      controller: _passController,
      validator: (text){
        if(text.isEmpty || text.length <6) return "Invalid Password";
      },
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(/*borderRadius: BorderRadius.circular(32.0)*/),
      ),
    );



    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<UserModel>(
            builder: (context, child, model){
              if(model.isLoading)
                return Center(child: CircularProgressIndicator(),);

              return Form(
                key: _formKey,
                child : ListView(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    children: <Widget>[
                      SizedBox(height: 48.0),
                      email,
                      SizedBox(height: 16.0),
                      password,
                      SizedBox(height: 16.0),
                      fullName,
                      SizedBox(height: 16.0),
                      address,
                      SizedBox(height: 16.0),
                      SizedBox(
                        height: 44.0,
                        child: RaisedButton(
                          child: Text("Criar Conta",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                          textColor: Colors.white,
                          color: Theme.of(context).primaryColor,
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              Map<String, dynamic> userData={
                                "name":_nameController.text,
                                "email": _emailController.text,
                                "address": _addressController.text
                              };
                              model.signUp(
                                  userData: userData,
                                  pass: _passController.text,
                                  onSuccess: _onSuccess,
                                  onFail: _onFail
                              );
                            }
                          },
                        ),
                      )
                    ]
                ),
              );
            }
    )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuario Criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
        )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context)=>Home())
      );
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar usuario!"),
          backgroundColor: Colors.redAccent,
        )
    );
  }
}
