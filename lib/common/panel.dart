import 'package:flutter/material.dart';
import 'color.dart';
import '../menu/gymdetail.dart';

class PanelSearch extends StatelessWidget {
  PanelSearch({Key key, this.backPanelColor, this.backButtonColor, this.backSearchColor,
    this.imageIcon, this.placeholderText, this.textColor,
    this.buttonWidth, this.searchWidth, this.panelHeight, this.roundedRadius, this.onPressed}) : super(key:key);

  final Color backPanelColor;
  final Color backButtonColor;
  final Color backSearchColor;
  final String imageIcon;
  final String placeholderText;
  final Color textColor;
  final double buttonWidth;
  final double searchWidth;
  final double panelHeight;
  final double roundedRadius;
  final VoidCallback onPressed;

  String textSearched;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: panelHeight,
      decoration: BoxDecoration(
        color: backPanelColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: buttonWidth,
            height: panelHeight/2,
            decoration: BoxDecoration(
              color: backButtonColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                    roundedRadius==null? Size.fromWidth(25).width : roundedRadius),
                bottomLeft: Radius.circular(
                    roundedRadius==null? Size.fromWidth(25).width : roundedRadius)
              )
            ),
            child:  InkWell(
              splashColor: GEColor.baseMainColorBlue,
              onTap: onPressed,
              child: Image(
                image: AssetImage(
                    imageIcon==null? "assets/images/tb_search.png" : Image.network(imageIcon)
                ),
                width: Size.fromWidth(panelHeight/3).width,
                height: Size.fromHeight(panelHeight/3).height,
              ),
            ),
          ),
          Container(
            width: searchWidth,
            height: panelHeight/2,
            padding: EdgeInsets.only(
              left: Size.fromWidth(15).width, right: Size.fromWidth(15).width,
              bottom: Size.fromHeight(3).height
            ),
            decoration: BoxDecoration(
                color: backSearchColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(
                        roundedRadius==null? Size.fromWidth(25).width : roundedRadius),
                    bottomRight: Radius.circular(
                        roundedRadius==null? Size.fromWidth(25).width : roundedRadius)
                )
            ),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                fillColor: backSearchColor,
                hintText: placeholderText,
                hintStyle: TextStyle(
                  color: textColor.withOpacity(0.5),
                  fontSize: Size.fromWidth(13).width,
                  fontFamily: 'Axiata',
                  fontWeight: FontWeight.normal
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              style: TextStyle(
                color: textColor,
                fontSize: Size.fromWidth(13).width,
                fontFamily: 'Axiata',
                fontWeight: FontWeight.normal
              ),
              onChanged: (text){
                textSearched = text;
              },
            ),
          )
        ],
      ),
    );
  }
}

class PanelLocation extends StatelessWidget {
  PanelLocation({Key key, this.backColor, this.imageButton, this.imageIcon, this.locationText,
    this.textColor, this.height, this.onPressed}) : super(key:key);

