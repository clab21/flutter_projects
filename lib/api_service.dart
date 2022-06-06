import 'dart:developer';

import 'package:flutter_projects/model/mahasiswa_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_projects/constants.dart';
// import 'package:flutter_projects/model/user_model.dart';

class ApiService {
  Future<List<MahasiswaModel>?> getMahasiswas() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<MahasiswaModel> model = mahasiswaModelFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}