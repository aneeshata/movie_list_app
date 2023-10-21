import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';

import '../controllers/movie_detail_view_controller.dart';

class MovieDetailViewView extends GetView<MovieDetailViewController> {

  @override
  Widget build(BuildContext context) {
    final movieData = Get.arguments as MovieListResponse; // Retrieve the movie data
    print('Received data: $movieData');
    print('Value from data: $movieData');

    // Assuming movieData.ratings is a List<String>
    List<Widget> ratingWidgets = movieData.ratings?.map((rating) {
      return Text('Rating: $rating', style: TextStyle(
        fontWeight: FontWeight.normal,
        color: Colors.black,
        fontSize: 12,
        fontFamily: 'sans-serif',
      ));
    }).toList() ?? [];
    return Scaffold(

      appBar: AppBar(
        title: const Text('MovieDetailViewView'),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 300,
              height: 400,

              decoration: BoxDecoration(color:Colors.white,boxShadow: [new BoxShadow(color: Colors.grey,blurRadius: 10.0)]),
            ),
            Positioned(
              top: 0,
              left: 0,// Adjust as needed
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.network(movieData.poster ?? '',width: 80,height: 100,fit: BoxFit.cover,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(movieData.title ?? '',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 12,fontFamily: 'san-serif'),),
                            Text('Language :${movieData.language ?? ''}',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12,fontFamily: 'san-serif'),),
                            Text('Year :${movieData.year ?? ''}',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12,fontFamily: 'san-serif'),),
                            Text('Genre :${movieData.genre ?? ''}',style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 12,fontFamily: 'san-serif'),),

                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('INFO',style: TextStyle(fontFamily: 'serif',fontSize: 17,fontWeight: FontWeight.bold),),

                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
