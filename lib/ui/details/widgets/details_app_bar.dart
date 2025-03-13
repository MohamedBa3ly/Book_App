
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DetailsAppBar extends StatelessWidget{
  const DetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25,bottom: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                // Get.back();
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                Icons.clear,
                size: 22,
              )),
          const Spacer(),
          IconButton(
              onPressed: () {

              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                size: 22,
              ))
        ],
      ),
    );
  }

}