// ignore_for_file: file_names, prefer_const_constructors

import 'entities/pesaje.dart';
import 'package:flutter/material.dart';

class ItemPesaje extends StatelessWidget {
  Pesaje _pesaje;

  ItemPesaje(this._pesaje);

  @override
  Widget build(BuildContext context) {
    

 

 
    return  Padding(
        padding: EdgeInsets.only(right:2,left:2,top:5,bottom: 5),
        child: Container(
          
          height: 145,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(159, 37, 37, 1)),
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  Padding(padding: EdgeInsets.only(right: 5),child: Text("${_pesaje.peso} Kg", style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),),
                 Padding(padding: EdgeInsets.only(right: 5),child: Text("${_pesaje.fecha}  ${_pesaje.hora}",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),),
              
                  ],),
                   Padding(padding: EdgeInsets.only(top:10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  campofoto("assets/musculo.png"),Padding(padding: EdgeInsets.only(right: 2),child: Text("${_pesaje.musculo} %",style: TextStyle(fontSize: 24),),),
                  campofoto("assets/grasa.png"), Text("${_pesaje.grasa} %",style: TextStyle(fontSize: 24),),
              
                  ],),
                  Padding(padding: EdgeInsets.only(top:10)),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                  
                  campofoto("assets/agua.png"),Padding(padding: EdgeInsets.only(right: 2),child: Text("${_pesaje.agua} %",style: TextStyle(fontSize: 24),),),
                  campofoto("assets/hueso.png"), Text("${_pesaje.osea} Kg",style: TextStyle(fontSize: 24),),
                  ],),
                 
                
                 
                ],
              )),
        ));
  }

   Widget campofoto(String foto) {
    return Container(
        width: 35.0,
        height: 35.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(foto),
          ),
        ));
  }
}
