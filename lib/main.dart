import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/model/cart_model_provider.dart';
import 'package:shop_app/pages/introPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> CardModel(),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}

