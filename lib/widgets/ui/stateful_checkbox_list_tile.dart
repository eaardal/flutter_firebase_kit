import 'package:flutter/material.dart';

class StatefulCheckboxListTile extends StatefulWidget {
  final String label;
  final Function onChanged;

  StatefulCheckboxListTile(
      {Key? key, required this.label, required this.onChanged})
      : super(key: key);

  @override
  _StatefulCheckboxListTileState createState() =>
      _StatefulCheckboxListTileState();
}

class _StatefulCheckboxListTileState extends State<StatefulCheckboxListTile> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.label),
      value: _checked,
      selected: _checked,
      onChanged: (bool? checked) {
        var isChecked = checked != null && checked == true;
        setState(() {
          _checked = isChecked;
        });
        widget.onChanged(isChecked);
      },
    );
  }
}
