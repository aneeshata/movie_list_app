import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';
import 'package:movie_list_app/app/utlities/dio_client.dart';



class AuthRepo{
  DioClient dioClient = GetIt.instance<DioClient>();

  Future<MovieListResponse?> getMovie() async{
    try{
      Response response = await dioClient.request({}, RequestType.get, 'http://www.omdbapi.com/?i=tt3896198&apikey=84e8152b');
      print(response);
      if (response.statusCode == 200) {
        MovieListResponse movieListResponse = MovieListResponse.fromJson(response.data);
        return movieListResponse;
      }
      else{
        MovieListResponse movieListResponse = MovieListResponse.fromJson(response.data);
        return movieListResponse;
      }
    } on DioException catch(e){
      if (e.response?.statusCode==400) {
        MovieListResponse movieListResponse = MovieListResponse.fromJson(e.response?.data);
        return movieListResponse;
      }
      if (e.response != null) {
        // Server responded with a bad status code
        print('Error: ${e.response!.statusCode}');
        print('Message: ${e.response!.data}');
        return null;
      } else {
        // Request failed before getting a response
        print('Error: ${e.message}');
        return null;


      }
    }

  }

}