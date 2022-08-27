// ignore_for_file: depend_on_referenced_packages, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../network/repository.dart';
import 'package:dio/dio.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.noteRepository) : super(LoginInitial());

  final NoteRepository noteRepository;

  Future<void> login(
      {required String username, required String password}) async {
    emit(LoginLoading());

    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Kullanıcı Adı veya Şifre Boş Olamaz';
      } else if (username.isNotEmpty) {
        var response = await Dio().post('http://192.168.1.102:5000/login/',
            data: {'username': 'admin', 'password': 'admin'});
        print(response.data.toString());
      }

      // final response = await noteRepository.login(username, password);
      // emit(LoginSuccess(
      // message: response.message, statusCode: response.statusCode));
    } catch (e) {
      emit(LoginError(message: e.toString(), statusCode: e.toString()));
    }
  }
}
