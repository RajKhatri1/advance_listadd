import 'package:advance_listadd/screen/provider/homeprovider.dart';
import 'package:advance_listadd/screen/view/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    ChangeNotifierProvider(
      create: (context) => Homeprovider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Homescreen(),
        },
      ),
    ),
  );
}