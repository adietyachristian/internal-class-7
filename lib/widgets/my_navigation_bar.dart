import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key, required this.child});

  final Widget child;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (value) {
          setState(() => _selectedIndex = value);
          context.go(
              '/${value == 0 ? 'home' : value == 1 ? 'article' : 'profile'}');
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "Article",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
