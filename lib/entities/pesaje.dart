import '../adapters/database.dart';

class Pesaje {
  String id = (new DateTime.now().millisecondsSinceEpoch).toString();
  String peso="";
  String grasa="";
  String musculo="";
  String agua="";
  String osea="";
  String fecha="";
  String hora="";

  Pesaje(
      this.id,
      this.peso,
      this.grasa,
      this.musculo,
      this.agua,
      this.osea,
      this.fecha,
      this.hora);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      ManejadorBd.COLUMN_ID: id,
      ManejadorBd.COLUMN_PESO: peso,
      ManejadorBd.COLUMN_GRASA: grasa,
      ManejadorBd.COLUMN_MUSCULO: musculo,
      ManejadorBd.COLUMN_AGUA: agua,
      ManejadorBd.COLUMN_OSEA: osea,
      ManejadorBd.COLUMN_FECHA: fecha,
      ManejadorBd.COLUMN_HORA: hora
    };
    return map;
  }

  Pesaje.fromMap(Map<String, dynamic> map) {
    id = map[ManejadorBd.COLUMN_ID];
    peso = map[ManejadorBd.COLUMN_PESO];
    grasa = map[ManejadorBd.COLUMN_GRASA];
    musculo = map[ManejadorBd.COLUMN_MUSCULO];
    agua = map[ManejadorBd.COLUMN_AGUA];
    osea = map[ManejadorBd.COLUMN_OSEA];
    fecha = map[ManejadorBd.COLUMN_FECHA];
    hora = map[ManejadorBd.COLUMN_HORA];
  }
}
