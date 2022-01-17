import 'package:flutter/material.dart';

class StatefulDropdownList extends StatefulWidget {
  final Iterable<String> items;
  final Function onSelectedItem;

  const StatefulDropdownList({
    Key? key,
    required this.items,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  _StatefulDropdownListState createState() => _StatefulDropdownListState();
}

class _StatefulDropdownListState extends State<StatefulDropdownList> {
  String _selected = "";

  @override
  void initState() {
    super.initState();
    _selected = widget.items.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: _selected,
      icon: Icon(Icons.arrow_downward),
      onChanged: (String? value) {
        setState(() {
          _selected = value!;
        });
        widget.onSelectedItem(value);
      },
      items: widget.items
          .map((item) => DropdownMenuItem(
                child: Text(item),
                value: item,
              ))
          .toList(),
    );
  }
}
