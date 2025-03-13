
import 'package:book_app/ui/home/data/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/book_model.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.homeRepository) : super(BestSellerBooksInitial());

  final HomeRepository homeRepository;

  Future<void> fetchBestSellerBooks() async {
    emit(BestSellerBooksLoading());
    var result = await homeRepository.fetchBestSellerBooks();
    result.fold((failure) {
      emit(BestSellerBooksFailure(failure.errMessage));
    }, (books) {
      emit(BestSellerBooksSuccess(books));
    });
  }
}
