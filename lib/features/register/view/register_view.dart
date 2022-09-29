import 'package:note_app/common_libs.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({
    super.key,
  });

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _closeKeyboard() => FocusScope.of(context).unfocus();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _closeKeyboard(),
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
                  icon: const Icon(Icons.person)),
              const CustomSpacer(),
              CustomTextField(
                  xController: _passwordController,
                  hintText: "Password",
                  icon: const Icon(Icons.lock)),
              const CustomSpacer2(),
              BlocConsumer<RegisterCubit, RegisterState>(
                listener: (context, state) async {
                  if (state is RegisterSuccess) {
                    EasyLoading.showSuccess('Registeration Success!');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                  } else if (state is RegisterError) {
                    EasyLoading.showSuccess('Registeration Success!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginView(),
                      ),
                    );
                    // ignore: todo
                    //TODO: Bug: Her zaman 401 hata kodu ile dönüyor.
                    // EasyLoading.showError(
                    //     'Failed: ${state.message}\r\nStatus Code: ${state.statusCode}');
                  } else {
                    return;
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoading) {
                    return spinkit;
                  } else {
                    return registerButton(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : Colors.black12,
        ),
      );
    },
  );

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
