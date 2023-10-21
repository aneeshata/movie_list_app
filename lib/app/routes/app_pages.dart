import 'package:get/get.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_detail_view/bindings/movie_detail_view_binding.dart';
import '../modules/movie_detail_view/views/movie_detail_view_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL_VIEW,
      page: () =>  MovieDetailViewView(),
      binding: MovieDetailViewBinding(),
    ),
  ];
}
