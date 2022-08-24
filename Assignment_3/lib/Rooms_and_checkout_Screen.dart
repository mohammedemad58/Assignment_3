import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyItem{
  bool isExpanded;
  final String header;
  final String body;
  MyItem({this.isExpanded=false,required this.header,required this.body});
  void setState(Null Function() param0) {}
}
class MyItem1{
  bool isExpanded;
  final String header;
  final String body;

  MyItem1({this.isExpanded=false,required this.header,required this.body});
  void setState(Null Function() param0) {}
}
class MyItem2{
  bool isExpanded;
  final String header;
  final String body;

  MyItem2({this.isExpanded=false,required this.header,required this.body});
  void setState(Null Function() param0) {}
}
class Rooms_and_checkout_Screen extends StatefulWidget {

  var CheckInDate;
  var CheckOutDate;
  var Extras=null;
  var NumOfAdults=0.0;
  var NumOfChildren=0.0;
  String views;
  List<String> sel=[''];
  Rooms_and_checkout_Screen({
      required this.CheckInDate,
      required this.CheckOutDate,
      required this.Extras,
      required this.NumOfAdults,
      required this.NumOfChildren,
      required this.views
  }
      );
  String rooms='';

  @override
  _Rooms_and_checkout_ScreenState createState() =>
      _Rooms_and_checkout_ScreenState();
}
class _Rooms_and_checkout_ScreenState extends State<Rooms_and_checkout_Screen> {
  final Stream<QuerySnapshot> users =
  FirebaseFirestore.instance.collection('Hotel').snapshots();
  @override

