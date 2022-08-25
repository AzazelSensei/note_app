

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'task_n_search_state.dart';

class TaskNSearchCubit extends Cubit<TaskNSearchState> {
  TaskNSearchCubit() : super(TaskNSearchInitial());
}
