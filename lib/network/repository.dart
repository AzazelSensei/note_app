import 'package:note_app/common_libs.dart';
import 'package:note_app/features/login/model/login_model.dart';
import 'package:note_app/features/register/model/register_model.dart';

class NoteRepository {
  final Dio _dio;

  NoteRepository(this._dio);

  Future<LoginModelPost> login(String username, String password) async {
    final response = await _dio.post(EndPoint.login, data: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == 200) {
      return LoginModelPost.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  //durdur
  Future<RegisterModelPost> register(String username, String password) async {
    final response = await _dio.post(EndPoint.register, data: {
      'username': username,
      'password': password,
    });
    return RegisterModelPost.fromJson(response.data);
  }

  Future<SearchResult> search({required String token, String name = ''}) async {
    final response = await _dio.get(
      EndPoint.getSearch,
      queryParameters: {
        'name': name,
      },
      options: Options(
        headers: {
          'TaskManagerKey': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<SearchResult> taskget({required String token}) async {
    final response = await _dio.get(
      EndPoint.getTasks,
      options: Options(
        headers: {
          'TaskManagerKey': token,
        },
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }
}
