import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:the_gym_pod/common/panel.dart';



class HomePage extends StatefulWidget {
  HomePage({this.userId});
  final String userId;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();


  @override
  initState(){
    super.initState();

  }



  Widget listRetaurant() {
    return Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Visibility(
                    child: Container(
                      margin: EdgeInsets.all(9),
                      child : ListEvent(
                        imageIcon: 'assets/images/gympod1.jpg',
                        title: "The Gym Pod 1",
                        backColor: Color.fromRGBO(30,31,41,1),
                        textColor: Colors.white,
//                         onPressed: (){
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     GymDetailPage(name: "The Gym Pod 1", image: 'assets/images/gympod1.jpg')
//                             ),
//                           );
//                         },
                      ),
                    ),
                  ),
                ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.all(9),
                        child : ListEvent(
                          imageIcon: "assets/images/gympod2.jpg",
                          title: "The Gym Pod 2",
                          backColor: Color.fromRGBO(30,31,41,1),
                          textColor: Colors.white,
//                           onPressed: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       GymDetailPage(name: "The Gym Pod 2", image: 'assets/images/gympod2.jpg')
//                               ),
//                             );
//                           },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.all(9),
                        child : ListEvent(
                          imageIcon: "assets/images/gympod3.jpg",
                          title: "The Gym Pod 3",
                          backColor: Color.fromRGBO(30,31,41,1),
                          textColor: Colors.white,
//                           onPressed: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       GymDetailPage(name: "The Gym Pod 3", image: 'assets/images/gympod3.jpg')
//                               ),
//                             );
//                           },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.all(9),
                        child : ListEvent(
                          imageIcon: "assets/images/gympod4.jpg",
                          title: "The Gym Pod 4",
                          backColor: Color.fromRGBO(30,31,41,1),
                          textColor: Colors.white,
//                           onPressed: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       GymDetailPage(name: "The Gym Pod 4", image: 'assets/images/gympod4.jpg')
//                               ),
//                             );
//                           },
                        ),
                      ),
                    ),
                  ]
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.all(9),
                        child : ListEvent(
                          imageIcon: "assets/images/gympod5.jpg",
                          title: "The Gym Pod 5",
                          backColor: Color.fromRGBO(30,31,41,1),
                          textColor: Colors.white,
//                           onPressed: (){
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       GymDetailPage(name: "The Gym Pod 5", image: 'assets/images/gympod5.jpg')
//                               ),
//                             );
//                           },
                        ),
                      ),
                    ),
                  ]
              ),
            ],
        ),
    );
  }

  Widget appBarPanel(){
    return Container(
      child: PanelAppBar(
        title: "Gym List",
        isBackActive: false,
        backColor: Colors.black,
        textColor: Colors.white,
        height: Size.fromHeight(60).height,
        onPressed: (){
          Navigator.pop(context,true);
        },
      ),
    );
  }





  @override
  Widget build(BuildContext context) {
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
                      child: listRetaurant(),
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