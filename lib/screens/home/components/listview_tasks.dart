import 'package:flutter/material.dart';

class ListViewTasks extends StatelessWidget {
  const newTaskCtrl({
    Key key,
    
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                    save();
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
                remove(index);
              },
            );
          });
  }
}