import 'package:note_app/common_libs.dart';
import 'package:note_app/features/forgot_password/model/forgot_password_model.dart';
import 'package:note_app/features/forgot_question/model/fotgot_question_model.dart';
import 'package:note_app/features/login/model/login_model.dart';
import 'package:note_app/features/register/model/register_model.dart';

import '../core/utils/secure_storage.dart';

class NoteRepository {
  final Dio _dio;
  final storage = TokenSecureStorage();

  NoteRepository(this._dio);

  Future<Map<String, dynamic>?> get headers async {
    final token = await storage.getToken;
    if (token != null) {
      return {
        'TaskManagerKey': token,
      };
    } else {
      return null;
    }
  }

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

  Future<RegisterModelPost> register(
      String username, String password, String question, String answer) async {
    final response = await _dio.post(EndPoint.register, data: {
      'username': username,
      'password': password,
      'question': question,
      'answer': answer,
    });
    return RegisterModelPost.fromJson(response.data);
  }

  Future<SearchResult> search({required String name}) async {
    final response = await _dio.get(
      EndPoint.getSearch,
      queryParameters: {
        'name': name,
      },
      options: Options(
        headers: await headers,
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<SearchResult> taskget() async {
    final response = await _dio.get(
      EndPoint.getTasks,
      options: Options(
        headers: await headers,
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<SearchResult> taskPost(
      {required String name, required String body}) async {
    final response = await _dio.post(
      EndPoint.getTasks,
      data: {
        'name': name,
        'body': body,
      },
      options: Options(
        headers: await headers,
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<GetQuestion> forgotQuestion(String username) async {
    final response = await _dio.get(
      EndPoint.answer,
      queryParameters: {
        'username': username,
      },
    );

    if (response.statusCode == 200) {
      return GetQuestion.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<ForgotPassword> forgotPassword(
      String username, String answer, String password) async {
    final response = await _dio.post(
      EndPoint.updatePass,
      data: {
        'username': username,
        'answer': answer,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return ForgotPassword.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<SearchResult> taskDelete({required int id}) async {
    final response = await _dio.delete(
      EndPoint.getTasks,
      data: {
        'id': id,
      },
      options: Options(
        headers: await headers,
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }

  Future<SearchResult> taskUpdate(
      {required int id, required String name, required String body}) async {
    final response = await _dio.patch(
      EndPoint.getTasks,
      data: {
        'name': name,
        'id': id,
        'body': body,
      },
      options: Options(
        headers: await headers,
      ),
    );

    if (response.statusCode == 200) {
      return SearchResult.fromJson(response.data);
    } else {
      throw response.statusMessage.toString();
    }
  }
}
