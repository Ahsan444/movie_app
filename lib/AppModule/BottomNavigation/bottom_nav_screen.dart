import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:movie_app/AppModule/MediaLib/media_lib_screen.dart';
import 'package:movie_app/AppModule/More/more_screen.dart';
import 'package:movie_app/AppModule/Watch/watch_screen.dart';
import '../../Constants/constants.dart';
import '../Dashboard/dashboard_screen.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedPage = 0;
  final _pageOptions = const [
    DashboardScreen(),
    WatchScreen(),
    MediaLibScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.pinned,
          snakeShape: SnakeShape.indicator,
          snakeViewColor: Constants.COLOR3,
          selectedItemColor: Colors.white,
          unselectedItemColor: Constants.COLOR3,
          showUnselectedLabels: true,
          backgroundColor: Constants.COLOR1,
          showSelectedLabels: true,
          currentIndex: selectedPage,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
          ),
          onTap: (int i) {
            setState(() {
              selectedPage = i;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard,), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Watch'),
            BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Media Library'),
            BottomNavigationBarItem(icon: Icon(Icons.list,), label: 'More'),
          ],
        ),
      body: _pageOptions[selectedPage],
      );
  }
}
