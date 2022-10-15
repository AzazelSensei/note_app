import '../../../common_libs.dart';

part 'forgot_question_cubit_state.dart';

class ForgotQuestionCubit extends Cubit<ForgotQuestionState> {
  ForgotQuestionCubit(this.noteRepository)
      : super(ForgotQuestionCubitInitial());

  final NoteRepository noteRepository;

  Future<void> forgotQuestion({
    required String username,
  }) async {
    emit(ForgotQuestionLoading());

    try {
      if (username.isEmpty) {
        throw 'Hiç Bir Alan Boş Bırakılamaz!';
      } else {
        final response = await noteRepository.forgotQuestion(username);
        emit(ForgotQuestionSuccess(
          message: response.message,
          statusCode: response.statusCode,
        ));
      }
    } on DioError catch (e) {
      emit(
        ForgotQuestionError(
          message: e.response != null
              ? e.response!.statusMessage!.toString()
              : 'Dio Error',
          statusCode:
              e.response != null ? e.response!.statusCode!.toString() : '',
        ),
      );
    } catch (e) {
      emit(ForgotQuestionError(
        statusCode: e.toString(),
        message: e.toString(),
      ));
    }
  }
}
