// ignore_for_file: unused_local_variable

import 'package:note_app/core/utils/secure_storage.dart';

import '../../../common_libs.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.noteRepository) : super(ForgotPasswordInitial());

  final NoteRepository noteRepository;
  final TokenSecureStorage storage = TokenSecureStorage();

  Future<void> forgotPassword(
      {required String username,
      required String answer,
      required String password}) async {
    emit(ForgotPasswordLoading());

    try {
      if (username.isEmpty || password.isEmpty || answer.isEmpty) {
        throw 'Hiç Bir Alan Boş Bırakılamaz!';
      } else if (answer.isNotEmpty) {
        final response =
            await noteRepository.forgotPassword(username, answer, password);
        emit(ForgotPasswordSuccess(
          message: response.message,
          statusCode: response.statusCode,
        ));
      }
    } on DioError catch (e) {
      emit(
        ForgotPasswordError(
          message: e.response != null
              ? e.response!.statusMessage!.toString()
              : 'Dio Error',
          statusCode:
              e.response != null ? e.response!.statusCode!.toString() : '',
        ),
      );
    } catch (e) {
      emit(ForgotPasswordError(
        statusCode: e.toString(),
      ));
    }
  }
}
