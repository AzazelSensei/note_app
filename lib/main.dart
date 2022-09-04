import 'package:note_app/common_libs.dart';

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
      ],
      child: DynamicTheme(
        builder: (context, themeData) => MaterialApp(
          title: 'Private Notes',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: LoginView(
            noteRepository: noteRepository
          ),
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
