import 'dart:convert';

import '../Classes/Hospital.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.0.0.2:8080/api';

  Future<Hospital> getHospitalCredentials({Map<String, String>? queryParams}) async {
    print('function started');
    final uri = Uri.parse('$baseUrl/hospital/validate').replace(queryParameters: queryParams);
    final response = await http.get(uri);
    print('raw response came = ');
    print(response);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      print('json response = ');
      print(jsonResponse);
      print('and = ');
      print(Hospital.fromJson(jsonResponse));
      return Hospital.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to load Hospital credentials');
    }
  }

}