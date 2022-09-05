import 'package:note_app/common_libs.dart';

import 'features/main_page/cubit/task_delete_cubit/task_delete_cubit.dart';

void main() {
  final noteRepository =
      NoteRepository(Dio(BaseOptions(baseUrl: EndPoint.baseUrl)));
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
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(noteRepository),
        ),
        BlocProvider<TaskPostCubit>(
          create: (context) => TaskPostCubit(noteRepository),
        ),
        BlocProvider<TaskGetCubit>(
          create: (context) => TaskGetCubit(noteRepository),
        ),
        BlocProvider<TaskDeleteCubit>(
          create: (context) => TaskDeleteCubit(noteRepository),
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
