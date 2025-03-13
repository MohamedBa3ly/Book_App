
import 'package:book_app/ui/home/widgets/app_bar_home.dart';
import 'package:book_app/ui/home/widgets/best_seller_scroll_view.dart';
import 'package:book_app/ui/home/widgets/horizental_scroll_view_home.dart';
import 'package:flutter/material.dart';
import '../customBottomNavigation/custom_bottom_navigation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBarHome(),
                      BookHomeScrollHorizontal(),
                      const SizedBox(height: 20),
                      const Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Best Seller",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
                BestSellerScrollView()
                // const SliverFillRemaining(
                //   child: BestSellerScrollView()
                // )
              ],
            )
          ),
          const CustomBottomNavigation(),
        ],
      ),
    );
  }
}

