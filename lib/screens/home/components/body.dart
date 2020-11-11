import 'package:flutter/material.dart';
import 'package:sampleproject/screens/home/components/header_with_searchbox.dart';
import 'package:sampleproject/screens/home/components/listview_tasks.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.items
  }) : super(key: key);
  final List items;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        HeaderWithSearchBox(size: size),
        ListViewTasks(items: items)
      ],
    );
  }
}