  final Color backColor;
  final String imageIcon;
  final String imageButton;
  final String locationText;
  final Color textColor;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Size.fromWidth(15).width),
      height: height,
      decoration: BoxDecoration(
        color: backColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child:  Image(
              image: AssetImage(
                  imageButton==null? "assets/images/tb_map.png" : imageButton
              ),
              width: Size.fromWidth(height/3).width,
              height: Size.fromHeight(height/3).height,
            ),
          ),

          Expanded(
            child : Container(
              padding: EdgeInsets.only(
                left: Size.fromWidth(15).width,
                right: Size.fromWidth(15).width
              ),
              child: Text(locationText,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: textColor,
                    fontSize: Size.fromWidth(13).width,
                    fontFamily: 'Axiata',
                    fontWeight: FontWeight.normal
                ),
              ),
            ),
          ),
          Container(
            child:  InkWell(
              splashColor: GEColor.baseMainColorBlue,
              onTap: onPressed,
              child: Image(
                image: AssetImage(
                    imageButton==null? "assets/images/tb_pencil.png" : imageButton
                ),
                width: Size.fromWidth(height/3).width,
                height: Size.fromHeight(height/3).height,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PanelAppBar extends StatelessWidget {
  PanelAppBar({Key key, this.isBackActive, this.backColor, this.title,
    this.textColor, this.height, this.onPressed}) : super(key:key);

  final bool isBackActive;
  final Color backColor;
  final String title;
  final Color textColor;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Size.fromWidth(15).width),
      height: height,
      decoration: BoxDecoration(
        color: backColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          isBackActive?Container(
            child:  InkWell(
              splashColor: GEColor.baseMainColorBlue,
              onTap: onPressed,
              child:  Icon(
                Icons.arrow_back_ios,
                color: textColor,
                size: 22.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ) : Container(),
          Expanded(
            child : Container(
              padding: EdgeInsets.only(
                  left: Size.fromWidth(15).width,
                  right: Size.fromWidth(15).width
              ),
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: Size.fromWidth(16).width,
                    fontFamily: 'Axiata',
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//P-AJ
class PanelMapNavigator extends StatelessWidget{
  PanelMapNavigator({Key key, this.isMoving, this.backColor, this.title,
    this.textColor, this.height}) : super(key:key);

  final bool isMoving;
  final Color backColor;
  final String title;
  final Color textColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Size.fromWidth(15).width),
      height: height,
      decoration: BoxDecoration(
        color: backColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child : Container(
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: Size.fromWidth(11).width,
                    fontFamily: 'Axiata',
                    fontWeight: FontWeight.w700
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//P-AJ
class PanelEventInfo extends StatelessWidget {
  PanelEventInfo({Key key, this.backColor, this.imageIcon, this.title, this.textColor,
    this.width, this.height, this.data, this.onPressed}) : super(key:key);

  final Color backColor;
  final String imageIcon;
  final String title;
  final Color textColor;
  final double width;
  final double height;
  final int data;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // width: width==null? Size.fromWidth(90).width : width,
      height: height,
      decoration: BoxDecoration(
        color: backColor,
        // borderRadius: BorderRadius.circular(roundedRadius==null? 30 : roundedRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            splashColor: GEColor.baseMainColorBlue,
            onTap: onPressed,
            child: Container(
              child: Image(
                image: AssetImage(
                    imageIcon==null? "assets/images/ic_main_dashboard.png" : imageIcon
                ),
                width: Size.fromWidth(60).width,
                height: Size.fromHeight(60).height,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 2),
                // width: width==null? Size.fromWidth(100).width : width,
                // height: height==null? Size.fromHeight(50).height : height,
                child: Text(title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: textColor,
                      fontSize: Size.fromWidth(12).width,
                      fontFamily: 'Axiata',
                      fontWeight: FontWeight.normal
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 2),
                // width: width==null? Size.fromWidth(100).width : width,
                // height: height==null? Size.fromHeight(50).height : height,
                child: Text(data==null? "0" : data.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: textColor,
                      fontSize: Size.fromWidth(30).width,
                      fontFamily: 'Axiata',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}

//P-AJ
class CurrrentEventInfo extends StatelessWidget {
  CurrrentEventInfo({Key key, this.backColor, this.title, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed, this.data, this.dataUpcoming}) : super(key:key);

  final Color backColor;
  final String title;
  final Color textColor;
  final double width;
  final int data;
  final int dataUpcoming;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: width==null? Size.fromWidth(120).width : width,
      height: height==null? Size.fromHeight(10).height : height,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(roundedRadius==null? 20 : roundedRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: Size.fromWidth(15).width,
                  fontFamily: 'Axiata',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            child: Text(data==null? "0" : data.toString(),
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: textColor,
                  fontSize: Size.fromWidth(13).width,
                  fontFamily: 'Axiata',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Text('Upcoming',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: Size.fromWidth(12).width,
                      fontFamily: 'Axiata',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                child: Text(dataUpcoming==null? "0" : dataUpcoming.toString(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: textColor,
                      fontSize: Size.fromWidth(13).width,
                      fontFamily: 'Axiata',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

//P-AJ
class GroupEventInfo extends StatelessWidget {
  GroupEventInfo({Key key, this.backColor, this.title, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed, this.data}) : super(key:key);

  final Color backColor;
  final String title;
  final Color textColor;
  final double width;
  final int data;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: EdgeInsets.all(9),
        width: width==null? Size.fromWidth(70).width : width,
        height: height==null? Size.fromHeight(10).height : height,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(roundedRadius==null? 8 : roundedRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: textColor,
                    fontSize: Size.fromWidth(20).width,
                    fontFamily: 'Axiata',
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Text(data==null? "0" : data.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: textColor,
                        fontSize: Size.fromWidth(10).width,
                        fontFamily: 'Axiata',
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),
                Container(
                  child: Text('Event',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: textColor,
                        fontSize: Size.fromWidth(10).width,
                        fontFamily: 'Axiata',
                        fontWeight: FontWeight.normal
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      );
  }
}

//P-AJ
class PickMonth extends StatelessWidget {
  PickMonth({Key key, this.backColor, this.title, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed, this.data}) : super(key:key);

  final Color backColor;
  final String title;
  final Color textColor;
  final double width;
  final double data;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width==null? Size.fromWidth(70).width : width,
      // height: height==null? Size.fromHeight(10).height : height,
      decoration: BoxDecoration(
        // color: backColor,
        borderRadius: BorderRadius.circular(roundedRadius==null? 8 : roundedRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: InkWell(
                  splashColor: GEColor.baseMainColorBlue,
                  onTap: onPressed,
                  child: Image(
                    image: AssetImage("assets/images/calendar 2.png"
                    ),
                    width: Size.fromWidth(60).width,
                    height: Size.fromHeight(60).height,
                  ),
                ),
              ),
              Container(
                child: Text('Pick Month',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor,
                      fontSize: Size.fromWidth(12).width,
                      fontFamily: 'Axiata',
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}


class ListEvent extends StatelessWidget {
  ListEvent({Key key, this.backColor, this.imageIcon, this.title, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed}) : super(key:key);

  final Color backColor;
  final String imageIcon;
  final String title;
  final Color textColor;
  final double width;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;






  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // padding: EdgeInsets.all(8),
        width: width==null? Size.fromWidth(340).width : width,
        height: height==null? Size.fromHeight(270).height : height,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(roundedRadius==null? 10 : roundedRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
                children: <Widget>[
                  InkWell(
                    splashColor: KEAColor.baseMainColorBlue,
                    onTap: onPressed,
                    child: Container(
                      child: Image.asset(imageIcon,
                        width: Size.fromWidth(380).width,
                         height: Size.fromHeight(200).height,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(roundedRadius==null? 10 : roundedRadius),
                    ),
                    child: Text(title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: textColor,
                          fontSize: Size.fromWidth(13).width,
                          fontFamily: 'Axiata',
                          fontWeight: FontWeight.bold
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

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(30.0),
                          shadowColor: Colors.black,
                          elevation: 5.0,
                          child: MaterialButton(
                            minWidth: 200.0,
                            height: 42.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GymDetailPage(name: title, image: imageIcon)
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
    );
  }
}

//P-AJ
class SummaryDetailEvent extends StatelessWidget {
  SummaryDetailEvent({Key key, this.backColor, this.title, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed,
    this.month, this.week, this.venue, this.subcat, this.eventName, this.radius}) : super(key:key);

  final Color backColor;
  final String title;
  final Color textColor;
  final double width;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;
  final String month;
  final String week;
  final String venue;
  final String subcat;
  final String eventName;
  final String radius;


  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(8),
//      width: width==null? Size.fromWidth(350).width : width,
      height: height==null? Size.fromHeight(400).height : height,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(roundedRadius==null? 20 : roundedRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColor,
                  fontSize: Size.fromWidth(15).width,
                  fontFamily: 'Axiata',
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: DataTable(
                headingRowColor:
                MaterialStateColor.resolveWith((states) => KEAColor.summaryDetailEventTable),
                dataRowColor: MaterialStateColor.resolveWith((states) => KEAColor.summaryDetailEventTable),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Month',
                      style: TextStyle(color: KEAColor.baseTextColor3,fontStyle: FontStyle.normal, fontSize: Size.fromWidth(10).width),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      month==null? "-" : month,
                      style: TextStyle(color: KEAColor.baseTextColor3, fontStyle: FontStyle.normal, fontSize: Size.fromWidth(10).width),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Week', style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                      DataCell(Text(week==null? "-" : week, style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Venue', style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                      DataCell(Text(venue==null? "-" : venue, style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Subcat', style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                      DataCell(Text(subcat==null? "-" : subcat, style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Event Name', style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                      DataCell(Text(eventName==null? "-" : eventName, style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Radius', style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                      DataCell(Text(radius==null? "-" : radius, style: TextStyle(color: KEAColor.baseTextColor3, fontWeight: FontWeight.bold, fontSize: Size.fromWidth(10).width))),
                    ],
                  ),
                ],
              ),
            ),
          ),


          // Container(
          //   child: Text(data.toString(),
          //     textAlign: TextAlign.start,
          //     style: TextStyle(
          //         color: textColor,
          //         fontSize: Size.fromWidth(13).width,
          //         fontFamily: 'Axiata',
          //         fontWeight: FontWeight.bold
          //     ),
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: <Widget>[
          //     Container(
          //       child: Text('Upcoming',
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //             color: textColor,
          //             fontSize: Size.fromWidth(12).width,
          //             fontFamily: 'Axiata',
          //             fontWeight: FontWeight.bold
          //         ),
          //       ),
          //     ),
          //     Container(
          //       child: Text(data.toString(),
          //         textAlign: TextAlign.start,
          //         style: TextStyle(
          //             color: textColor,
          //             fontSize: Size.fromWidth(13).width,
          //             fontFamily: 'Axiata',
          //             fontWeight: FontWeight.bold
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  SideMenu({Key key, this.backColor, this.textColor,
    this.width, this.height, this.roundedRadius, this.onPressed,
    this.west1, this.jabo1, this.central1, this.east1, this.west2, this.jabo2, this.central2, this.east2}) : super(key:key);

  final Color backColor;
  final Color textColor;
  final double width;
  final double height;
  final double roundedRadius;
  final VoidCallback onPressed;
  final int west1;
  final int west2;
  final int jabo1;
  final int jabo2;
  final int central1;
  final int central2;
  final int east1;
  final int east2;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
//         padding: EdgeInsets.all(8),
        width: width==null? Size.fromWidth(200).width : width,
//        height: height==null? Size.fromHeight(260).height : height,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(roundedRadius==null? 10 : roundedRadius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
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
                              child: Text('West',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: Size.fromWidth(12).width,
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
                              child: Text(west1==null? "0" : west1.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text(west2==null? "0" : west2.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text('Jabo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: Size.fromWidth(12).width,
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
                              child: Text(jabo1==null? "0" : jabo1.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text(jabo2==null? "0" : jabo2.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text('Central',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: Size.fromWidth(12).width,
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
                              child: Text(central1==null? "0" : central1.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text(central2==null? "0" : central2.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text('East',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: Size.fromWidth(12).width,
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
                              child: Text(east1==null? "0" : east1.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                              child: Text(east2==null? "0" : east2.toString(),
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: textColor,
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
                            InkWell(
                              onTap: (){
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) =>
//                                          KEAListEventPage()
//                                  ),
//                                );
                              },
                              child: Container(
                                child: Text('All Event',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: Size.fromWidth(12).width,
                                      fontFamily: 'Axiata',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ],
                  ),
//                    Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.center,
//                      children: <Widget>[
//                        Container(
//                          padding: EdgeInsets.all(10),
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                            children: <Widget>[
//                              InkWell(
//                                onTap: (){
//
//                                },
//                                child: Container(
//                                  child: Text('Recenter Map',
//                                    textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                        color: textColor,
//                                        fontSize: Size.fromWidth(12).width,
//                                        fontFamily: 'Axiata',
//                                        fontWeight: FontWeight.bold
//                                    ),
//                                  ),
//                                ),
//                              ),
//
//                            ],
//                          ),
//                        ),
//                      ],
//                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){
//                                Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) =>
//                                          KEADashboardPage()
//                                  ),
//                                );
                              },
                              child: Container(
                                child: Text('Homepage',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: Size.fromWidth(12).width,
                                      fontFamily: 'Axiata',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),

                    ],
                  ),

                ]
            )

          ],
        ),
      ),
    );

  }
}
