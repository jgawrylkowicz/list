import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:list/models/entry.dart';

class AddPage extends StatefulWidget {
  @override
  AddPageState createState() => new AddPageState();
}

//TODO Should it be a a stleWidget or a state?
class AddPageState extends State<AddPage>{

  TextEditingController nameController = new TextEditingController();
  TextEditingController valueController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Add new expense"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              submit(context);
            },
          )
        ],
      ),
      body: new Container(
         margin: const EdgeInsets.all(10.0),
         child: new Form(
           child: Column(
             children: [
               new TextField(
                  controller: nameController,                  // new
                  onChanged: (v) => nameController.text = v,   // new
                  decoration: new InputDecoration(
                    labelText: 'Name',
                  )
              ),
                new TextField(
                  controller: valueController,
                  onChanged: (value) => valueController.text = value,
                  decoration: new InputDecoration(
                    labelText: "Enter the value"
                  ),
                  keyboardType: TextInputType.number,
                ),
             ]
           )
         )
          
      )
    );
  }

  
  void submit(context){
    if (nameController.text != null && valueController.text !=null){
      var entry = new Entry(nameController.text, double.parse(valueController.text));
      Navigator.of(context).pop(entry);
    }
  }

}

