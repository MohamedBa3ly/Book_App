
import 'package:book_app/ui/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/book_model.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepository) : super(FeaturedBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepository.fetchFeaturedBooks();
    result.fold((failure){
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }

}
