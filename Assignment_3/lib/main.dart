import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'Rooms_and_checkout_Screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MaterialApp(home: MyApp(),

  ),);
}
class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppStateState();
}
class _MyAppStateState extends State<MyApp> {
  var rating=0.0;
  var rating1=0.0;
  DateTime date1=DateTime.now();
  Future<Null>selectDate(BuildContext context) async{
    final DateTime? picked=await showDatePicker(
      context: context, initialDate: date1, firstDate: DateTime(1960), lastDate: DateTime(2030),);
    if(picked!=null && picked!= date1){
      setState((){
        date1=picked;
        print(date1.toString());});}}
  DateTime date2=DateTime.now();
  Future<Null>selectDate1(BuildContext context) async{
    final DateTime? picked=await showDatePicker(
      context: context, initialDate: date2, firstDate: DateTime(1960), lastDate: DateTime(2030),);
    if(picked!=null && picked!= date2){
      setState((){
        date2=picked;
        print(date2.toString());});}}

  @override
  Widget build(BuildContext context) {
    CollectionReference users=FirebaseFirestore.instance.collection('Hotel');

    return
      Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Castaway Resort',style: TextStyle(
          fontSize: 30,
          fontFamily: 'Great Vibes'
        ),),

      ),

      body: Padding(
        padding: EdgeInsets.all((8)),
        child: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Column(children: [
                    Image.asset('Images/castaways-resort-phu-quoc-hero.jpg'),
                  ],),

                  Row(

                    children: [
                      Text('Check-in Date:  ',style: TextStyle(color: Colors.cyan)),
                      SizedBox(width: 20,),
                      IconButton(onPressed: (){selectDate(context);}, icon: Icon(Icons.date_range)),
                      Text(('${date1.year} - ${date1.month} - ${date1.day}').toString(),style: TextStyle(color: Colors.cyan),)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Check-out Date:',style: TextStyle(color: Colors.cyan)),
                      SizedBox(width: 20,),
                      IconButton(onPressed: (){selectDate1(context);}, icon: Icon(Icons.date_range)),
                      Text(('${date2.year} - ${date2.month} - ${date2.day}').toString(),style: TextStyle(color: Colors.cyan))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text('Number Of Adults:',style: TextStyle(color: Colors.cyan)),
                      SizedBox(
                        width: 30,
                      ),
                      Slider(activeColor: Colors.cyan,
                        value: rating,
                        onChanged: (newRating){
                          setState(()=> rating = newRating);
                        },
                        divisions:10,
                        label:rating.toInt().toString(),
                        min: 0,
                        max: 10,
                      ),
                      Text(rating.toInt().toString()),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Row(
                    children: [
                      Text('Number Of Children:',style: TextStyle(color: Colors.cyan)),
                      SizedBox(
                        width: 20,
                      ),
                      Slider(
                        activeColor: Colors.cyan,
                        value: rating1,
                        onChanged: (newRating){
                          setState(()=> rating1 = newRating);
                        },
                        divisions:10,
                        label:rating1.toInt().toString(),
                        min: 0,
                        max: 10,
                      ),
                      Text(rating1.toInt().toString()),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Extras:',style: TextStyle(color: Colors.cyan)),
                      CheckboxGroup(
                        labels: <String>["Breakfast (50EGP/Day)","Internet WIFI (50EGP/Day)","Parking (100EGP/Day)"],
                        onSelected: (List<String> checked)=>
                            print(checked.toString()),

                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text("View",style: TextStyle(color: Colors.cyan)),
                      RadioButtonGroup(
                        labels:<String>["Garden View","Sea View"],
                        onSelected: (String selected)=>
                            print(selected),
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                              width: 395,
                              child:
                              ElevatedButton(onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Rooms_and_checkout_Screen(CheckInDate: date1,CheckOutDate: date2,Extras: '',NumOfAdults: rating,NumOfChildren: rating1,views:'' )));
                                  },
                                child: Text('Check Rooms and Rates'),
                                style: ElevatedButton.styleFrom(primary: Colors.cyan),)
                          )
                        ],
                      ),
                    ],
                  )

                ],

              )
            ]
        ),
      ),

    );


  }
}








