
import '../main.dart';

import '../entities/pesaje.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class ManejadorBd{
  static final ManejadorBd instance = ManejadorBd._init();

  static const String TABLE_PESAJES = "pesajes";
  static const String COLUMN_ID="id";
  static const String COLUMN_PESO="peso";
  static const String COLUMN_GRASA="grasa";
  static const String COLUMN_MUSCULO="musculo";
  static const String COLUMN_AGUA="agua";
  static const String COLUMN_OSEA="osea";
  static const String COLUMN_FECHA="fecha";
  static const String COLUMN_HORA="hora";

  static Database? _database;
   ManejadorBd._init() ;
  
 


 Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pesajes.db');
    return _database!;
  }

    Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: createDatabase);
  }

   Future createDatabase(Database db, int version) async {
  

 
      await db.execute(
        "CREATE TABLE $TABLE_PESAJES ("
        "$COLUMN_ID TEXT PRIMARY KEY,"
        "$COLUMN_PESO TEXT,"
        "$COLUMN_GRASA TEXT,"
        "$COLUMN_MUSCULO TEXT,"
        "$COLUMN_AGUA TEXT,"
        "$COLUMN_OSEA TEXT,"
        "$COLUMN_FECHA TEXT,"
        "$COLUMN_HORA TEXT"
        ")",
      );

      //meterPesajes(database);
    
          
        }

            Future<List<Pesaje>> getPesajes() async {
          final db = await instance.database;
          var pesajes = await db.query(TABLE_PESAJES, columns: [
            COLUMN_ID,
             COLUMN_PESO,
             COLUMN_GRASA,
             COLUMN_MUSCULO,
             COLUMN_AGUA,
             COLUMN_OSEA,
             COLUMN_FECHA,
             COLUMN_HORA,
          ]);
          List<Pesaje> listaPesajes = [];
          pesajes.forEach((currentpesaje) {
            Pesaje pesaje = Pesaje.fromMap(currentpesaje);
            listaPesajes.insert(0,pesaje);
          });
      
          return listaPesajes;
        }
            Future<Pesaje> insertPesaje(Pesaje pesaje) async {
          final db = await database;
          await db.insert(TABLE_PESAJES, pesaje.toMap());
          return pesaje;
        }

         Future close() async {
    final db = await instance.database;

    db.close();
  }
}



