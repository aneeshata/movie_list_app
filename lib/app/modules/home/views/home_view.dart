import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_list_app/app/data/movie_name_list_response.dart';
import 'package:movie_list_app/app/modules/movie_detail_view/views/movie_detail_view_view.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:  [Color(0xFFFF0080), Color(0xFFFF4A4A)], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text('Movie List',style: TextStyle(color: Colors.white),),
      ),
      body: FutureBuilder<MovieListResponse ?>(
        future: controller.viewData(), // Call your fetchMovieData function here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No data available.'));
          } else {
            return Container(
              decoration: new BoxDecoration(image: DecorationImage(image: AssetImage('asset/images/movie_bg.png'),fit: BoxFit.cover)),
              child: Column(
                children: [
                  SizedBox(
                    height: 500,
                    // Use a ListView.builder to display the movie data
                    child: ListView.builder(
                      itemCount:5, // Assuming you want to display one item.
                      itemBuilder: (context, index) {
                        final movieData = snapshot.data; // Get the movie data
                        return Padding(
                          padding: const EdgeInsets.only(left: 25.0,
                              right: 25.0,
                              top: 10.0,
                              bottom: 10.0),
                          child: GestureDetector(
                            onTap: (){
                              if (movieData!=null) {
                                Get.toNamed(Routes.MOVIE_DETAIL_VIEW,arguments: movieData);
                                //print('passed data $movieData');
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailViewView(movieData:movieData),));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(color: Colors.white, 
                                  boxShadow: [new BoxShadow(color: Colors.grey,
                                      blurRadius: 10.0)]),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      ClipRRect(
                                        child: Image.network(movieData?.poster ?? '',
                                          height: 150,
                                          width: 100,
                                          fit: BoxFit.cover,),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data?.title ?? '',
                                          style: TextStyle(fontSize: 15.0,
                                              fontFamily: 'serif',
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),),
                                        Text(snapshot.data?.year ?? '')
                                      ],
                                    ),
                                  ),
                                  
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
