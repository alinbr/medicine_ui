import 'package:flutter/material.dart';

class PillCardButton extends StatelessWidget {
  const PillCardButton(
    this.text, {
    Key? key,
    required this.onPressed,
    required this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  final String text;
  final Color? backgroundColor;
  final Color textColor;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 32 - 32 - 16) / 2,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: ElevatedButton(
              style: backgroundColor != null
                  ? ElevatedButton.styleFrom(primary: backgroundColor)
                  : ElevatedButton.styleFrom(
                      primary: Colors.transparent,
                      shadowColor: Colors.transparent),
              onPressed: onPressed,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.15,
                child: Center(
                  child: Text(text,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: textColor)),
                ),
              )),
        ),
      ),
    );
  }
}
