import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final baseURL = "http://192.168.0.59:8080";

final dio = Dio(
  BaseOptions(
    baseUrl: baseURL,
    contentType: "application/json; charset=utf-8",
    validateStatus: (status) => true,
  ),
);

const secureStorage = FlutterSecureStorage();
