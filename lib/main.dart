// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/features/login/view/login_view.dart';
import 'package:note_app/network/endpoint.dart';
import 'core/init/theme/theme_manager.dart';
import 'features/login/cubit/cubit/login_cubit.dart';
import 'network/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:dynamic_themes/dynamic_themes.dart';

void main() {
  final noteRepository =
      NoteRepository(dio: Dio(BaseOptions(baseUrl: EndPoint.baseUrl)));
  runApp(MyApp(noteRepository: noteRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.noteRepository}) : super(key: key);
  final NoteRepository noteRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(noteRepository),
        ),
      ],
      child: DynamicTheme(
        builder: (context, themeData) => MaterialApp(
          title: 'Private Notes',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: LoginView(noteRepository: noteRepository),
        ),
        themeCollection: ThemeCollection(
          themes: {
            1: ThemeManager.theme,
            0: ThemeManager.darkTheme,
          },
        ),
      ),
    );
  }
}
