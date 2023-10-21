import 'package:get/get.dart';

import '../controllers/movie_detail_view_controller.dart';

class MovieDetailViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailViewController>(
      () => MovieDetailViewController(),
    );
  }
}
