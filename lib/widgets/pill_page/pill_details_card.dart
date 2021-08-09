import 'package:flutter/material.dart';
import 'package:medicine_ui/widgets/pill_page/pill_card_button.dart';

class PillDetailsCard extends StatefulWidget {
  const PillDetailsCard(this.text, {Key? key, this.expanded = true})
      : super(key: key);

  final String text;
  final bool expanded;

  @override
  _PillDetailsCardState createState() => _PillDetailsCardState();
}

class _PillDetailsCardState extends State<PillDetailsCard>
    with SingleTickerProviderStateMixin {
  bool _tookPill = false;
  bool _showTookPillText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Row(
            children: [
              VerticalBar(),
              SizedBox(width: 16),
              Expanded(
                child: buildTextContainer(),
              ),
              buildAnimatedCheckBox()
            ],
          ),
          if (widget.expanded)
            Container(
              margin: EdgeInsets.only(top: 16),
              height: MediaQuery.of(context).size.width * 0.15,
              width: double.infinity,
              child: Stack(children: [
                Positioned(
                  left: 0,
                  child: buildAnimatedLeftButton(),
                ),
                Positioned(
                  right: 0,
                  child: buildAnimatedRightButton(context),
                ),
              ]),
            )
        ],
      ),
    );
  }

  double getRightButtonWidth() {
    return _tookPill
        ? (MediaQuery.of(context).size.width - 32 - 32)
        : (MediaQuery.of(context).size.width - 32 - 32 - 16) / 2;
  }

  Color getRightButtonColor() {
    return _tookPill ? Color(0xffF5F1EC) : Color(0xff1B2846);
  }

  Widget getRigthButtonContent() {
    return _tookPill
        ? Container(
            height: MediaQuery.of(context).size.width * 0.15,
            child: Center(
                child: AnimatedOpacity(
              duration: Duration(milliseconds: 400),
              opacity: _showTookPillText ? 1 : 0,
              child: Text(
                _showTookPillText ? "Sudah Diminum Pukul 10:03" : "",
                style: TextStyle(
                    color: Color(0xffB0795A),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            )))
        : PillCardButton(
            "Selesai",
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _tookPill = !_tookPill;
              });
            },
          );
  }

  AnimatedContainer buildAnimatedRightButton(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        onEnd: () {
          setState(() {
            _showTookPillText = !_showTookPillText;
          });
        },
        width: getRightButtonWidth(),
        decoration: BoxDecoration(
          color: getRightButtonColor(),
          borderRadius: BorderRadius.circular(16),
        ),
        child: getRigthButtonContent());
  }

  AnimatedOpacity buildAnimatedLeftButton() {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 500),
      opacity: _tookPill ? 0 : 1,
      child: PillCardButton(
        "Ingatkan Nanti",
        backgroundColor: Color(0xFFEDF1F4),
        textColor: Color(0xff1B2846),
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }

  AnimatedSwitcher buildAnimatedCheckBox() {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (child, animation) =>
          ScaleTransition(scale: animation, child: child),
      child: _tookPill ? buildCheckbox() : buildExpandIcon(),
    );
  }

  Icon buildExpandIcon() {
    return Icon(
      widget.expanded ? Icons.expand_less : Icons.expand_more,
      size: 38,
      color: Colors.grey,
    );
  }

  GestureDetector buildCheckbox() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tookPill = !_tookPill;
        });
      },
      child: Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: Color(0xFFFAB75A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            Icons.check,
            color: Colors.white,
          )),
    );
  }

  Container buildTextContainer() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black87),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "1 Kapsul Antihistamin",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black38,
            ),
          )
        ],
      ),
    );
  }
}

class VerticalBar extends StatelessWidget {
  const VerticalBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: 48, width: 4, color: Colors.amberAccent);
  }
}
