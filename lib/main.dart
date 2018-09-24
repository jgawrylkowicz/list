import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/home-page.dart';

// TODO No top-level method declared after refractoring and putting 
// pages into new files

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{
   @override
     Widget build(BuildContext context){
       return new MaterialApp(
        theme: new ThemeData(
          primarySwatch: Colors.blueGrey,
          primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null,),
        home: new HomePage(),
      );
     }
}



