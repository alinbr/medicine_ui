import 'package:flutter/material.dart';
import 'package:medicine_ui/widgets/pill_page/pill_card.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.width * 0.60,
      decoration: BoxDecoration(
          color: Color(0xFFC49781), borderRadius: BorderRadius.circular(32)),
      child: Stack(
        children: [
          Hearth(),
          Syringe(),
          Virus(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Halo, Marco!",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Mari Iihat ceklis selanjutnya!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child:
                    PillCard("Antihistamin", "Hari ini pukul 10:00", "welcom"),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Virus extends StatelessWidget {
  const Virus({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.30,
      bottom: MediaQuery.of(context).size.width * 0.3,
      child: Transform.rotate(
        angle: -1.9,
        child: Container(
          height: MediaQuery.of(context).size.width * 0.15,
          width: MediaQuery.of(context).size.width * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/virus.png"), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class Syringe extends StatelessWidget {
  const Syringe({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: MediaQuery.of(context).size.width * 0.2,
      child: Transform.rotate(
        angle: -1.5,
        child: Container(
          height: MediaQuery.of(context).size.width * 0.35,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/syringe.png"), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}

class Hearth extends StatelessWidget {
  const Hearth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -MediaQuery.of(context).size.width * 0.1,
      top: MediaQuery.of(context).size.width * 0.1,
      child: Transform.rotate(
        angle: -32,
        child: Container(
          height: MediaQuery.of(context).size.width * 0.35,
          width: MediaQuery.of(context).size.width * 0.35,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/heart_rate.png"),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
