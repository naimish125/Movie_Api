import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Screens/view/movie_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(p0) => moviescreen(),
      },
    ),
  );
}
