import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: Column(children: [
        SizedBox(height: 20,),
        MyImage(),
        SizedBox(height: 20,),
        Text("account@yahoo.com",style: TextStyle(fontSize: 20),),
        SizedBox(height: 20,),
        TextButton(
          onPressed: () {

          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              elevation: 2,
              backgroundColor: Colors.blue),
          child: const Text(
            "update",
            style: TextStyle(fontSize: 25),
          ),
        ),
        SizedBox(height: 20,),
        TextButton(
          onPressed: () {

          },
          style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              elevation: 2,
              backgroundColor: Colors.blue),
          child: const Text(
            "Delete",
            style: TextStyle(fontSize: 25),
          ),
        ),

      ],),
    );

  }
}
class MyImage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage image =new AssetImage('images/avatar.png');
    Image myImag=new Image (image:image);
    return Container(child:myImag ,width: 500,height: 180,);


  }

}
