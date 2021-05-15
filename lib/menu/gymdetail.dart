import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:the_gym_pod/common/panel.dart';
import 'package:intl/intl.dart';

import 'homePage.dart';

class User {
  const User(this.name);
  final String name;
}

class GymDetailPage extends StatefulWidget {
  GymDetailPage({this.name, this.image});
  final String name;
  final String image;
  var dob;

  @override
  _GymDetailPageState createState() => _GymDetailPageState();
}

class _GymDetailPageState extends State<GymDetailPage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  User selectedUser;
  List<User> users = <User>[User('2PM'), User('3PM'), User('5PM')];








  @override
  initState(){
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
                Text('Success Book!')
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

  Widget appBarPanel(){
    return Container(
      child: PanelAppBar(
        title: "Gym Detail",
        isBackActive: true,
        backColor: Colors.black,
        textColor: Colors.white,
        height: Size.fromHeight(60).height,
        onPressed: (){
          Navigator.pop(context,true);
        },
      ),
    );
  }

  Widget timePicker(){
    return new DropdownButton<User>(
      hint: new Text("Select Available Time"),
      value: selectedUser,
      onChanged: (User newValue) {
        setState(() {
          selectedUser = newValue;
        });
      },
      items: users.map((User user) {
        return new DropdownMenuItem<User>(
          value: user,
          child: new Text(
            user.name,
            style: new TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
    );
  }








  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      selectedDate = picked;
      setState(() {

      });
  }

  @override
  Widget build(BuildContext context) {

    final dob = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text("${selectedDate.toLocal()}".split(' ')[0]),
        SizedBox(width: 20.0,),
        RaisedButton(
          onPressed: () => _selectDate(context),
          child: Text('Select date'),
        ),
      ],
    );


    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        key: _scaffoldState,
        body: SafeArea(
          child: Container(
            child: Column(
                children: <Widget>[
                  appBarPanel(),
                  Expanded(
                    flex: 1,
                    child : SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Visibility(
                                  child: Container(
                                    margin: EdgeInsets.all(9),
                                    child : Container(
                                      // padding: EdgeInsets.all(8),
//                  width: width==null? Size.fromWidth(340).width : width,
//                  height: height==null? Size.fromHeight(340).height : height,

                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Stack(
                                              children: <Widget>[
                                                InkWell(
                                                  splashColor: Color.fromRGBO(0,45,188, 1),
                                                  child: Container(
                                                    child: Image.asset(widget.image,
                                                      width: Size.fromWidth(380).width,
                                                      height: Size.fromHeight(200).height,
                                                    ),
                                                  ),
                                                ),
                                              ]
                                          ),

                                          Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text('Gym Pod:',
                                                              textAlign: TextAlign.start,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: Size.fromWidth(13).width,
                                                                  fontFamily: 'Axiata',
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text(widget.name,
                                                              textAlign: TextAlign.start,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: Size.fromWidth(13).width,
                                                                  fontFamily: 'Axiata',
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Container(
                                                            child: Text('Select Date:',
                                                              textAlign: TextAlign.start,
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: Size.fromWidth(13).width,
                                                                  fontFamily: 'Axiata',
                                                                  fontWeight: FontWeight.bold
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.all(10),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                        children: <Widget>[
                                                          Container(
                                                            child: dob
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[
                                                      timePicker(),
                                                  ],
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: <Widget>[

                                                    Padding(
                                                      padding: EdgeInsets.symmetric(vertical: 2.0),
                                                      child: Material(
                                                        borderRadius: BorderRadius.circular(30.0),
                                                        shadowColor: Colors.blue,
                                                        elevation: 5.0,
                                                        child: MaterialButton(
                                                          minWidth: 200.0,
                                                          height: 42.0,
                                                          onPressed: () {
                                                            _showAlert();
                                                            Navigator.push(
                                                             context,
                                                             MaterialPageRoute(
                                                                 builder: (context) =>

                                                                     HomePage(),
                                                             ),
                                                           );

                                                          },
                                                          color: Colors.black,
                                                          child: Text('Book', style: TextStyle(color: Colors.white)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]
                                          ),



                                        ],
                                      ),
                                    ),

                                  ),
                                )],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // mapWidget(),
                  // ggwp(),
                ]
            ),
          ),
        ),
      ),
    );
  }
}