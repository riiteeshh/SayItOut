import 'package:flutter/material.dart';
import 'package:talkitout/pages/home_page.dart';
import 'package:talkitout/pages/settings_page.dart';

class MainLayoutPage extends StatefulWidget {
  const MainLayoutPage({super.key});

  @override
  State<MainLayoutPage> createState() => _MainLayoutPageState();
}

class _MainLayoutPageState extends State<MainLayoutPage> {
  int _selectedIndex = 0;
  List<Widget> _pages = [HomePage(), Text('PostStatus'), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              label: 'Post', icon: Icon(Icons.post_add_rounded)),
          BottomNavigationBarItem(
              label: 'Profile', icon: Icon(Icons.person_2_rounded))
        ],
      ),
      body: Center(child: _pages[_selectedIndex]),
    );
  }
}
