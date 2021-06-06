import 'dart:convert';

import 'package:covid_beautiful_ui/models/data_corona.dart';
import 'package:http/http.dart' as http;

class DataCoronaRepository {
  late String dataPositifDunia;
  late String dataSembuhDunia;
  late String dataMeninggalDunia;
  final baseUrl = 'https://api.kawalcorona.com/';

  Future<DataIndonesia> fetchData() async {
    final response = await http.get(Uri.parse("$baseUrl/indonesia"));
    final results = json.decode(response.body.toString());
    return DataIndonesia.fromMap(results[0]);
  }

  Future<String> fetchDataPositifDunia() async {
    final response = await http.get(Uri.parse("$baseUrl/positif"));
    final result = json.decode(response.body.toString());
    dataPositifDunia = result['value'];
    return dataPositifDunia;
  }

  Future<String> fetchDataSembuhDunia() async {
    final response = await http.get(Uri.parse("$baseUrl/sembuh"));
    final result = json.decode(response.body.toString());
    dataSembuhDunia = result['value'];
    return dataSembuhDunia;
  }

  Future<String> fetchDataMeninggalDunia() async {
    final response = await http.get(Uri.parse("$baseUrl/meninggal"));
    final result = json.decode(response.body.toString());
    dataMeninggalDunia = result['value'];
    return dataMeninggalDunia;
  }
}
