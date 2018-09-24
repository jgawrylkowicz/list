import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/models/entry.dart';
import 'package:list/new_page.dart';

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

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  
  List<Entry> entries;

  void getData(){
    
    var _entries = new List<Entry>();

    _entries.add(new Entry('Dribbbles', 4.99));
    _entries.add(new Entry('PS Network', 9.99));
    _entries.add(new Entry('Apple Music', 4.99));


    this.setState(() {
      entries = _entries;
    });
  }

  @override
  void initState(){
    this.getData(); 
  }
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List App"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Josh Gamory"),
              accountEmail: new Text("joshgamory@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.cyan,
                child: new Text("J"),
              )
            ),
            new ListTile(
              title: new Text("New Page"),
              trailing: new Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => 
                  new NewPage("Page one")));
              },
            ),
            new ListTile(
              title: new Text("Page two"),
              trailing: new Icon(Icons.verified_user),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => 
                  new NewPage("Page two")));
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text("Close"),
              trailing: new Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            )
          ]
        )
      ),
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        child: new ListView.builder(
          itemCount: entries == null ? 0 : entries.length,
          itemBuilder: (BuildContext context, int index){
            return new Card(
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new ListTile(
                    leading: Icon(Icons.settings_ethernet),
                    title: new Text(entries[index].name),
                    subtitle: new Text(entries[index].value.toString()),
                  )
                ],
              ) 
              
              //new Text(entries[index].name),
            );
          }
        )
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: () {
           Navigator.of(context).push(new MaterialPageRoute(
              builder: (BuildContext context) => 
                new AddPage()));
            }
       ),
    );  
  }
}

class AddPage extends StatelessWidget{

  AddPage();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add new expense"),
      ),
      body: new Center(
        child: new Text(''),)
    );
  }
}
