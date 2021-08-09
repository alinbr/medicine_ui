import 'package:flutter/material.dart';

class PillImage extends StatelessWidget {
  const PillImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: "second" + "pill-bg",
          child: Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Hero(
          tag: "second" + "pill-img",
          child: Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.transparent,
            ),
            child: Container(
              height: MediaQuery.of(context).size.width * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/medicine.png")),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
