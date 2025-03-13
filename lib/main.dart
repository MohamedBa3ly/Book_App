
import 'package:book_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'navigation/navgraph.dart';

void main() {
  setupServiceLocator();
  runApp(const NavGraph());
}

