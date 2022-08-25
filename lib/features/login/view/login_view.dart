// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:note_app/core/extension/ui_extension.dart';
import 'package:note_app/core/init/theme/theme_manager.dart';
import 'package:note_app/features/login/cubit/cubit/login_cubit.dart';
import 'package:note_app/network/repository.dart';

import '../widget/mode_switcher.dart';

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
    return RepositoryProvider(
      create: (context) => LoginCubit(widget.noteRepository),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Private Notes'),
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
              SizedBox(
                height: context.normalWidth * 0.6,
                child: Image(image: AssetImage('assets/priv_notes_logo.png')),
              ),
              SizedBox(height: context.normalWidth * 0.1),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Username',
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: context.normalWidth * 0.1),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _passwordController,
                obscureText: !isVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(),
                child: Text('Login'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
