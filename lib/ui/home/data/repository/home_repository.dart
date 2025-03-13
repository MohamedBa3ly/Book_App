import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/ui/home/data/model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository{
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks();
  Future<Either<Failure,List<BookModel>>>fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}