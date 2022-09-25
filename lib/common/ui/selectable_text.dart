import 'package:flutter/material.dart';

class SelectableUnderlineText extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool boldSelectedItem;

  const SelectableUnderlineText({
    Key? key,
    required this.text,
    required this.isSelected,
    this.boldSelectedItem = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isSelected && boldSelectedItem
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: (15 * text.length).toDouble(),
          height: 2,
          color: isSelected ? Colors.black : Colors.transparent,
        ),
      ],
    );
  }
}
