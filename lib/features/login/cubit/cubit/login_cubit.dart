// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../network/repository.dart';
import 'package:dio/dio.dart';
import 'package:note_app/common_libs.dart';

import '../../../../core/utils/secure_storage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.noteRepository) : super(LoginInitial());

  final NoteRepository noteRepository;
  final TokenSecureStorage storage = TokenSecureStorage();

  Future<void> login(
      {required String username, required String password}) async {
    emit(LoginLoading());

    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Kullanıcı Adı veya Şifre Boş Olamaz';
      } else if (username.isNotEmpty) {
        final response = await noteRepository.login(username, password);
      }
      final response = await noteRepository.login(username, password);

      //Token adında değişken oluşturuldu
      final token = response.message;
      if (token != null) {
        await storage.saveToken(token);
      }

      emit(LoginSuccess(
          message: response.message, statusCode: response.statusCode));
    } on DioError catch (e) {
      emit(
        LoginError(
          message: e.response != null
              ? e.response!.statusMessage!.toString()
              : 'Dio Error',
          statusCode:
              e.response != null ? e.response!.statusCode!.toString() : '',
        ),
      );
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
