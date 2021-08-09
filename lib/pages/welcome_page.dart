import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_ui/widgets/pill_page/pill_card.dart';
import 'package:medicine_ui/widgets/welcome_page/welcome_header.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeHeader(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Text(
                "Jadwal Hari Ini",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            CheckedPillCard(),
            NextPillCard(),
          ],
        ),
      ),
    );
  }
}

class NextPillCard extends StatelessWidget {
  const NextPillCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: PillCard(
        "Antihistamin",
        "Hari ini pukul 10:00",
        "next",
        checkbox: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
        ),
      ),
    );
  }
}

class CheckedPillCard extends StatelessWidget {
  const CheckedPillCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: PillCard(
        "Siladex",
        "Hari ini pukul 08:00",
        "check",
        checkbox: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: Color(0xFFFAB75A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
          ),
        ),
        footer: Container(
          height: 48,
          margin: EdgeInsets.only(top: 8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xffC27754).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
              child: Text(
            "Sundah Diminum pukul 08:05",
            style: GoogleFonts.raleway(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff965138),
            ),
          )),
        ),
      ),
    );
  }
}
