import 'package:note_app/common_libs.dart';
import 'package:note_app/core/init/network/domain/network_model.dart';

abstract class NetworkService {
  Future<R> dioGet<T extends NetworkModel, R>(
    String endpoint, {
    Map<String, dynamic>? query,
    required T networkModel,
  });

  Future<R> dioPost<T extends NetworkModel, R>(
    String endpoint, {
    Map<String, dynamic>? query,
    required T networkModel,
    dynamic body,
  });

  Interceptor get dioIntercepters;
}
