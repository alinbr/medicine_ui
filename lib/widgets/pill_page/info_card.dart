import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard(
    this.title,
    this.icon,
    this.description, {
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black45),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Icon(
                icon,
                color: Color(0xffFDB659),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
