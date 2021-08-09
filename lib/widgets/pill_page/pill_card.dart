import 'package:flutter/material.dart';
import 'package:medicine_ui/utils/helpers.dart';

class PillCard extends StatelessWidget {
  const PillCard(
    this.name,
    this.description,
    this.tagPrefix, {
    Key? key,
    this.checkbox,
    this.footer,
    this.leading,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  }) : super(key: key);

  final String name;
  final String description;
  final Widget? checkbox;
  final Widget? footer;
  final Widget? leading;
  final EdgeInsets padding;
  final String tagPrefix;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: tagPrefix + "pill-bg",
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
        ),
        Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  leading ?? Container(),
                  Hero(
                    tag: tagPrefix + "pill-img",
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
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: tagPrefix + "pill-txt",
                            flightShuttleBuilder: flightShuttleBuilder,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87),
                              ),
                            ),
                          ),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black38,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  checkbox ?? Container()
                ],
              ),
              footer ?? Container()
            ],
          ),
        ),
      ],
    );
  }
}
