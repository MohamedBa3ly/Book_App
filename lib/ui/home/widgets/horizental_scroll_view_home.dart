import 'package:book_app/ui/home/cubits/featured_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../navigation/screens.dart';
import 'book_home_card.dart';

class BookHomeScrollHorizontal extends StatefulWidget {
  const BookHomeScrollHorizontal({super.key});

  @override
  BookScrollState createState() => BookScrollState();
}

class BookScrollState extends State<BookHomeScrollHorizontal> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: 250, // Max height for largest card
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (notification) {
                setState(() {}); // Rebuild UI on scroll
                return true;
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  // Get the actual position of the item in the scroll
                  double itemOffset = index * 150; // Adjust spacing as needed
                  double difference =
                  (_scrollController.offset - itemOffset).abs();

                  // Scale height smoothly
                  double newHeight = (250 - (difference * 0.2)).clamp(200, 250);

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: BookHomeCard(
                      imagePath:
                      state.books[index].volumeInfo.imageLinks!.thumbnail,
                      height: newHeight, // Dynamically change height
                      onPlayPressed: () {
                        GoRouter.of(context).push(InitialScreens.details, extra: state.books[index] );
                      },
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
