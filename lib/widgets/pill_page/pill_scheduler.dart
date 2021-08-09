import 'package:flutter/material.dart';

class PillScheduler extends StatelessWidget {
  const PillScheduler({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 16),
      child: Text(
        "Ceklis Selanjutnya",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}
