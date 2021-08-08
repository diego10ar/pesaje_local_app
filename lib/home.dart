// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_function_literals_in_foreach_calls, unnecessary_this

import 'dart:io';
import 'dart:ui';

import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import './nuevoPeso.dart';
import 'adapters/database.dart';
import 'entities/pesaje.dart';

class Home extends StatefulWidget {
  static const route = "/inicio";

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Pesaje> listaPesajes = [];
  @override
  void initState() {
    obtenerPesajes();
  }

  void obtenerPesajes() {
      ManejadorBd.instance.getPesajes().then(
          (filas){
              setState(() {
                listaPesajes=filas;
              });
          }
        );
  }

  @override
  Widget build(BuildContext context) {
    if (listaPesajes.length > 1) {
     
      Pesaje _pUltimo = listaPesajes[0];
      Pesaje _pAnterior = listaPesajes[1];
    diferenciaDias(_pAnterior.id, _pUltimo.id);
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                //////   ANTERIOR    //////////
                    Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Colors.red[900]!))),
                  child:
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Anterior",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "${_pAnterior.fecha}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "${_pAnterior.hora}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 40)),
                         campofoto("assets/musculo.png"), Padding(
                            padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pAnterior.musculo} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         campofoto("assets/grasa.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pAnterior.grasa} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                       campofoto("assets/agua.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pAnterior.agua} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           campofoto("assets/hueso.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pAnterior.osea} Kg",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          campofoto("assets/peso.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pAnterior.peso} Kg",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                  ],
                ),),
                //////   Último    //////////
                
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      border:
                          Border(right: BorderSide(color: Colors.red[900]!))),
                  child:
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Último",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "${_pUltimo.fecha}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text(
                        "${_pUltimo.hora}",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 40)),
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              "${_pUltimo.musculo} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              "${_pUltimo.grasa} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              "${_pUltimo.agua} %",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              "${_pUltimo.osea} Kg",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 2),
                            child: Text(
                              "${_pUltimo.peso} Kg",
                              style: TextStyle(fontSize: 22),
                            ),
                          ),
                        ]),
                  ],
                ),),
                //////   Total    //////////
                 Container(
                  margin: const EdgeInsets.only(top: 15.0),
                 
                  child:
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20,bottom:5),
                      child: Text(
                        "Cambio en",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                 diferenciaDias(_pAnterior.id, _pUltimo.id),
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                     
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia musculo

                          Padding(padding: EdgeInsets.only(top: 40)),
                          diferenciaMusculo(
                              _pAnterior.musculo, _pUltimo.musculo),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia grasa
                          diferenciaGrasa(_pAnterior.grasa, _pUltimo.grasa),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia agua
                          diferenciaResto(_pAnterior.agua, _pUltimo.agua)
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia osea
                          diferenciaResto(_pAnterior.osea, _pUltimo.osea)
                        ]),
                    Padding(padding: EdgeInsets.only(top: 40)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia osea
                          diferenciaPeso(_pAnterior.peso, _pUltimo.peso)
                        ]),
                  ],
                ),),
                
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
             Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia osea
                           ultimoPesaje(_pUltimo.id,_pUltimo.hora)
                        ]),
            ],)
          ),
        ),
      );
    } 
    else if(listaPesajes.length == 1){
      Pesaje _pUltimo = listaPesajes[0];
  return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 60),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //////   ÚLTIMO    //////////
                    Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: EdgeInsets.only(right: 10),
               
                  child:
                Column(
                  children: [
                  
                    Padding(
                      padding: EdgeInsets.only(top: 20,bottom: 30),
                      child: Text(
                        "${_pUltimo.fecha} -- ${_pUltimo.hora}",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                   
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 40)),
                         campofoto2("assets/musculo.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pUltimo.musculo} %",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           campofoto2("assets/grasa.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pUltimo.grasa} %",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          campofoto2("assets/agua.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pUltimo.agua} %",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           campofoto2("assets/hueso.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pUltimo.osea} Kg",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ]),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                           campofoto2("assets/peso.png"),Padding(padding: EdgeInsets.only(left: 15,right: 2),
                            child: Text(
                              "${_pUltimo.peso} Kg",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ]),
                  ],
                ),),
               
            
                
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
             Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // diferencia osea
                           ultimoPesaje(_pUltimo.id,_pUltimo.hora)
                        ]),
            ],)
          ),
        ),
      );
    }
    else {
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
                          padding: EdgeInsets.only(top: 100, bottom: 60, right: 15, left:15),
                          child: Text("NO HAY DATOS \n\n Pulsa en añadir tu primer pesaje",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 26,
                                  color: Colors.red[900],
                                  fontWeight: FontWeight.bold))),
                    ),
                    botonanadir(context)
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }

  Widget botonanadir(BuildContext context) {
    return Container(
        width: 240,
        padding: const EdgeInsets.only(top: 20),
        child: TextButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                Color.fromRGBO(25, 51, 0, 1),
              ),
              overlayColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side:
                          BorderSide(color: Color.fromRGBO(15, 102, 117, 1))))),
          child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Añadir', style: TextStyle(fontSize: 25))),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NuevoPeso()));
          },
        ));
  }
  Widget campofoto(String foto) {
    
    return Container(
        width: 22.0,
        height: 22.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(foto),
          ),
        ));
  }
  
  Widget campofoto2(String foto) {
    
    return Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(foto),
          ),
        ));
  }

  diferenciaMusculo(String musAnterior, String musUltimo) {
    double anterior = double.parse(musAnterior);

    double ultimo = double.parse(musUltimo);
    double total = double.parse((ultimo - anterior).toStringAsFixed(2));

    if (total > 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("+$total %",
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold)));
    } else if (total < 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold)));
    } else {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    }
  }

  diferenciaGrasa(String grasAnterior, String grasUltimo) {
    double anterior = double.parse(grasAnterior);

    double ultimo = double.parse(grasUltimo);
    double total = double.parse((ultimo - anterior).toStringAsFixed(2));

    if (total > 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("+$total %",
              style: TextStyle(
                  color: Colors.red[900],
                  fontSize: 26,
                  fontWeight: FontWeight.bold)));
    } else if (total < 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(
                  color: Colors.green[900],
                  fontSize: 22,
                  fontWeight: FontWeight.bold)));
    } else {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    }
  }

  diferenciaResto(String datoAnterior, String datoUltimo) {
    double anterior = double.parse(datoAnterior);

    double ultimo = double.parse(datoUltimo);
    double total = double.parse((ultimo - anterior).toStringAsFixed(2));
    if (total > 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("+$total %",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    } else if (total < 0) {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    } else {
      return Padding(
          padding: EdgeInsets.only(right: 2),
          child: Text("$total %",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
    }
  }
}

diferenciaPeso(String pesoAnterior, String pesoUltimo) {
  double anterior = double.parse(pesoAnterior);

  double ultimo = double.parse(pesoUltimo);
  double total = double.parse((ultimo - anterior).toStringAsFixed(2));

  if (total > 0) {
    return Padding(
        padding: EdgeInsets.only(right: 2),
        child: Text("+$total Kg",
            style: TextStyle(
                color: Colors.red[900],
                fontSize: 22,
                fontWeight: FontWeight.bold)));
  } else if (total < 0) {
    return Padding(
        padding: EdgeInsets.only(right: 2),
        child: Text("$total Kg",
            style: TextStyle(
                color: Colors.green[900],
                fontSize: 22,
                fontWeight: FontWeight.bold)));
  } else {
    return Padding(
        padding: EdgeInsets.only(right: 2),
        child: Text("$total Kg",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
  }
}

ultimoPesaje( String fechaUltima, String hora){
  
  
 DateTime hoy=DateTime.now();
  DateTime epoUlt=DateTime.fromMillisecondsSinceEpoch(int.parse(fechaUltima));

 DateTime ulti=DateTime(epoUlt.year,epoUlt.month,epoUlt.day);

 int diff=daysBetween(ulti,hoy);
 String texto="";
 if(diff==0){
 texto="Te has pesado hoy a las $hora";
 }
 else if(diff==1){
 texto="Te pesaste ayer a las $hora";
 }
 else{
   texto="Han pasado $diff días desde el último pesaje";
 }
  return  
  Container(
    width:300,
    child: 
  Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "$texto",textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ));
}  

diferenciaDias(String fechaAnterior, String fechaUltima){
  
  
 DateTime epoAnt=DateTime.fromMillisecondsSinceEpoch(int.parse(fechaAnterior));
  DateTime epoUlt=DateTime.fromMillisecondsSinceEpoch(int.parse(fechaUltima));
 DateTime ant=DateTime(epoAnt.year,epoAnt.month,epoAnt.day);
 DateTime ulti=DateTime(epoUlt.year,epoUlt.month,epoUlt.day);

 int diff=daysBetween(ant,ulti);
 String dias="dias";
 if(diff==1){
   dias="día";
 }
  return  Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Text(
                        "${diff} $dias",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    );
}  
int daysBetween(DateTime from, DateTime to) {
     from = DateTime(from.year, from.month, from.day);
     to = DateTime(to.year, to.month, to.day);
   return (to.difference(from).inHours / 24).round();
  }