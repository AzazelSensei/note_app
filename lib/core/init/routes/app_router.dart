import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:note_app/features/forgot_password/view/forgot_password_view.dart';
import 'package:note_app/features/forgot_question/view/forgot_question_view.dart';
import 'package:note_app/features/login/view/login_view.dart';
import 'package:note_app/features/onboard/view/onboard_view.dart';
import 'package:note_app/features/profile/view/profile_view.dart';
import 'package:note_app/features/register/view/register_view.dart';
import 'package:note_app/features/search/view/search_view.dart';
import 'package:note_app/features/main_page/view/task_get_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: OnBoardView, path: 'onboard'),
    AutoRoute(page: LoginView, path: 'login', initial: true),
    AutoRoute(page: RegisterView, path: 'register'),
    AutoRoute(page: SearchView, path: 'search'),
    AutoRoute(page: TaskGetView, path: 'home'),
    AutoRoute(page: ProfileView, path: 'profile'),
    AutoRoute(page: ForgotPasswordView, path: 'forgot-password'),
    AutoRoute(page: ForgotQuestionView, path: 'forgot-question'),
  ],
)
class AppRouter extends _$AppRouter {}
