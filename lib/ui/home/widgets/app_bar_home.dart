
import 'package:book_app/navigation/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarHome extends StatelessWidget{
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10,bottom: 10, left:2,right: 2),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(
              "assets/images/book_logo.png",
              height: 40,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push(InitialScreens.search);
                },
                icon: const Icon(
                  Icons.search_outlined,
                  size: 22,
                ))
          ],
        ),
      ),
    );
  }

}