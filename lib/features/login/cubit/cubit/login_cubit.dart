import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../network/repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.noteRepository) : super(LoginInitial());

  final NoteRepository noteRepository;

  Future<void> login(String username, String password ) async {
    emit(LoginLoading());

    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Geçersiz Kullanıcı Adı veya Şifre';
      }
      emit(LoginLoading());
    
      final response = await noteRepository.login(username, password);
      emit(LoginSuccess(
          message: response.message, statusCode: response.statusCode));
    } catch (e) {
      emit(LoginError(message: e.toString(), statusCode: e.toString()));
    }
  }
}
