import 'package:note_app/common_libs.dart';
import 'package:note_app/core/components/custom_text_button.dart';
import 'package:note_app/core/components/default_button.dart';
import 'package:note_app/core/init/routes/app_router.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';
import 'package:note_app/features/forgot_password/cubit/forgot_password_cubit.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _asnwerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.i_forgot_my_password),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: context.lowHorPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
                xController: _usernameController,
                hintText: AppLocalizations.of(context)!.username,
                icon: const Icon(Icons.person)),
            const CustomSpacer(),
            CustomTextField(
                xController: _asnwerController,
                hintText: AppLocalizations.of(context)!.answer,
                icon: const Icon(Icons.question_answer)),
            const CustomSpacer(),
            CustomTextField(
                xController: _passwordController,
                hintText: AppLocalizations.of(context)!.new_password,
                icon: const Icon(Icons.lock)),
            const CustomSpacer2(),
            BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
              listener: (context, state) {
                if (state is ForgotPasswordSuccess) {
                  EasyLoading.showSuccess((AppLocalizations.of(context)!
                      .password_successfully_changed));
                  context.router.replace(const LoginRoute());
                } else if (state is ForgotPasswordError) {
                  EasyLoading.showError(
                      'Failed: ${state.message}\r\nStatus Code: ${state.statusCode}');
                }
              },
              builder: (context, state) {
                if (state is ForgotPasswordLoading) {
                  return spinKit;
                } else {
                  return customButton(context);
                }
              },
            ),
            const CustomSpacer2(),
            CustomTextButton(
                onpressed: (() =>
                    context.router.push(const ForgotQuestionRoute())),
                text: AppLocalizations.of(context)!.i_forgot_my_question),
          ],
        ),
      ),
    );
  }

  DefaultButton customButton(BuildContext context) => DefaultButton(
        color: ColorManager.mainTheme,
        fullWidthButton: true,
        text: AppLocalizations.of(context)!.change_password,
        onPressed: (() => context.read<ForgotPasswordCubit>().forgotPassword(
            username: _usernameController.text,
            password: _passwordController.text,
            answer: _asnwerController.text)),
      );

  SpinKitFadingCircle get spinKit => SpinKitFadingCircle(
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: index.isEven ? Colors.white : Colors.black12,
            ),
          );
        },
      );
}
