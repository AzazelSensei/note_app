import 'package:note_app/common_libs.dart';
import 'package:note_app/core/components/default_button.dart';
import 'package:note_app/core/init/routes/app_router.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';
import 'package:note_app/features/forgot_question/cubit/forgot_question_cubit_cubit.dart';

class ForgotQuestionView extends StatefulWidget {
  const ForgotQuestionView({super.key});

  @override
  State<ForgotQuestionView> createState() => _ForgotQuestionViewState();
}

class _ForgotQuestionViewState extends State<ForgotQuestionView> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.i_forgot_my_question),
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
            const CustomSpacer2(),
            BlocConsumer<ForgotQuestionCubit, ForgotQuestionState>(
              listener: (context, state) {
                if (state is ForgotQuestionSuccess) {
                  EasyLoading.showSuccess(
                      "${AppLocalizations.of(context)!.question}: ${state.message}");
                  context.router.replace(const ForgotPasswordRoute());
                } else if (state is ForgotQuestionError) {
                  EasyLoading.showError(
                      'Failed: ${state.message}\r\nStatus Code: ${state.statusCode}');
                }
              },
              builder: (context, state) {
                if (state is ForgotQuestionLoading) {
                  return spinKit;
                } else {
                  return customButton(context);
                }
              },
            ),
            const CustomSpacer2(),
          ],
        ),
      ),
    );
  }

  DefaultButton customButton(BuildContext context) => DefaultButton(
      color: ColorManager.mainTheme,
      fullWidthButton: true,
      text: AppLocalizations.of(context)!.show_question,
      onPressed: (() => context.read<ForgotQuestionCubit>().forgotQuestion(
            username: _usernameController.text,
          )));

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
