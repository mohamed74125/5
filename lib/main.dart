import 'dart:async';

import 'package:flutter/material.dart';
import 'Account.dart';
import 'Archive.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home page',

       theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
       home: const MyHomePage(title: ' Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // int _selectedIndex = 0;

  final List<int> colorCodes = <int>[ 500,400];

  List<String> items = ["items1","items2"];
  getData()async{
    CollectionReference usersref = FirebaseFirestore.instance.collection("users");

    QuerySnapshot querySnapshot = await usersref.get();
     List<QueryDocumentSnapshot> listdocs =querySnapshot.docs ;
     listdocs.forEach((element) {
          print(element.data());
          print("===================================================");
     });
  }

@override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }
   // List<String> archivedItems = [];
  void selectScreen(BuildContext ctx){
    Navigator.of(ctx).push( MaterialPageRoute(
        builder: (_){
          return Screen1();
        }
    ));
  }
  void selectArchive(BuildContext ctx){
    Navigator.of(ctx).push( MaterialPageRoute(
        builder: (_){
          return archive();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),

    body:Column(
      children:[
      Container(
        height:520,
        width: 390,
        child:ListView.builder(
        // padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: ( context,  index) {
          return Column(
            children: <Widget>[
            ListTile(
              title: Text(items[index]),
            ),
            SizedBox(
            height: 30.0),

            ],
          );

      }
      )
      ), Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,


        children: [

          TextButton(
            onPressed: () {
              selectArchive(context);
            },
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 2,
                backgroundColor: Colors.blue),
            child: const Text(
              "Archive",
              style: TextStyle(fontSize: 25),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                items.add('Item'+((items.length)+1).toString());
              });
            },


            child: const Text(
              "Add",
              style: TextStyle(fontSize: 25),

            ),



          ),
          TextButton(
            onPressed: () {selectScreen(context);},
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                elevation: 2,
                backgroundColor: Colors.blue),
            child: const Text(
              "Account",
              style: TextStyle(fontSize: 25),
            ),
          ),



    ]
    )
    ]
    )
    );
  }


}




