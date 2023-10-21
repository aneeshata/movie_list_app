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

    return Scaffold(

      appBar: AppBar(
        title: const Text('MovieDetail view'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:  [Color(0xFFFF0080), Color(0xFFFF4A4A)], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body:SafeArea(
    child: ListView(
    scrollDirection: Axis.vertical,
      children: [Container(
        height: 844,
        decoration: BoxDecoration(color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(19),),
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(child: Image.network(movieData.poster ?? '',fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 469,))
              ],
            ),
            Stack(
              children: [
                Positioned(
                    left: 0,
                    top: 250,
                    child: Container(
                      height:440,width:MediaQuery.of(context).size.width,decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0,top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text('INFO',style: TextStyle(fontFamily: 'serif',fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 20.0,),
                            Text(movieData.title ?? '',style: TextStyle(fontFamily: 'serif',fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text(movieData.genre ?? '',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('Language : ${movieData.language ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),

                            SizedBox(height: 6.0,),
                            Text('Director : ${movieData.director ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                           SizedBox(height: 6.0,),
                            Text('Actors : ${movieData.actors ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('Awards : ${movieData.awards ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('Released Date : ${movieData.released ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('Year : ${movieData.year ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('Response : ${movieData.response ?? ' '}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                            SizedBox(height: 6.0,),
                            Text('ImdRating : ${movieData.imdbRating ?? ''}',style: TextStyle(fontFamily: 'serif',fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black),),
                          ],
                        ),
                      ),))
              ],
            )
          ],
        ),

      )],
    ),
    )
    );
  }
}
