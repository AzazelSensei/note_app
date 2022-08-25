// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:note_app/features/register/model/register_model.dart';
import '../features/login/model/login_model.dart';
import 'package:note_app/network/endpoint.dart';

class NoteRepository {
  final Dio dio;

  NoteRepository({required this.dio});

  Future<LoginModelPost> login(String username, String password) async {
    final response = await dio.post(EndPoint.login, data: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return LoginModelPost.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<RegisterModelPost> register(String username, String password) async {
    final response = await dio.post(EndPoint.register, data: {
      'username': username,
      'password': password,
    });
    return RegisterModelPost.fromJson(response.data);
  }
}
