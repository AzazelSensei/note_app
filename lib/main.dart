import 'package:note_app/common_libs.dart';
import 'package:note_app/features/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:note_app/features/forgot_question/cubit/forgot_question_cubit_cubit.dart';

import 'core/init/routes/app_router.dart';
import 'features/main_page/cubit/task_delete_cubit/task_delete_cubit.dart';
import 'features/main_page/cubit/task_update_cubit/task_update_cubit.dart';
import 'features/search/search_cubit/search_cubit.dart';

void main() {
  final noteRepository =
      NoteRepository(Dio(BaseOptions(baseUrl: EndPoint.baseUrl)));

  runApp(MyApp(noteRepository: noteRepository));
}

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
          create: (context) => LoginCubit(widget.noteRepository),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(widget.noteRepository),
        ),
        BlocProvider<TaskPostCubit>(
          create: (context) => TaskPostCubit(widget.noteRepository),
        ),
        BlocProvider<TaskGetCubit>(
          create: (context) => TaskGetCubit(widget.noteRepository),
        ),
        BlocProvider<TaskDeleteCubit>(
          create: (context) => TaskDeleteCubit(widget.noteRepository),
        ),
        BlocProvider<TaskUpdateCubit>(
          create: (context) => TaskUpdateCubit(widget.noteRepository),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(widget.noteRepository),
        ),
        BlocProvider<ForgotPasswordCubit>(
          create: (context) => ForgotPasswordCubit(widget.noteRepository),
        ),
        BlocProvider<ForgotQuestionCubit>(
          create: (context) => ForgotQuestionCubit(widget.noteRepository),
        ),
      ],
      child: DynamicTheme(
        builder: (context, themeData) => MaterialApp.router(
          routerDelegate: _appRouter.delegate(),
          routeInformationParser: _appRouter.defaultRouteParser(),
          locale: _locale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          builder: EasyLoading.init(),
          title: 'Private Notes',
          debugShowCheckedModeBanner: false,
          theme: themeData,
        ),
        themeCollection: ThemeCollection(
          themes: {
            0: ThemeManager.darkTheme,
          },
        ),
      ),
    );
  }
}
