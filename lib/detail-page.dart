import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/models/entry.dart';

class DetailPage extends StatefulWidget {
  
  final Entry entry;

  DetailPage({Key key, @required this.entry}) : super(key: key);

  @override
  DetailPageState createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage>{

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.entry.name),
      ),
      body: new Container(
         margin: const EdgeInsets.all(10.0),
           child: Column(
             children: [
               new Text(widget.entry.name),
               new Text(widget.entry.value.toString()),
             ]),
           )
         );
  }

}
