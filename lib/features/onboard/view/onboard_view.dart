import 'package:note_app/common_libs.dart';
import 'package:note_app/core/init/theme/colors_manager.dart';
import 'package:note_app/features/onboard/widget/onboard_item_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardViewState createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.router.pop(),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.7,
              child: PageView(
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) =>
                    setState(() => _currentPage = page),
                children: <Widget>[
                  OnBoardItem(
                      firstText:
                          AppLocalizations.of(context)!.onboard_main_text1,
                      secondText: AppLocalizations.of(context)!.onboard_text1,
                      imagePath: 'assets/onboard_images/onboarding0.png'),
                  OnBoardItem(
                      imagePath: 'assets/onboard_images/onboarding1.png',
                      firstText:
                          AppLocalizations.of(context)!.onboard_main_text2,
                      secondText: AppLocalizations.of(context)!.onboard_text2),
                  OnBoardItem(
                      imagePath: 'assets/onboard_images/onboarding2.png',
                      firstText:
                          AppLocalizations.of(context)!.onboard_main_text3,
                      secondText: AppLocalizations.of(context)!.onboard_text3),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),
            ),
            const CustomSpacer(),
            if (_currentPage == _numPages - 1)
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => context.router.pop(),
                    child: const Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(
                          color: ColorManager.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : const Color(0xFF7B51D3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
