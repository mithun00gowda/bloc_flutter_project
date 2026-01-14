import 'package:bloc_flutter_project/screens/home/ui/home.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w700),
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        )
      ),
      home: Home(),
    );
  }
}
