import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:note_app/features/login/view/login_view.dart';
import 'package:note_app/features/onboard/onboard_view.dart';
import 'package:note_app/features/register/view/register_view.dart';
import 'package:note_app/features/search/view/search_view.dart';
import 'package:note_app/features/main_page/view/task_get_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, path: 'login'),
    AutoRoute(page: OnBoardView, path: 'onboard', initial: true),
    AutoRoute(page: RegisterView, path: 'register'),
    AutoRoute(page: SearchView, path: 'search'),
    AutoRoute(page: TaskGetView, path: 'home')
  ],
)
class AppRouter extends _$AppRouter {}
