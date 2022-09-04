// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:note_app/features/login/model/search_model.dart';

import '../../../../network/repository.dart';
part 'task_get_state.dart';

class TaskGetCubit extends Cubit<TaskGetState> {
  final NoteRepository noteRepository;

  TaskGetCubit(this.noteRepository) : super(TeskGetInitial());

  Future<void> taskGet({required String token}) async {
    emit(TaskGetLoading());

    try {
      if (token.isEmpty) {
        throw 'Kritik Hata';
      } else if (token.isNotEmpty) {
        final response = await noteRepository.taskget(token: token);
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
