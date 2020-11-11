import 'package:flutter/material.dart';

class ListViewTasks extends StatefulWidget {
  const ListViewTasks({
    Key key,
    @required this.items
  }) : super(key: key);

  final List items;

  @override
  _ListViewTasksState createState() => _ListViewTasksState();
}

class _ListViewTasksState extends State<ListViewTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final item = widget.items[index];

          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                  print("${item.title} = $value");
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
              child: Text("Excluir!"),
            ),
            onDismissed: (direction) {
              print(direction);
            },
          );
        });
  }
}
