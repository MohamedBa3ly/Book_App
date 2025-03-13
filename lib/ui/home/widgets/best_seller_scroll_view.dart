
import 'package:book_app/ui/home/cubits/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../navigation/screens.dart';
import 'best_seller_card.dart';

class BestSellerScrollView extends StatelessWidget {
  const BestSellerScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: BestSellerCard(
                    image: state.books[index].volumeInfo.imageLinks!.thumbnail,
                    title: state.books[index].volumeInfo.title,
                    author: state.books[index].volumeInfo.authors.first,
                    price: state.books[index].saleInfo.listPrice != null
                        ? "${state.books[index].saleInfo.listPrice!.amount} ${state.books[index].saleInfo.listPrice!.currencyCode ?? ''}"
                        : "Free",
                    rating: state.books[index].volumeInfo.averageRating.toString(),
                    download: state.books[index].volumeInfo.ratingsCount.toString(),
                    onTap: () {
                      GoRouter.of(context).push(InitialScreens.details, extra: state.books[index]);
                    },
                  ),
                );
              },
              childCount: state.books.length, // Define number of items
            ),
          );
        } else if (state is BestSellerBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errMessage)),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
