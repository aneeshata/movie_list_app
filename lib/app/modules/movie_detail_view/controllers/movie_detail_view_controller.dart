import 'package:get/get.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';

class MovieDetailViewController extends GetxController {
  //TODO: Implement MovieDetailViewController

  final Rx<MovieListResponse?> movieData = Rx<MovieListResponse?>(null);
  void setMovieData(MovieListResponse data) {
    movieData.value = data;
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
