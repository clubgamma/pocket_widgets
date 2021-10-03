/*
  Created by Maxwell Walters (warpaltarpers)
  A round button with a design based on the recent design principle "neumorphism"
  Currently only supports a "top left to bottom right" light pattern
*/

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

/// Changes hex code provided in Color [c] to String.
String _colorToString(Color c) {
  String colorString = c.toString();
  String valueString = colorString.substring(10, colorString.length - 1);
  return valueString;
}

/// Generate lighter or darker color based on luminance.
///
/// Transcribed to Dart from a JS article by Craig Buckler.
/// https://bit.ly/2PKV1nE
Color _colorLuminance(String hex, double lum) {
  /// Extends length of [hex] if length is less than 6 characters.
  if (hex.length < 6) {
    hex = hex[0] + hex[0] + hex[1] + hex[1] + hex[2] + hex[2];
  }

  /// Converts [hex] to decimal format and change luminosity.
  var rgb = "", i;
  for (i = 0; i < 3; i++) {
    String x = hex.substring(i * 2, (i * 2) + 2);
    var c = int.parse(x, radix: 16);
    double a = c + (c * lum);
    double y = min(max(0, a), 255);
    x = y.round().toRadixString(16);
    rgb += ("00" + x).substring(x.length);
  }

  /// Returns results as a Color object.
  return Color(int.parse(rgb.substring(0, rgb.length), radix: 16) + 0xFF000000);
}

/// Changes luminosity of Color [a].
Color _changeLuminosity(Color a, double lum) {
  String x = _colorToString(a);
  return _colorLuminance(x, lum);
}

/// Changes [num] to negative.
double _negativeConvert(double num) {
  return num - (num * 2);
}

/// A circular button stylized in the design of neumorphism.
///
/// In its current state, the only light and shadow pattern that the widget uses is from the Top Left to the Bottom Right.
class NeumorphicRoundButton extends StatefulWidget {
  const NeumorphicRoundButton(
      {Key? key,
      required this.mainColor,
      this.size = 100.0,
      this.distance = 20.0,
      this.intensity = 0.15,
      this.blur = 60.0,
      required this.onTap,
      required this.onRelease,
      required this.icon})
      : super(key: key);

  final Color mainColor;
  final Icon icon;
  final double size;
  final double distance;
  final double intensity;
  final double blur;
  final Function onTap;
  final Function onRelease;

  @override
  _NeumorphicRoundButtonState createState() => _NeumorphicRoundButtonState();
}

class _NeumorphicRoundButtonState extends State<NeumorphicRoundButton> {
  Color grad1 = Color(0xFFfff);
  Color grad2 = Color(0xFFfff);
  Color shadow1 = Color(0xFFfff);
  Color shadow2 = Color(0xFFfff);
  Color topLeftColor = Color(0xFFfff);
  Color bottomRightColor = Color(0xFFfff);

  void _updateColor(bool pressed) {
    if (pressed) {
      if (topLeftColor == grad1) {
        topLeftColor = grad2;
        bottomRightColor = grad1;
      }
    } else if (!pressed) {
      if (topLeftColor == grad2) {
        topLeftColor = grad1;
        bottomRightColor = grad2;
      }
    } else {
      topLeftColor = grad1;
      bottomRightColor = grad2;
    }
  }

  @override
  void initState() {
    super.initState();
    grad1 = _changeLuminosity(widget.mainColor, 0.175);
    grad2 = _changeLuminosity(widget.mainColor, -0.25);
    shadow1 = _changeLuminosity(widget.mainColor, widget.intensity);
    shadow2 =
        _changeLuminosity(widget.mainColor, _negativeConvert(widget.intensity));
    bottomRightColor = grad2;
    topLeftColor = grad1;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        widget.onTap();
        setState(() {
          _updateColor(true);
        });
      },
      onTapUp: (_) {
        widget.onRelease();
        setState(() {
          _updateColor(false);
        });
      },
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [topLeftColor, bottomRightColor]),
            boxShadow: [
              BoxShadow(
                  color: shadow1,
                  offset: Offset(_negativeConvert(widget.distance),
                      _negativeConvert(widget.distance)),
                  blurRadius: widget.blur),
              BoxShadow(
                  color: shadow2,
                  offset: Offset(widget.distance, widget.distance),
                  blurRadius: widget.blur)
            ]),
        child: widget.icon,
      ),
    );
  }
}

class Warpaltarpers extends StatefulWidget {
  const Warpaltarpers(
      {Key? key, required this.contributorName, required this.widgetName})
      : super(key: key);

  @override
  _WarpaltarpersState createState() => _WarpaltarpersState();

  final String widgetName;
  final String contributorName;
}

class _WarpaltarpersState extends State<Warpaltarpers> {
  String code = "";

  fetchAlgoFromFile() async {
    String algorithm;
    algorithm = await rootBundle
        .loadString("assets/files/neumorphic_round_button@warpaltarpers.txt");

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
        title: Text(
          widget.widgetName,
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: NeumorphicRoundButton(
              mainColor: kLightBlueColor,
              onTap: () => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Come find me at github.com/warpaltarpers!')))
              },
              onRelease: () => {null},
              icon: Icon(Icons.sentiment_very_satisfied),
              size: 75.0,
              distance: 5.0,
              intensity: 10.0,
              blur: 17.5,
            ),
          ),
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
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
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
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              color: kMediumBlueColor,
              child: const Text(
                "COPY CODE",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
