import 'package:flutter/material.dart';
import 'package:vk_try3/MainScreen/Communities/communities.dart';
import 'package:vk_try3/MainScreen/Friends/friends.dart';
import 'package:vk_try3/MainScreen/MyProfile/myProfile.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexOfItem = 0;
  static List<Widget> _items = [
    Friends(),
    MyProfile(),
    Communities(),
  ];

  void _changeScreen(int index) {
    indexOfItem = index;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(54, 55, 56, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: indexOfItem,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.emoji_people), label: 'Друзья'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Мой профиль'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.people_alt), label: 'Сообщества'),
        ],
        onTap: _changeScreen,
      ),
      body: _items[indexOfItem],
    );
  }
}
