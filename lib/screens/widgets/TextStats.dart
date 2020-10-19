import 'package:flutter/material.dart';

class TextStats extends StatelessWidget {
  final String statusName, statusNumber;
  final double paddingNumber, textSize;

  const TextStats(
      {this.statusName,
      this.statusNumber,
      this.paddingNumber = 10.0,
      this.textSize = 14.0});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Text(
            statusName,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            statusNumber.toString(),
            style: TextStyle(
              fontSize: textSize,
            ),
          ),
        ],
      ),
    );
  }
}
