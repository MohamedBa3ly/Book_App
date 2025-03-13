import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../ui/home/home_screen.dart';

//If u use Getx For navigation (For Learning)
class NavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text("Favorites", style: TextStyle(fontSize: 22))),
    Center(child: Text("Cart", style: TextStyle(fontSize: 22))),
    Center(child: Text("Settings", style: TextStyle(fontSize: 22))),
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}