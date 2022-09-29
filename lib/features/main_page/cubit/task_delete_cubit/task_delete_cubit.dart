import 'package:note_app/common_libs.dart';

part 'task_delete_state.dart';

class TaskDeleteCubit extends Cubit<TaskDeleteState> {
  TaskDeleteCubit(this.noteRepository) : super(TaskDeleteInitial());

  final NoteRepository noteRepository;

  Future<void> taskDelete({
    required int id,
  }) async {
    emit(TaskDeleteLoading());

    try {
      final response = await noteRepository.taskDelete(id: id);
      emit(TaskDeleteSuccess(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(TaskDeleteError(
        statusCode: e.response!.statusCode.toString(),
      ));
    } catch (e) {
      emit(TaskDeleteError(
        statusCode: e.toString(),
      ));
    }
  }
}
