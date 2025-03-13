import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../navigation/screens.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0; // Track selected index

  void _onItemTapped(int index, String route) {
    setState(() {
      _selectedIndex = index;
    });

    if (route == BottomNavigationScreen.home.route) {
      GoRouter.of(context).pushReplacement(route);
    } else {
      GoRouter.of(context).push(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 60,
      right: 60,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: Colors.white10.withOpacity(0.4), // Semi-transparent white
          elevation: 5, // Soft shadow effect
          borderRadius: BorderRadius.circular(30),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, 0, BottomNavigationScreen.home.route),
                _buildNavItem(Icons.bookmark, 1, ""),
                _buildNavItem(Icons.library_music, 2, ''),
                const CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('assets/images/book_icon.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildNavItem(IconData icon, int index, String route) {
    return IconButton(
      icon: Icon(icon, color: _selectedIndex == index ? Colors.black: Colors.white),
      onPressed: () {
        if (route.isNotEmpty) {
          _onItemTapped(index, route);
        }
      },
    );
  }
}
