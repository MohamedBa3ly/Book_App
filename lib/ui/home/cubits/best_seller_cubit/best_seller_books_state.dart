part of 'best_seller_books_cubit.dart';

sealed class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();
  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends BestSellerBooksState {}

class BestSellerBooksLoading extends BestSellerBooksState {}

class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BookModel> books;

  const BestSellerBooksSuccess(this.books);
}

class BestSellerBooksFailure extends BestSellerBooksState {
  final String errMessage;

  const BestSellerBooksFailure(this.errMessage);
}
