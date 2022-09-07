import '../../../../common_libs.dart';

part 'task_update_state.dart';

class TaskUpdateCubit extends Cubit<TaskUpdateState> {
  TaskUpdateCubit(this.noteRepository) : super(TaskUpdateInitial());

  final NoteRepository noteRepository;

  Future<void> taskPost({
    required String token,
    required String name,
    required int id,
    required String body,
  }) async {
    emit(TaskUpdateLoading());

    try {
      if (token.isEmpty) {
        throw 'Kritik Hata';
      }
      final response = await noteRepository.taskUpdate(
          token: token, id: id, body: body, name: name);

      emit(TaskUpdateSuccess(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(TaskUpdateError(
        e.response!.statusMessage,
      ));
    } catch (e) {
      emit(TaskUpdateError(
        e.toString(),
      ));
    }
  }
}
