import 'package:pesaje_local_app/adapters/database.dart';


class Pesaje{
  String idbbdd;
  String id =(new DateTime.now().millisecondsSinceEpoch).toString();
  String peso;
  String grasa;
  String musculo;
  String agua;
  String osea;
  String fecha;
  String hora;

  Pesaje(this.idbbdd,this.id,this.peso,this.grasa,this.musculo,this.agua,this.osea,this.fecha,this.hora);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'peso': peso,
      'grasa':grasa,
      'musculo': musculo,
      'agua': agua,
      'osea': osea,
      'fecha': fecha,
      'hora':hora,

    };
  }
}

Pesaje crearPesaje(record, String idbase) {
  Map<String, dynamic> attributes = {
    'id':'',
    'peso': '',
    'grasa': '',
    'musculo': '',
      'agua': '',
      'osea': '',
      'fecha': '',
      'hora':'',

  };
  record.forEach((key, value) => {attributes[key] = value});
   
  Pesaje dispositivo =  Pesaje(
      idbase,
      attributes['id'],
      attributes['peso'],
      attributes['grasa'],
      attributes['musculo'],
      attributes['agua'],
      attributes['osea'],
      attributes['fecha'],
      attributes['hora'],
      );
  return dispositivo;
}
