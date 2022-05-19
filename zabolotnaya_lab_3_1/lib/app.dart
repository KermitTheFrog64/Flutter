import 'package:flutter/material.dart';
import 'package:zabolotnaya_lab_3_1/API_provider.dart';
import 'package:provider/provider.dart';
import 'my_home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> APIProvider(),
        )
      ],
      child: const MaterialApp(
        home:  MyHomePage(),
      ),
    );
  }
}