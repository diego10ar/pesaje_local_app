// ignore: file_names


// ignore_for_file: use_key_in_widget_constructors, file_names, camel_case_types, unnecessary_new, prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import './entities/pesaje.dart';
import './menu.dart';

import 'adapters/database.dart';
class NuevoPeso extends StatefulWidget{
  @override
  _nuevoPesoState createState()=> _nuevoPesoState();
}
class _nuevoPesoState extends State<NuevoPeso>  with SingleTickerProviderStateMixin {
  Color letras=Color.fromRGBO(25, 51, 0, 1);
     late AnimationController _controller;
   late Animation _animation;

  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController grasaController = TextEditingController();
  final TextEditingController musculoController = TextEditingController();
  final TextEditingController oseoController = TextEditingController();
  final TextEditingController aguaController = TextEditingController();
  String _peso="",
   _grasa="",
   _musculo="",
   _agua="",
   _osea="";

    Color _cPeso=Colors.grey,
   _cGrasa=Colors.grey,
   _cMusculo=Colors.grey,
   _cAgua=Colors.grey,
   _cOsea=Colors.grey;
 

    @override
  void initState() {
    super.initState();
    
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 90.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
   _focusNode2.addListener(() {
      if (_focusNode2.hasFocus) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _focusNode2.dispose();
 pesoController.dispose();
grasaController.dispose();
musculoController.dispose();
oseoController.dispose();
aguaController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
 return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Container(
            child: new SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text('Nuevo Pesaje',
                            textAlign: TextAlign.center,
                            style: TextStyle(
        
                                letterSpacing: 2,
                                fontSize: 30,
                                color: letras,
                                fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                          //color: Colors.blue[50],
                          color: Color.fromRGBO(234, 236, 238, 1),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            titulo("Peso"),
                            entradaPeso(),
                            titulo("Grasa"),
                            entradaGrasa(),
                            titulo("Músculo"),
                            entradaMusculo(),
                            titulo("Agua"),
                            entradaAgua(),
                            titulo("Osea"),
                           entradaOsea(),
                            Center(child: botonanadir(context)),
                             SizedBox(height: _animation.value),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
  Widget titulo(String dato) {
    return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Text("$dato",
            style: TextStyle(
                fontSize: 25,
                color: letras,
                fontWeight: FontWeight.bold)));
  }
   Widget entradaPeso() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18.0, color: _cPeso),
            fillColor: Colors.white,
            filled: true,
            
            hintText: 'kg',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        controller: pesoController,
      ),
    );
  }

 Widget entradaGrasa() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18.0, color: _cGrasa ),
            fillColor: Colors.white,
            filled: true,
            
            hintText: '% graso',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        controller: grasaController,
      ),
    );
  }
   Widget entradaMusculo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18.0, color: _cMusculo ),
            fillColor: Colors.white,
            filled: true,
            
            hintText: '% musculo',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        controller: musculoController,
      ),
    );
  }
Widget entradaAgua() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18.0,color: _cAgua ),
            fillColor: Colors.white,
            filled: true,
            
            hintText: '% agua',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        controller: aguaController,
         focusNode: _focusNode2,
      ),
    );
  }
  Widget entradaOsea() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18.0, color: _cOsea ),
            fillColor: Colors.white,
            filled: true,
            
            hintText: 'kg ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )),
             focusNode: _focusNode,
        controller: oseoController,
      ),
    );
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
            _comprobarDatos(context);
            //Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrarUsuario()));
          },
        ));
  }
  void _comprobarDatos(BuildContext context) {
    _peso = pesoController.text;
    _peso=_peso.replaceAll(',', '.');
    _grasa = grasaController.text;
_grasa=_grasa.replaceAll(',', '.');
    _musculo = musculoController.text.trim();
_musculo=_musculo.replaceAll(',', '.');
    _agua = aguaController.text;
_agua=_agua.replaceAll(',', '.');
    _osea = oseoController.text;
_osea=_osea.replaceAll(',', '.');
    
    bool mal = false;
    if (_peso == "") {mal = true;
      setState(() {_cPeso = (Colors.red[900])!;});
    }
    if (_grasa == "") {mal = true;
      setState(() {

        _cGrasa=(Colors.red[900])!;
      });
    }
    if (_musculo == "") {mal = true;
      setState(() {_cMusculo =(Colors.red[900])!; });
    }
    if (_agua == "") {mal = true;
      setState(() {_cAgua = (Colors.red[900])!;  });
    }
    if (_osea == "") {mal = true;
      setState(() {_cOsea = (Colors.red[900])!;  });
    }
    
if (mal) {
    
     

     Fluttertoast.showToast(
          msg: "Faltan algunos datos",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red[900],
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else{
       String _fecha="Fecha";
      String _hora="Hora";
      String todo=(DateTime.now().millisecondsSinceEpoch).toString();
      _fecha=_formatDateTime(DateTime.now());
      _hora=_formatDateTime2(DateTime.now());
  print(_hora);
      Pesaje pesaje=new Pesaje("cambiara", todo, _peso, _grasa, _musculo, _agua, _osea, _fecha,_hora);
       //borrar cuando bien
      // addPesaje(pesaje);
     
      //borar cuando bien
 Fluttertoast.showToast(
          msg: "Añadido correctamente",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green[900],
          textColor: Colors.white,
          fontSize: 16.0);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Menu()));
     
     
    
    }
     
  }
  String _formatDateTime(DateTime dateTime) {
    //return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }
    String _formatDateTime2(DateTime dateTime) {
    //return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
    return DateFormat('HH:mm').format(dateTime);
  }

}