import 'package:get/get.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';
import 'package:movie_list_app/app/utlities/auth_repo.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  AuthRepo authRepo = AuthRepo();
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

  Future<MovieListResponse?> viewData() async {

    MovieListResponse? movieListResponse =await authRepo.getMovie();
    if (movieListResponse != null) {

      return movieListResponse;
    }else{
      Get.snackbar('Failed!','No Data');
    }

  }
}
