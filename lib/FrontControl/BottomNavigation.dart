import 'package:flutter/material.dart';
//import routes.dart
import 'package:uni_pal/FrontControl/routes.dart';
import 'package:uni_pal/FrontControl/AppColor.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State <BottomNavigation> {
  int _selectedIndex = 0;
  var parpleColor = AppColor.darkParple;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: _selectedIndex == 0 ? parpleColor : Colors.grey), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.apps, color: _selectedIndex == 1 ? parpleColor : Colors.grey), label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart, color: _selectedIndex == 2 ? parpleColor : Colors.grey), label:"Orders"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle, color: _selectedIndex == 3 ? parpleColor : Colors.grey), label: "Profile")
      ],
      backgroundColor: AppColor.background,
      elevation: 8,
      iconSize: 24,
      selectedItemColor: AppColor.darkParple,
      unselectedItemColor: AppColor.darkParple,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // onTap: (value) {},
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );

  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home').then((_) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
            });
          }
        });
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/categories').then((_) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
            });
          }
        });
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/orders').then((_) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
            });
          }
        });
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/profileHome').then((_) {
          if (mounted) {
            setState(() {
              _selectedIndex = index;
            });
          }
        });
        break;
    }
  }
}
