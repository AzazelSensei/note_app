import 'package:note_app/common_libs.dart';

part 'task_get_state.dart';

class TaskGetCubit extends Cubit<TaskGetState> {
  final NoteRepository noteRepository;

  TaskGetCubit(this.noteRepository) : super(TeskGetInitial());

  Future<void> taskGet() async {
    emit(TaskGetLoading());
    emit(TaskGetLoaded());
    try {
      final response = await noteRepository.taskget();
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
