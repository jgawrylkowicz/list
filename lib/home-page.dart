import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/add-page.dart';
import 'package:list/detail-page.dart';
import 'package:list/models/entry.dart';
import 'package:list/new_page.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{
  
  List<Entry> entries;
  double value;

  void getData(){
    
    var _entries = new List<Entry>();
    double _value = 0.00;

    _entries.add(new Entry('Dribbbles', 4.99));
    _entries.add(new Entry('PS Network', 9.99));
    _entries.add(new Entry('Apple Music', 4.99));


    _entries.forEach((entry) => _value += entry.value);

    this.setState(() {
      entries = _entries;
      value = _value;
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
        backgroundColor: Colors.white,
        title: new Text("My Expenses"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {

              final entry = await Navigator.of(context).push(
                new MaterialPageRoute(
                builder: (BuildContext context) => 
                  new AddPage()));

              if (entry != null){
                entries.add(entry);
              }
            }
          )
        ]
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
                    onTap: () {
                       Navigator.of(context).push(
                         new MaterialPageRoute(
                          builder: (BuildContext context) => 
                          new DetailPage(entry: entries[index])));
                    },
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
      bottomNavigationBar: new BottomAppBar(
        child: new Container(
         //color: Colors.red,
         margin: const EdgeInsets.all(16.0),
         child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: <Widget>[
             Column(
               mainAxisSize: MainAxisSize.min, // the height of the bar
               crossAxisAlignment: CrossAxisAlignment.start, //for adjusting left
               children: <Widget>[
                    Text(
               'Average Expenses',
               style: TextStyle(
                 fontSize: 17.0,
                 fontWeight: FontWeight.w700
               ),
               ),
                  Text(
               'PER MONTH',
               style: TextStyle(
                 fontSize: 13.0,
                 color: Colors.grey,
                 fontWeight: FontWeight.w700
               ),
               ),
               ],
            ),
          
                Text(
               "EUR " + this.value.toString(),
               style: TextStyle(
                 fontSize: 17.0,
                 fontWeight: FontWeight.w700
               ),
               )
           ],
           )
       )
      ),
    );  
  }
}