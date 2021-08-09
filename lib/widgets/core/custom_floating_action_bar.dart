import 'package:flutter/material.dart';

class CustomFloatinActionBar extends StatelessWidget {
  const CustomFloatinActionBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      height: 48,
      width: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFF1D2745),
      ),
      child: Icon(
        Icons.add,
        size: 38,
        color: Colors.white,
      ),
    );
  }
}
