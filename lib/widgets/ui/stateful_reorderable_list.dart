import 'package:flutter/material.dart';
import 'package:flutter_firebase_kit/utils/lang_utils.dart';
import 'package:flutter_firebase_kit/widgets/materialui/text/body1.dart';

class StatefulReorderableList extends StatefulWidget {
  final Iterable<String> items;
  final Function onReOrdered;

  const StatefulReorderableList({
    Key? key,
    required this.items,
    required this.onReOrdered,
  }) : super(key: key);

  @override
  _StatefulReorderableListState createState() =>
      _StatefulReorderableListState();
}

class _StatefulReorderableListState extends State<StatefulReorderableList> {
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex--;
          }
          final String item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);

          widget.onReOrdered(_items);
        });
      },
      children: mapIndexed<Widget, String>(
        _items,
        (index, aisle) => ListTile(
          key: Key(aisle),
          title: Body1(aisle),
          trailing: Icon(Icons.drag_handle),
        ),
      ).toList(),
    );
  }
}
