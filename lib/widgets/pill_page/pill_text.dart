import 'package:flutter/material.dart';
import 'package:medicine_ui/utils/helpers.dart';

class PillText extends StatelessWidget {
  const PillText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "second" + "pill-txt",
      flightShuttleBuilder: flightShuttleBuilder,
      child: Material(
        type: MaterialType.transparency,
        child: Text(
          "Antihistamin",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
      ),
    );
  }
}
