import 'package:book_app/ui/search/widgets/search_list_view_result.dart';
import 'package:book_app/ui/search/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomSearchTextField(),
            SizedBox(
              height: 16,
            ),
            Text(
              'Search Result',
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: SearchResultListView(),
            ),
          ],
        ),
      ),
    );
  }
}