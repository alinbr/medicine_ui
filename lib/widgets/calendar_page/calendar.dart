import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalendarItem("M", nextMonth: true),
              CalendarItem("T", nextMonth: true),
              CalendarItem("W", nextMonth: true),
              CalendarItem("T", nextMonth: true),
              CalendarItem("F", nextMonth: true),
              CalendarItem("S", nextMonth: true),
              CalendarItem("S", nextMonth: true),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalendarItem("21"),
              CalendarItem(
                "22",
                hasBorder: true,
              ),
              CalendarItem("23"),
              CalendarItem("24"),
              CalendarItem("25"),
              CalendarItem(
                "26",
                hasBorder: true,
              ),
              CalendarItem("27"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CalendarItem("28"),
              CalendarItem("29"),
              CalendarItem(
                "30",
                current: true,
              ),
              CalendarItem("31"),
              CalendarItem("1", nextMonth: true),
              CalendarItem("2", nextMonth: true),
              CalendarItem("3", nextMonth: true),
            ],
          )
        ],
      ),
    );
  }
}

class CalendarItem extends StatelessWidget {
  const CalendarItem(
    this.text, {
    Key? key,
    this.hasBorder = false,
    this.nextMonth = false,
    this.current = false,
  }) : super(key: key);

  final String text;
  final bool hasBorder;
  final bool nextMonth;
  final bool current;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 40),
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: !nextMonth ? Colors.black38 : Colors.black12),
            ),
            SizedBox(
              height: 8,
            ),
            if (hasBorder)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Color(0xffFDB659),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(
                    radius: 2,
                    backgroundColor: Color(0x55FDB659),
                  ),
                ],
              ),
            if (current)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 2, backgroundColor: Colors.white),
                  SizedBox(
                    width: 2,
                  ),
                  CircleAvatar(radius: 2, backgroundColor: Colors.white54),
                ],
              )
          ],
        ),
        decoration: BoxDecoration(
            color: current ? Color(0xffFDB659) : Colors.transparent,
            border: hasBorder
                ? Border.all(width: 1, color: Colors.grey.withOpacity(0.2))
                : Border.all(width: 0, color: Colors.white),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
