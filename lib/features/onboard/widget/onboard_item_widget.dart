import '../../../common_libs.dart';

class OnBoardItem extends StatelessWidget {
  const OnBoardItem({
    super.key,
    required this.imagePath,
    required this.firstText,
    required this.secondText,
  });

  final String imagePath;
  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.normalHorPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage(
              imagePath,
            ),
            height: 300.0,
            width: 300.0,
          ),
          const SizedBox(height: 30.0),
          Text(
            firstText,
            style: const TextStyle(fontSize: 30),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 25.0),
          Text(
            secondText,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
