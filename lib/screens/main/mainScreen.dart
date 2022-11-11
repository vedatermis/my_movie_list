import 'package:flutter/material.dart';
import 'package:my_movie_list/screens/screens.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "/";

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const MainScreen());
  }

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTabIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  static const List<Widget> screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    ListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_selectedTabIndex),
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "My List"),
        ],
        currentIndex: _selectedTabIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
