// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable, unrelated_type_equality_checks

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/network/repository.dart';
import 'package:dio/dio.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.noteRepository) : super(RegisterInitial());

  final NoteRepository noteRepository;

  Future<void> register(
      {required String username, required String password, required String answer, required String question}) async {
    emit(RegisterLoading());

    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Kullanıcı Adı veya Şifre Boş Olamaz';
      } else if (username.isNotEmpty) {
        final response =
            await noteRepository.register(username, password, question, answer);
      }
      final response =
          await noteRepository.register(username, password, question, answer);
      if (response.statusCode == 200) {
        emit(RegisterSuccess(response.message, response.statusCode));
      } else if (response.statusCode == 400) {
        emit(RegisterError(
            response.message = "User already exist", response.statusCode));
      } else {
        emit(RegisterError(response.message, response.statusCode));
      }
    } on DioError catch (e) {
      emit(
        RegisterError(
          e.response != null
              ? e.response!.statusMessage!.toString()
              : 'Dio Error',
          e.response != null ? e.response!.statusCode!.toString() : '',
        ),
      );
    }
  }
}
