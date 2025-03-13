import 'package:book_app/ui/details/cubits/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScrollView extends StatelessWidget {
  const DetailsScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height * .18;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if(state is SimilarBooksSuccess){
          return SizedBox(
            height: height,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: const EdgeInsets.all(8.0),
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0), // Rounded corners
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    // Clipping for image
                    child: Image.network(
                      state.books[index].volumeInfo.imageLinks!.thumbnail,
                      width: 80,
                      height: height,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          );
        }else if(state is SimilarBooksFailure){
          return Center(child: Text(state.errMessage));
        }else{
          return Center(child: CircularProgressIndicator());
        }

      },
    );
  }
}
