

import 'package:flutter/material.dart';
import './nuevoPeso.dart';
import './verTodos.dart';

import 'menu.dart';


void main()  {
   WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  Menu(),
    routes:{
      '/nuevoPeso':(context) =>  NuevoPeso(),
       '/verTodos':(context) =>  VerTodos(),
           },
  ));
}
