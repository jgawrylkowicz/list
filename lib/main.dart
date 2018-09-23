import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/new_page.dart';

void main()=> runApp(new App());

class App extends StatelessWidget {
  @override 
  Widget build(BuildContext context){
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
        primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[50] : null,),
      home: new HomePage(),
      //routes: <String, WidgetBuilder>{
      //  "/a": (BuildContext context) => new NewPage("new page"),
      //}
    );
  }
}

class HomePage extends StatelessWidget{
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
        child: new Card(
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                leading: const Icon(Icons.album),
                title: const Text('The Enchanted Nightingale'),
                subtitle: const Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
              ),
              new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                child: new ButtonBar(
                  children: <Widget>[
                    new FlatButton(
                      child: const Text('BUY TICKETS'),
                      onPressed: () { /* ... */ },
                    ),
                    new FlatButton(
                      child: const Text('LISTEN'),
                      onPressed: () { /* ... */ },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}