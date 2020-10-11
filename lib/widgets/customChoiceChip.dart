import 'dart:math';

import 'package:flutter/material.dart';

class CustomChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  const CustomChoiceChip({
    Key key,
    @required this.label,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      backgroundColor: const Color(0xfff2f2f2),
      avatar: CircleAvatar(
        radius: 30,
        backgroundColor:
            Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Text(label[0].toUpperCase()),
      ),
      label: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xff9b9b9b),
          ),
        ),
      ),
      onSelected: (value) {
        if (value) {
          print('hello');
        }
      },
      selected: selected,
      selectedColor: const Color(0xffd5fce8),
    );
  }
}
