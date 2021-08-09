import 'package:flutter/material.dart';
import 'package:medicine_ui/widgets/pill_page/info_card.dart';
import 'package:medicine_ui/widgets/pill_page/pill_description.dart';
import 'package:medicine_ui/widgets/pill_page/pill_details_card.dart';
import 'package:medicine_ui/widgets/pill_page/pill_image.dart';
import 'package:medicine_ui/widgets/pill_page/pill_scheduler.dart';
import 'package:medicine_ui/widgets/pill_page/pill_text.dart';

class PillPage extends StatefulWidget {
  @override
  _PillPageState createState() => _PillPageState();
}

class _PillPageState extends State<PillPage> with TickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1300),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0.3, 1.0, curve: Curves.ease)))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final animationOffset = _animation.value * 200;
    return Scaffold(
      appBar: buildAppBar(context),
      backgroundColor: Color(0xFFF4f4f4),
      extendBody: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PillImage(),
            SizedBox(height: 8),
            PillText(),
            SizedBox(height: 16),
            Opacity(
              opacity: _animation.value * -1 + 1,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: animationOffset),
                    child: PillDescription(),
                  ),
                  SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.only(top: animationOffset * 1.1),
                    child: buildPillInfoRow(),
                  ),
                  SizedBox(height: 16),
                  Container(
                      margin: EdgeInsets.only(top: animationOffset * 1.2),
                      child: PillScheduler()),
                  Container(
                      margin: EdgeInsets.only(top: animationOffset * 1.2),
                      child: PillDetailsCard("Hari Ini Pukul 10:00")),
                  Container(
                    margin: EdgeInsets.only(top: animationOffset * 1.2),
                    child: PillDetailsCard(
                      "Hari Ini Pukul 16:00",
                      expanded: false,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPillInfoRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InfoCard("Durasi", Icons.timer, "1 Bulan"),
        ),
        Expanded(
          child: InfoCard("Frekuensi", Icons.timer, "2x Sehari"),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.black54,
            size: 48,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.black54,
              size: 32,
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
