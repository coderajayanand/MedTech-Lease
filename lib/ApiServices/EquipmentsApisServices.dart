import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Classes/Equipment.dart';

class EquipmentService {
  final String baseUrl = 'http://192.0.0.2:8080/api';

  Future<List<Equipment>> getAllEquipments() async {
    print("function in api started in home ");
    final response = await http.get(Uri.parse('$baseUrl/getAllEquipments'));
    print("raw response in home = "+ response.body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      print("json response in home = "+jsonResponse.toString());
      return jsonResponse.map((equipment) => Equipment.fromJson(equipment)).toList();
    } else {
      throw Exception('Failed to load equipments');
    }
  }
}
