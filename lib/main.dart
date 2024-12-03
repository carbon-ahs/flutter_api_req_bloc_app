import 'package:api_request_bloc_app/features/post/ui/post_page.dart';
import 'package:flutter/material.dart';

import 'features/home/home_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostPage(),
    );
  }
}
