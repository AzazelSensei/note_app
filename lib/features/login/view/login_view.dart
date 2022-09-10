// ignore_for_file: must_call_super

import 'dart:async';

import 'package:note_app/common_libs.dart';
import 'package:note_app/core/components/default_button.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    isVisible = false;
    EasyLoading.addStatusCallback((status) {
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    EasyLoading.showSuccess('Use in initState');
    // EasyLoading.removeCallbacks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Private Notes Login"),
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
            const CustomLogo(),
            const CustomSpacer(),
            CustomTextField(
              xController: _usernameController,
              hintText: 'Username',
              icon: const Icon(Icons.person, color: Colors.white),
            ),
            const CustomSpacer(),
            passwordField(context),
            registerTextButton(context),
            const CustomSpacer2(),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  EasyLoading.showSuccess('Login Success!');
                  // toastMessage(
                  //   mess: 'Hoş Geldiniz!',
                  //   toastType: ToastType.success,
                  // );
                } else if (state is LoginError) {
                  EasyLoading.showError(
                      'Failed: ${state.message}\r\nStatus Code: ${state.statusCode}');

                  // toastMessage(
                  //   mess: 'Hata: ${state.message},${state.statusCode}',
                  //   toastType: ToastType.error,
                  // );
                }
              },
              builder: (context, state) => loginButton,
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskGetView(
                        token: state.message!,
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }

  TextButton registerTextButton(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegisterView()));
          _timer?.cancel();
        },
        child: const Text(
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
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(15.0),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        hintText: 'Password',
        prefixIcon: const Icon(Icons.lock, color: Colors.white),
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

  Widget get loginButton => DefaultButton(
        onPressed: () {
          context.read<LoginCubit>().login(
              username: _usernameController.text,
              password: _passwordController.text);
        },
        text: "Sign In",
        color: const Color(0xFF937DC2),
      );
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: const Text('Private Notes Login'),
      actions: [
        Padding(
          padding: context.right,
          child: const ModeSwitcher(),
        )
      ],
    );
  }
}
