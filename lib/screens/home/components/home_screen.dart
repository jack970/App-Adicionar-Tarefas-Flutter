import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sampleproject/screens/home/components/body.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/item.dart';

class HomeScreen extends StatefulWidget {
  var items = new List<Item>();

  HomeScreen() {
    items = [];
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;

    setState(() {
      widget.items.add(Item(title: newTaskCtrl.text, done: false));
    });
    newTaskCtrl.text = "";
    save();
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
    });
    save();
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString("data");

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();

      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", jsonEncode(widget.items));
  }

  _HomeScreenState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(newTaskCtrl),
      body: Body(items: widget.items),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}

AppBar buildAppBar(newTaskCtrl) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"), 
      onPressed: () {}
    ),
    title: TextFormField(
      controller: newTaskCtrl,
      keyboardType: TextInputType.text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24 
      ),
      decoration: InputDecoration(
        labelText: "Nome:", labelStyle: TextStyle(color: Colors.white)
      ),
    ),
  );
}


