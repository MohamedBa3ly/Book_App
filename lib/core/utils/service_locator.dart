import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/ui/home/data/repository/home_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepositoryImpl>(HomeRepositoryImpl(getIt.get<ApiService>()));
}