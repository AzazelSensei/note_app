// ignore_for_file: depend_on_referenced_packages, avoid_print, unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/network/repository.dart';
import 'package:dio/dio.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.noteRepository) : super(RegisterInitial());

  final NoteRepository noteRepository;

  Future<void> register(
      {required String username, required String password}) async {
    emit(RegisterLoading());

    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Kullanıcı Adı veya Şifre Boş Olamaz';
      } else if (username.isNotEmpty) {
        final response = await noteRepository.register(username, password);
      }
      final response = await noteRepository.register(username, password);
      emit(RegisterSuccess(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(
        RegisterError(
          e.response != null
              ? e.response!.statusMessage!.toString()
              : 'Dio Error',
          e.response != null ? e.response!.statusCode!.toString() : '',
        ),
      );
      print(e.toString());
    } catch (e) {
      print(e.toString());
    }
  }
}
