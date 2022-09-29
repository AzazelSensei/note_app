import 'package:note_app/common_libs.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.noteRepository) : super(SearchInitial());

  final NoteRepository noteRepository;

  Future<void> search({
    required String name,
  }) async {
    emit(SearchLoading());

    try {
      final response = await noteRepository.search(name: name);
      emit(SearchLoaded(response.message, response.statusCode));
    } on DioError catch (e) {
      emit(SearchError(statusCode: e.response?.statusCode.toString()));
    } catch (e) {
      emit(SearchError(
        statusCode: e.toString(),
      ));
    }
  }
}
