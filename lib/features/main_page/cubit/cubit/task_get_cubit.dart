import 'package:note_app/common_libs.dart';

part 'task_get_state.dart';

class TaskGetCubit extends Cubit<TaskGetState> {
  final NoteRepository noteRepository;

  TaskGetCubit(this.noteRepository) : super(TeskGetInitial());

  Future<void> taskGet({required String token}) async {
    emit(TaskGetLoading());

    try {
      if (token.isEmpty) {
        throw 'Kritik Hata';
      }
      final response = await noteRepository.taskget(token: token);
      emit(TaskGetSuccess(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(TaskGetError(
        statusCode: e.response!.statusCode.toString(),
      ));
    } catch (e) {
      emit(TaskGetError(
        statusCode: e.toString(),
      ));
    }
  }
}
