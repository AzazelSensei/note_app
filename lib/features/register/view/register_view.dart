// ignore_for_file: depend_on_referenced_packages, unused_field

import 'package:flutter/material.dart';
import 'package:note_app/core/extension/ui_extension.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/login/view/login_view.dart';

import '../../../core/utils/toast.dart';
import '../../../network/repository.dart';
import '../../login/widget/custom_logo.dart';
import '../../login/widget/custom_spacer.dart';
import '../../login/widget/custom_spacer2.dart';
import '../../login/widget/custom_textfield.dart';
import '../../login/widget/mode_switcher.dart';
import '../cubit/cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(widget.noteRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            "Register",
          ),
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
                  hintText: "Username",
                  icon: const Icon(Icons.person, color: Colors.white)),
              const CustomSpacer(),
              CustomTextField(
                  xController: _passwordController,
                  hintText: "Username",
                  icon: const Icon(Icons.lock, color: Colors.white)),
              const CustomSpacer2(),
              toastMessageNRoute(),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<RegisterCubit, RegisterState> toastMessageNRoute() {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          toastMessage(
            mess: 'Kaydınız Başarı İle Oluşturuldu!',
            toastType: ToastType.success,
          );
        } else if (state is RegisterSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginView()));
          toastMessage(
            mess: 'Hata: ${state.message}, Hata Kodu:${state.statusCode}',
            toastType: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        return registerButton(context);
      },
    );
  }

  Widget registerButton(BuildContext context) {
    return GFButton(
        borderShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          context.read<RegisterCubit>().register(
              username: _usernameController.text,
              password: _passwordController.text);
        },
        text: "Register",
        textStyle: const TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
            fontWeight: FontWeight.bold),
        size: 65,
        fullWidthButton: true,
        color: const Color(0xFF937DC2));
  }
}