  bool _swVal =false;
  bool _swVal1 =false;
  bool _swVal2 =false;
  void _onChange(bool val){
    setState(() {_swVal=val;});
  }
  void _onChange1(bool val){
    setState(() {_swVal1=val;});
  }
  void _onChange2(bool val){
    setState(() {_swVal2=val;});
  }
  final List<MyItem>_items=<MyItem>[
    MyItem(header:"Single Room",body:"A room assigned to one person",),
  ];
  final List<MyItem>_items1=<MyItem>[
    MyItem(header:"Double Room",body:"A roon asigned to two people. May have one or more beds",),
  ];
  final List<MyItem>_items2=<MyItem>[
    MyItem(header:"Suit Room",body:"A room with one or more bedrooms and a separete living space",),
  ];
  void showAlertDialog(BuildContext context){
    var alertDialog =AlertDialog(
      title: Text('Are you sure you want to proceed in checking out?'),
      content: Text('this confirmation message that you agree on all data you entered'),
      actions: [
        ElevatedButton(onPressed: (){Navigator.pop(context);
          print("Thanks");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Your form has been successfuly submitted'),
          duration: Duration(seconds: 3),

        ));},
            child: Text('Confirm')),
        ElevatedButton(onPressed: (){Navigator.pop(context);},
            child: Text('Discard')),
      ],
    );
    showDialog(context: context, builder: (BuildContext context){
      return alertDialog;
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
           home: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text('Castaway Resort',style: TextStyle(
              fontSize: 30,
              fontFamily: 'Great Vibes'
          ),),
        ),

               body: Column(
                   children: <Widget>[
               Container(
                 margin: EdgeInsets.only(bottom: 10.0),
              child:ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                elevation: 1,
                     expansionCallback:(int index,bool isExpanded){
                       setState((){
                         _items[index].isExpanded=!_items[index].isExpanded;
                       });
                     },
                     children: _items.map<ExpansionPanel>((MyItem item){
                       return
                         ExpansionPanel(
                         headerBuilder:(context,isExpanded){
                       return
                             Column(children: <Widget>[
                             ListTile(leading: Image.asset('Images/Cast-Away-39-1-768x509.jpg',height: 200,width: 200,alignment: Alignment.bottomLeft),),
                              //Image.asset('Images/Cast-Away-39-1-768x509.jpg',height: 100,width: 100,alignment: Alignment.topLeft,),
                               ListTile(
                                 title:Text(item.header,style:TextStyle(color: Colors.cyan),),
                               ),
                               ListTile(leading: Switch(value: (_swVal), onChanged: _onChange,
                                   activeColor: Colors.cyan),)

                               // Switch(value: (_swVal), onChanged: _onChange,
                               //     activeColor: Colors.cyan),
                               ],
                          );
                         },
                         body:
                         Container(padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                        child: Column(
                             children:<Widget>[
                               ListTile(
                                 title:Text(item.body,style: TextStyle(color: Colors.cyan),),
                               ),

                         RatingBar.builder(
                           initialRating: 1,
                           minRating: 1,
                           direction: Axis.horizontal,
                           itemSize: 25,
                           allowHalfRating: true,
                           itemCount: 5,
                           itemBuilder: (context, _) => Icon(
                             Icons.star,
                             color: Colors.amber,
                           ),
                           onRatingUpdate: (rating) {
                             print(rating);
                           },
                         ),

                         ]

                         ),
                       ),
                         isExpanded:item.isExpanded,
                       );
                     }
                     ).toList(),
                   ),
             ),
                     Container(
                       margin: EdgeInsets.only(bottom: 10.0),
                       child:ExpansionPanelList(
                         expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                         elevation: 1,
                         animationDuration: Duration(milliseconds: 500),
                         expansionCallback:(int index,bool isExpanded){
                           setState((){
                             _items1[index].isExpanded=!_items1[index].isExpanded;
                           });
                         },
                         children: _items1.map<ExpansionPanel>((MyItem item){
                           return
                             ExpansionPanel(
                               headerBuilder:(context,isExpanded){
                                 return
                                   Column(children: <Widget>[
                                     ListTile(leading: Image.asset('Images/168332877.jpg',height: 200,width: 200,alignment: Alignment.bottomLeft),),
                                     //Image.asset('Images/Cast-Away-39-1-768x509.jpg',height: 100,width: 100,alignment: Alignment.topLeft,),
                                     ListTile(
                                       title:Text(item.header,style:TextStyle(color: Colors.cyan),),
                                     ),
                                     ListTile(leading: Switch(value: (_swVal1), onChanged: _onChange1,
                                         activeColor: Colors.cyan),)

                                   ],
                                   );
                               },

                               body:
                                Container(padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                              child: Column(
                                   children:<Widget>[
                                     ListTile(
                                       title:Text(item.body,style: TextStyle(color: Colors.cyan)),
                                     ),
                                     RatingBar.builder(
                                       initialRating: 1,
                                       minRating: 1,
                                       direction: Axis.horizontal,
                                       itemSize: 25,
                                       allowHalfRating: true,
                                       itemCount: 5,
                                       itemBuilder: (context, _) => Icon(
                                         Icons.star,
                                         color: Colors.amber,
                                       ),
                                       onRatingUpdate: (rating) {
                                         print(rating);
                                       },
                                     ),
                                   ]

                               ),
                                ),
                               isExpanded:item.isExpanded,
                             );
                         }
                         ).toList(),
                       ),
                     ),
                     Container(
                       margin: EdgeInsets.only(bottom: 10.0),
                       child:ExpansionPanelList(
                         expandedHeaderPadding: EdgeInsets.only(bottom: 0.0),
                         elevation: 1,
                         expansionCallback:(int index,bool isExpanded){
                           setState((){
                             _items2[index].isExpanded=!_items2[index].isExpanded;
                           });
                         },
                         children: _items2.map<ExpansionPanel>((MyItem item){
                           return
                             ExpansionPanel(
                               headerBuilder:(context,isExpanded){
                                 return
                                   Column(children: <Widget>[
                                     ListTile(leading: Image.asset('Images/bedroom-e1592530538478.jpg',height: 200,width: 200,alignment: Alignment.bottomLeft),),
                                     //Image.asset('Images/Cast-Away-39-1-768x509.jpg',height: 100,width: 100,alignment: Alignment.topLeft,),
                                     ListTile(
                                       title:Text(item.header,style:TextStyle(color: Colors.cyan),),
                                     ),
                                     ListTile(leading: Switch(value: (_swVal2), onChanged: _onChange2,
                                         activeColor: Colors.cyan),)

                                   ],
                                   );
                               },

                               body:
                                 Container(padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                               child:Column(
                                   children:<Widget>[
                                     ListTile(
                                       title:Text(item.body,style: TextStyle(color: Colors.cyan),),
                                     ),
                                     RatingBar.builder(
                                       initialRating: 1,
                                       minRating: 1,
                                       direction: Axis.horizontal,
                                       itemSize: 25,
                                       allowHalfRating: true,
                                       itemCount: 5,
                                       itemBuilder: (context, _) => Icon(
                                         Icons.star,
                                         color: Colors.amber,
                                       ),
                                       onRatingUpdate: (rating) {
                                         print(rating);
                                       },
                                     ),
                                   ]

                               ),
                                 ),
                               isExpanded:item.isExpanded,
                             );
                         }
                         ).toList(),
                       ),
                     ),
    ]
               ),
    bottomNavigationBar:
    Row(
      children: [
        Container(
            width: 400,
            child:
    ElevatedButton(onPressed: (){showAlertDialog(context);},
      child: Text('Check Rooms and Rates'),
      style: ElevatedButton.styleFrom(primary: Colors.cyan),),
        )
      ],
    ),
           ),
    );

  }
}
