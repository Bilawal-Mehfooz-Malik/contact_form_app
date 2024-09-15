import 'package:flutter/material.dart';

class InfoDisplayWidget extends StatelessWidget {
  const InfoDisplayWidget({
    super.key,
    required this.type,
    required this.data,
  });

  final String type;
  final String data;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: style!.copyWith(fontWeight: FontWeight.bold)),
        Expanded(child: Text(data, style: style)),
      ],
    );
  }
}
