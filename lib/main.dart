import 'package:note_app/common_libs.dart';

import 'features/main_page/cubit/task_delete_cubit/task_delete_cubit.dart';
import 'features/main_page/cubit/task_update_cubit/task_update_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  final noteRepository =
      NoteRepository(Dio(BaseOptions(baseUrl: EndPoint.baseUrl)));

  runApp(MyApp(noteRepository: noteRepository));
}

class MyApp extends StatelessWidget {
class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.noteRepository}) : super(key: key);
  final NoteRepository noteRepository;

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  final _appRouter = AppRouter();

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

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
        BlocProvider<TaskUpdateCubit>(
          create: (context) => TaskUpdateCubit(noteRepository),
        ),
      ],
      child: DynamicTheme(
        builder: (context, themeData) => MaterialApp(
          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: EasyLoading.init(),
          title: 'Private Notes',
          debugShowCheckedModeBanner: false,
          theme: themeData,
          home: const LoginView(),
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
