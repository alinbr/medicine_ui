import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_ui/utils/custom_page_route.dart';
import 'package:medicine_ui/pages/pill_page.dart';
import 'package:medicine_ui/widgets/calendar_page/calendar.dart';
import 'package:medicine_ui/widgets/pill_page/pill_card.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({
    Key? key,
  }) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  initState() {
    print("init state calendar");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(),
            Calendar(),
            Schedule(),
            Container(
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HourInTable("08:00"),
                        HourInTable("09:00"),
                        HourInTable("10:00"),
                        HourInTable("11:00"),
                      ],
                    ),
                  ),
                  FirstPillAnimated(),
                  SecondPillAnimated(),
                  BarAnimated(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Schedule extends StatelessWidget {
  const Schedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Text(
        "Hari Ini",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Text(
        "Kalendar",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class BarAnimated extends StatelessWidget {
  const BarAnimated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        (MediaQuery.of(context).size.height - 52 - 220 - 50 - 150) / 4;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 2000),
      curve: Curves.ease,
      tween: Tween<double>(begin: 300, end: 0),
      builder: (_, double offset, __) => Positioned(
        right: 16 - offset,
        top: height + height / 2,
        child: Row(
          children: [
            CircleAvatar(
              radius: 6,
              backgroundColor: Color(0xffC2987F),
            ),
            Container(
              color: Color(0xffC2987F),
              height: 3,
              width: MediaQuery.of(context).size.width - 32 - 12,
            )
          ],
        ),
      ),
    );
  }
}

class SecondPillAnimated extends StatelessWidget {
  const SecondPillAnimated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        (MediaQuery.of(context).size.height - 52 - 220 - 50 - 150) / 4;

    return TweenAnimationBuilder(
      curve: Curves.ease,
      duration: Duration(milliseconds: 2000),
      tween: Tween<double>(begin: 300, end: 0),
      builder: (_, double offset, __) => Positioned(
        right: 16 - offset,
        top: height + height,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CustomPageRoute(child: PillPage()),
            );
          },
          child: Container(
              height: height + 16,
              width: MediaQuery.of(context).size.width - 90,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: PillCard(
                "Antihistamin",
                "Dosis 1Kapsul",
                "second",
                leading: Container(
                  width: 3,
                  margin: EdgeInsets.only(right: 16),
                  height: height,
                  color: Color(0xffC2987F),
                ),
              )),
        ),
      ),
    );
  }
}

class FirstPillAnimated extends StatelessWidget {
  const FirstPillAnimated({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height =
        (MediaQuery.of(context).size.height - 52 - 220 - 50 - 150) / 4;

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 1700),
      curve: Curves.ease,
      tween: Tween<double>(begin: 300, end: 0),
      builder: (_, double offset, __) => Positioned(
        right: 16 - offset,
        child: Container(
            height: height + 16,
            width: MediaQuery.of(context).size.width - 90,
            child: PillCard(
              "Siladex",
              "Dosis 2 Pil",
              "first",
              leading: Container(
                width: 3,
                margin: EdgeInsets.only(right: 16),
                height: 60,
                color: Color(0xffC2987F),
              ),
            )),
      ),
    );
  }
}

class HourInTable extends StatelessWidget {
  const HourInTable(
    this.text, {
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    double height =
        (MediaQuery.of(context).size.height - 52 - 220 - 50 - 150) / 4;

    return Container(
        child: Text(
          text,
          style: GoogleFonts.raleway(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black45,
          ),
        ),
        width: 80,
        height: height);
  }
}
