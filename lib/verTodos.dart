// ignore: file_names


// ignore_for_file: use_key_in_widget_constructors, file_names, camel_case_types, avoid_function_literals_in_foreach_calls, unnecessary_this, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import './adapters/database.dart';
import './itemPesaje.dart';

import 'entities/pesaje.dart';

class VerTodos extends StatefulWidget{
  @override
  _verTodosState createState()=> _verTodosState();
}
class _verTodosState extends State<VerTodos> {

  List<Pesaje>listaPesajes=[];
  @override
  void initState() {
    obtenerPesajes();
  }
  void obtenerPesajes(){

  }
  @override
  Widget build(BuildContext context) {

    if(listaPesajes.length==0){
return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          /*
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/fondoHome.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          */
          child: Container(
            // ignore: unnecessary_new
            child: new SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Text(
                              'Historial',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  color: Color.fromRGBO(159, 37, 37, 1),
                                  fontWeight: FontWeight.bold))),
                    ),

                   Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Text(
                              "No hay datos",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 26,
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
    
        );
    }
else{
 return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          /*
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/img/fondoHome.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          */
          child: Container(
            // ignore: unnecessary_new
            child: new SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text(
                              'Historial',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 40,
                                  color: Color.fromRGBO(159, 37, 37, 1),
                                  fontWeight: FontWeight.bold))),
                    ),

                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: 
                            ListView.builder(
                              itemCount: listaPesajes.length,
                              // itemBuilder: (context, int item) => new Text("${lista[item].fecha} ${lista[item].hora} ${lista[item].tipohora.toString().substring(lista[item].tipohora.toString().indexOf('.') + 1)}"))
                              itemBuilder: (context, int item) =>
                                   ItemPesaje(listaPesajes[item]))
                                 

                          ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        ),
    
        );}
  }

}