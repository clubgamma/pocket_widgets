// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';


class sidB67 extends StatefulWidget {
  const sidB67({ Key? key }) : super(key: key);

  @override
  State<sidB67> createState() => _sidB67State();
}

class _sidB67State extends State<sidB67> {
  String code = '';
  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/rating_widget@sidB67.txt");

    setState(() {
      code = algorithm;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAlgoFromFile();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kMediumBlueColor,
        title: const Text(
          'Rating Widget',
          style:  TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0
          ),
        ),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 10.0,
        ),
        RateWidget(maximumRating: 5, ),
        const SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: kLightBlueColor),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                code,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: MaterialButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: code));

              SnackBar snackBar = const SnackBar(content: Text("Copied!"));
              // ignore: deprecated_member_use
              Scaffold.of(context).showSnackBar(snackBar);
            },
            color: kMediumBlueColor,
            child: const Text(
              "COPY CODE",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }
}


class RateWidget extends StatefulWidget {
  const RateWidget({
    this.maximumRating,
  });
  // ignore: prefer_typing_uninitialized_variables
  final maximumRating;

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  int _currentRating = 0;
  Widget _buildRatingStar(int index) {
    if (index < _currentRating) {
      return const Icon(
        Icons.star,
        color: Colors.orange,
      );
    } else {
      return const Icon(Icons.star_border_outlined);
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(widget.maximumRating, (index) {
      return _currentRating == 0
          ? GestureDetector(
              child: Container(child: _buildRatingStar(index)),
              onTap: () {
                setState(() {
                  _currentRating = index + 1;
                });
              },
            )
          : Container(child: _buildRatingStar(index));
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: stars,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
