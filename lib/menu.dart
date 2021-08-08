// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:ui';

import "package:flutter/material.dart";
import './home.dart';

class Menu extends StatefulWidget {
  static const route = "/menu";

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  ListTile _itemMenu(BuildContext context, IconData iconData, String texto,
      String ruta, Color colortodo) {
    return ListTile(
        contentPadding: EdgeInsets.all(20),
        leading: Icon(
          iconData,
          color: colortodo,
          size: 40,
        ),
        title: Text(
          texto,
          style: TextStyle(fontSize: 20, color: colortodo),
        ),
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, ruta);
          });
        });
  }

  ListView _construirListView(BuildContext context) {
    return ListView(children: <Widget>[
      Center(
        child: Padding(
            padding: EdgeInsets.only(top: 20,bottom: 60),
            child: Text(
              "MENÚ",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(102, 0, 102, 1)),
            )),
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
      Container(
        child: _itemMenu(context, Icons.add_box_outlined, "Nuevo pesaje",
            "/nuevoPeso", Colors.white),
        color: Color.fromRGBO(102, 0, 102, 1),
      ),
      const Padding(padding: EdgeInsets.only(top: 20)),
         Container(
        child: _itemMenu(context, Icons.query_stats, "Ver Todos",
            "/verTodos", Colors.white),
        color: Color.fromRGBO(102, 0, 0, 1),
      ),
    ]);
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 7),
          child: Text('Estadísticas',
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 30,
                  color: Color.fromRGBO(159, 37, 37, 1),
                  fontWeight: FontWeight.bold)),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(child: _construirListView(context)),
      body: Home(),
    );
  }
}
