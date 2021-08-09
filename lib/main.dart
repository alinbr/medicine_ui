import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_ui/pages/calendar_page.dart';
import 'package:medicine_ui/widgets/core/custom_bottom_app_bar.dart';
import 'package:medicine_ui/widgets/core/custom_floating_action_bar.dart';
import 'package:medicine_ui/pages/welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: GoogleFonts.raleway().fontFamily),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF4f4f4),
        extendBody: true,
        body: PageView(
          scrollDirection: Axis.horizontal,
          controller: _controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            WelcomePage(),
            CalendarPage(),
            Center(
              child: Text('Third Page'),
            ),
            Center(
              child: Text('4th Page'),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: const CustomFloatinActionBar(),
        bottomNavigationBar: CustomBottomAppBar(pageController: _controller));
  }
}
