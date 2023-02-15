import 'dart:convert';

import '../model/usersmodel.dart';
import 'package:http/http.dart' as http;

class UsersService {
  Future<List<Data>?> getUsers() async {
    try {
      var baseUrl = Uri.parse('https://reqres.in/api/users?page=2');
      var response = await http.get(baseUrl);
      print('Response status: ${response.statusCode}');

      final dataModel =
          UsersModel.fromJson(response.body != null ? jsonDecode(response.body) : null);

      return dataModel.data;
    } catch (e) {
      print(e);
    }
  }
}
