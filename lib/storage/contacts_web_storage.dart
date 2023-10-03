import 'package:contact_list_flutter/models/contact_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

class ContactsRepository {
  final Dio _dio = Dio();

  ContactModel() {
    String apiKey = "X-Parse-REST-API-Key";
    String appId = "X-Parse-Application-Id";
    String baseUrl = "BASE-URL";
    String contentType = "Content-Type";

    _dio.options.headers[apiKey] = dotenv.env[apiKey];
    _dio.options.headers[appId] = dotenv.env[appId];
    _dio.options.headers[contentType] = dotenv.env[contentType];
    _dio.options.baseUrl = dotenv.get(baseUrl);
  }

  Future<List<Results>> getAll() async {
    var response = await _dio.get("/");
    return ContactModel().fromJson(response.data);
  }

  Future<Results> getById(String id) async {
    var response = await _dio.get("/$id");
    var data = response.data;
    return Results(
        createdAt: data["createdAt"],
        imagePath: data["imagePath"],
        name: data["name"],
        objectId: data["objectId"],
        phoneNumber: data["phoneNumber"],
        updatedAt: data["updatedAt"]);
  }

  Future<bool> deleteById(String id) async {
    var response = await _dio.delete("/$id");
    return response.statusCode == 202;
  }

  Future<bool> updateById(String id, Map<String, dynamic> data) async {
    var response = await _dio.put("/$id", data: data);
    return response.statusCode == 201;
  }

  Future<bool> create(Results data) async {
    var response = await _dio.post("/", data: {
      "imagePath": data.imagePath,
      "name": data.name!,
      "phoneNumber": data.phoneNumber,
    });

    return response.statusCode == 201;
  }
}
