import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/movie_model.dart';
import '../provider/movie_provider.dart';

class moviescreen extends StatefulWidget {
  const moviescreen({Key? key}) : super(key: key);

  @override
  State<moviescreen> createState() => _moviescreenState();
}

class _moviescreenState extends State<moviescreen> {
  @override
  Widget build(BuildContext context) {
    SearchController get = Get.put(SearchController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                  controller: get.txtmovie,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            get.movie.value = get.txtmovie.text;
                          },
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          )),
                      label: Text("Enter movie name",style: TextStyle(color: Colors.white)),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    () => FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      MovieDetails? movie = snapshot.data as MovieDetails;
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 400,
                              width: 300,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    "${movie.d![0].i!.imageUrl}",
                                    fit: BoxFit.cover,
                                  )),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 280,
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${movie.d![0].l}",style: GoogleFonts.ptSerif(fontSize: 30,color: Colors.white),),
                                  SizedBox(width: 5,),
                                  Text("(${movie.d![0].y})",style: TextStyle(fontSize: 25,color: Colors.white),),
                                  SizedBox(height: 5,),
                                  Text("${movie.d![0].s}",style: TextStyle(fontSize: 15,color: Colors.white),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.black,
                        ));
                  },
                  future: get.movieGetApiCalling(get.movie.value),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
