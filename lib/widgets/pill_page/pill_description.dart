import 'package:flutter/material.dart';

class PillDescription extends StatelessWidget {
  const PillDescription({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Obat untuk megobati reaksi alergi.",
      style: TextStyle(
          fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black45),
    );
  }
}
