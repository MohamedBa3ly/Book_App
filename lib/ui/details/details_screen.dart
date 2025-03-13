import 'package:book_app/ui/details/cubits/similar_books_cubit.dart';
import 'package:book_app/ui/details/widgets/details_app_bar.dart';
import 'package:book_app/ui/details/widgets/details_scroll_view.dart';
import 'package:book_app/ui/details/widgets/main_details.dart';
import 'package:book_app/ui/home/data/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(category: widget.bookModel.volumeInfo.categories[0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailsAppBar(),
                  const SizedBox(height: 4),
                  MainDetails(bookModel: widget.bookModel),
                  Expanded(child: const SizedBox(height: 40)), // Remove Expanded
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "You Can Also Like",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DetailsScrollView(),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
