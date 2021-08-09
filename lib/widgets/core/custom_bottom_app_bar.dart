import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  _CustomBottomAppBarState createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar>
    with SingleTickerProviderStateMixin {
  late int _selected;

  @override
  void initState() {
    super.initState();
    _selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavBarIcon(
              icon: Icon(Icons.home_filled),
              selected: _selected == 0,
              onPressed: () {
                setState(() {
                  _selected = 0;
                });
                widget.pageController.animateToPage(0,
                    duration: Duration(milliseconds: 1100), curve: Curves.ease);
              },
            ),
            BottomNavBarIcon(
              icon: Icon(
                Icons.calendar_today_rounded,
              ),
              selected: _selected == 1,
              onPressed: () {
                setState(() {
                  _selected = 1;
                });
                widget.pageController.animateToPage(1,
                    duration: Duration(milliseconds: 1100), curve: Curves.ease);
              },
            ),
            Spacer(),
            BottomNavBarIcon(
              icon: Icon(Icons.grading_sharp),
              selected: _selected == 2,
              onPressed: () {
                setState(() {
                  _selected = 2;
                });
                widget.pageController.animateToPage(2,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
            ),
            BottomNavBarIcon(
              icon: Icon(Icons.person_outline),
              selected: _selected == 3,
              onPressed: () {
                setState(() {
                  _selected = 3;
                });
                widget.pageController.animateToPage(3,
                    duration: Duration(milliseconds: 300), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarIcon extends StatefulWidget {
  const BottomNavBarIcon({
    Key? key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final bool selected;
  final VoidCallback onPressed;

  @override
  _BottomNavBarIconState createState() => _BottomNavBarIconState();
}

class _BottomNavBarIconState extends State<BottomNavBarIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.7,
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.3, end: 1).animate(_controller);
    _controller.forward();
    print("init state");
  }

  Color getIconColor() {
    return widget.selected ? Color(0xFF1D2745) : Color(0xFFE4E4E4);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.selected) {
      _controller.reset();
      _controller.forward();
    }
    return ScaleTransition(
      scale: _animation,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: IconButton(
            splashRadius: 1,
            onPressed: widget.onPressed,
            icon: widget.icon,
            iconSize: 24,
            color: getIconColor()),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
