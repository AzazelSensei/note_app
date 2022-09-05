import 'package:note_app/common_libs.dart';

part 'task_post_state.dart';

class TaskPostCubit extends Cubit<TaskPostState> {
  TaskPostCubit(this.noteRepository) : super(TeskPostInitial());
  final NoteRepository noteRepository;

  Future<void> taskPost({
    required String token,
    required String name,
    required String body,
  }) async {
    emit(TaskPostLoading());

    try {
      if (token.isEmpty) {
        throw 'Kritik Hata';
      }
      final response =
          await noteRepository.taskPost(token: token, body: body, name: name);

      emit(TaskPostSuccess(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(TaskPostError(
        statusCode: e.response!.statusCode.toString(),
      ));
    } catch (e) {
      emit(TaskPostError(
        statusCode: e.toString(),
      ));
    }
    
  }
}
