import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class TextGradient extends StatelessWidget {
  const TextGradient(
      {Key? key, required this.textHere, required this.textStyle})
      : super(key: key);

  final String textHere;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffFF6B17), Color(0xffFF473A)],
      ).createShader(rect),
      child: Text(
        textHere,
        style: textStyle,
      ),
    );
  }
}

class TextGradientPage extends StatefulWidget {
  @override
  _FlipCardPageState createState() => _FlipCardPageState();

  final String widgetName;
  final String contributorName;
  const TextGradientPage({Key? key, required this.contributorName, required this.widgetName})
      : super(key: key);
}

class _FlipCardPageState extends State<TextGradientPage> {
  String code = "";

  fetchAlgoFromFile() async {
    String algorithm;
    algorithm =
    await rootBundle.loadString("assets/files/flip_card@palak.txt");

    setState(() {
      code = algorithm;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAlgoFromFile();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kMediumBlueColor,
        title: Text(
          widget.widgetName,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TextGradient(
            textHere: "Hello Hacktoberfest",
            textStyle: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
          TextGradient(
            textHere:
            "Hacktoberfest encourages participation in the open source community, which grows bigger every year.",
            textStyle: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}


