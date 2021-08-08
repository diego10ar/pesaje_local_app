

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './nuevoPeso.dart';
import './verTodos.dart';

import 'menu.dart';


void main()   {


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  Menu(),
    routes:{
      '/nuevoPeso':(context) =>  NuevoPeso(),
       '/verTodos':(context) =>  VerTodos(),
           },
  ));
}

