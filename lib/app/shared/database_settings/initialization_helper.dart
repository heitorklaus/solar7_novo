// ignore_for_file: avoid_print

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InitializationHelper {
  static final InitializationHelper? _instance =
      InitializationHelper.getInstance();
  InitializationHelper.getInstance();

  factory InitializationHelper() => _instance!;

  static Database? _db;
  static const String dbase = "2ff.db";
  static const double version = 7.5;

  static const String apiCSVCategoriaDosItens =
      'https://sunix2021.herokuapp.com/api/csv/categoriadositens';
  static const String apiCSVMarca =
      'https://sunix2021.herokuapp.com/api/csv/marca';
  static const String apiCSVItensDosGeradores =
      'https://sunix2021.herokuapp.com/api/csv/itensdosgeradores';

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await _initDb();
    }

    return _db;
  }

  Future<FutureOr<void>> _onUpgrade(
      Database db, int oldVersion, int newVersion) async {
    print("_onUpgrade: oldVersion: $oldVersion > newVersion: $newVersion");

    if (oldVersion == 1 && newVersion == 2) {
      await db.execute("alter PROPOSAL_STRINGS carro add column NOVA TEXT");
    }
  }

  //  maps[i]['id'],
  //       maps[i]['eficiencia'],
  //       maps[i]['irradiacao'],

  Future _initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, dbase);
    print("[ USING DATABASE ] $path");
    var db = await openDatabase(path,
        version: 6, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    // Download CSV
    // print

    print('CREATE DATABASE');

    await db.execute(
      'CREATE TABLE USINAS (id INTEGER PRIMARY KEY, inversor varchar(255), modulo varchar(255),  tipo_inversor varchar(255) ,potencia_do_sistema REAL NULL, itens_da_usina text  NULL, servicos_adicionais varchar(255)  NULL, marca_do_modulo varchar(255) NULL,numero_de_modulo int4 NULL,  potencia_do_modulo int4 NULL, marca_do_inversor varchar(255) NULL, dados_do_gerador text NULL , valor_do_sistema numeric(10,2) NULL)',
    );

    await db.execute(
      'CREATE TABLE CLIENTES (id INTEGER PRIMARY KEY, nome varchar(255), cpf varchar(255),  rg varchar(255)  ,  nascimento varchar(255),  endereco1 text null, rua1 varchar(255) null, cep1 varchar(255) null, endereco2 varchar(255) null, rua2 varchar(255) null, cep2 varchar(255) null, cidade varchar(255) null, uf varchar(20) null     )',
    );

    await db.execute(
      'CREATE TABLE CONFIG (id INTEGER PRIMARY KEY, eficiencia REAL NULL,irradiacao  REAL NULL)',
    );

    await db.execute(
        "INSERT INTO CONFIG (eficiencia,irradiacao) VALUES('0.75','5.11')");

    await db.execute(
        "INSERT INTO USINAS (inversor,modulo,tipo_inversor,potencia_do_sistema,itens_da_usina,servicos_adicionais,marca_do_modulo,numero_de_modulo,potencia_do_modulo,marca_do_inversor,dados_do_gerador,valor_do_sistema) VALUES('GROWAT 9K 220V 3MPPT','TRINA BIFACIAL 540WP','STRING',12.10,'NULL','NULL','TRINA',22,540,'GROWATT','DADOS','1999')");
    await db.execute(
        "INSERT INTO USINAS (inversor,modulo,tipo_inversor,potencia_do_sistema,itens_da_usina,servicos_adicionais,marca_do_modulo,numero_de_modulo,potencia_do_modulo,marca_do_inversor,dados_do_gerador,valor_do_sistema) VALUES('APSYSTEM QS 220V','LEAPTON BIFACIAL 690','MICROINVERSOR',24.10,'NULL','NULL','TRINA',30,690,'APSYSTEM','DADOS','23232')");

    await db.execute(
        "INSERT INTO USINAS (inversor,modulo,tipo_inversor,potencia_do_sistema,itens_da_usina,servicos_adicionais,marca_do_modulo,numero_de_modulo,potencia_do_modulo,marca_do_inversor,dados_do_gerador,valor_do_sistema) VALUES('DEYE BELENERGY 220V','BELENERGY BIFACIAL 545','STRING',10.10,'NULL','NULL','TRINA',16,545,'DEYE','DADOS','34343')");
  }

  Future close() async {
    var dbClient = await db;
    return dbClient?.close();
  }
}
