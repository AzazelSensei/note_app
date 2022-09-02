

// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'task_get_state.dart';

class TaskNSearchCubit extends Cubit<TaskNSearchState> {
  TaskNSearchCubit() : super(TaskNSearchInitial());
}
