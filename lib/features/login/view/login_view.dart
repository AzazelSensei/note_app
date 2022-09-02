// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages, must_call_super

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/extension/ui_extension.dart';
import 'package:note_app/core/init/theme/theme_manager.dart';
import 'package:note_app/features/login/cubit/cubit/login_cubit.dart';
import 'package:note_app/features/register/view/register_view.dart';
import 'package:note_app/network/repository.dart';
import 'package:getwidget/getwidget.dart';

import '../../../core/utils/toast.dart';
import '../widget/custom_logo.dart';
import '../widget/custom_spacer.dart';
import '../widget/custom_spacer2.dart';
import '../widget/mode_switcher.dart';
import '../widget/custom_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key, required this.noteRepository}) : super(key: key);
  final NoteRepository noteRepository;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;

  @override
  void initState() {
    isVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(widget.noteRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Private Notes Login"),
          actions: [
            Padding(
              padding: context.right,
              child: const ModeSwitcher(),
            )
          ],
        ),
        body: Padding(
          padding: context.lowHorPadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomLogo(),
              CustomSpacer(),
              CustomTextField(
                xController: _usernameController,
                hintText: 'Username',
                icon: Icon(Icons.person, color: Colors.white),
              ),
              CustomSpacer(),
              passwordField(context),
              registerTextButton(context),
              CustomSpacer2(),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    toastMessage(
                      mess: 'Hoş Geldiniz!',
                      toastType: ToastType.success,
                    );
                  } else if (state is LoginError) {
                    toastMessage(
                      mess: 'Hata: ${state.message},${state.statusCode}',
                      toastType: ToastType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return loginButton(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton registerTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RegisterView(
                        noteRepository: widget.noteRepository,
                      )));
        },
        child: Text(
          "I Don't Have a Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ));
  }

  TextFormField passwordField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: _passwordController,
      obscureText: !isVisible,
      decoration: InputDecoration(
        // fillColor: Colors.white,
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Password',
        prefixIcon: Icon(Icons.lock, color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          },
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return GFButton(
        borderShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          context.read<LoginCubit>().login(
              username: _usernameController.text,
              password: _passwordController.text);
        },
        text: "Sign In",
        textStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.bold),
        size: 65,
        fullWidthButton: true,
        color: const Color(0xFF937DC2));
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Text('Private Notes Login'),
      actions: [
        Padding(
          padding: context.right,
          child: const ModeSwitcher(),
        )
      ],
    );
  }
}
