import 'package:flutter/material.dart';
import 'package:futursity/homepage/homepage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgets = [
    HomePage(),
    Text(''),
    Text(''),
    Text(''),
  ];

  @override
  Widget build(BuildContext context) {
    // print(_widgets.elementAt(_selectedIndex));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: _widgets[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.cast_for_education_outlined,
              ),
              label: 'Course',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_rounded,
              ),
              label: 'My Course',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Account',
              backgroundColor: Colors.black),
        ],
        currentIndex: _selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}
