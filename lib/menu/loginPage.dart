import 'dart:ui';
import 'package:flutter/material.dart';
import 'homePage.dart';



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  initState() {
    super.initState();
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contact Administrator'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Error!')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    TextEditingController usernameText = new TextEditingController();
    TextEditingController passwordText = new TextEditingController();

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/images/logo.png'),
      ),
    );

    final username = TextFormField(
      controller: usernameText,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
//      initialValue: 'test@gmail.com',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: passwordText,
      autofocus: false,
//      initialValue: '123',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 2.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
//        shadowColor: GEColor.baseMainColorBlue,
        shadowColor: Colors.blue,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if(usernameText.text == 'test' && passwordText.text == '123'){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        HomePage()
                ),
              );
            }
            else{
              _showAlert();
            }

          },
//          color: GEColor.baseMainColorBlue,
          color: Colors.black,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );




    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldState,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              username,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 8.0),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}