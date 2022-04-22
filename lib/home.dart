

import 'package:flutter/material.dart';

import 'camera.dart';

class Home extends StatelessWidget {
  // const Home({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotional Detection'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Camera'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Camera();
            }));
          }
        ),
      ),
    );
  }
}