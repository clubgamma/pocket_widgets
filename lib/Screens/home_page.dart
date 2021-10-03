import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/position/gf_position.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:widgets_book/Constants/color.dart';

class Popup extends StatefulWidget {
  @override
  _PopupState createState() => _PopupState();

  final String widgetName;
  final String contributorName;
  Popup({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);
}

class _PopupState extends State<Popup> {

  String code = "";

  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/popup_krunal3909.txt");

    setState(() {
      code = algorithm;
    });

    _forgottenPassword();
  }

  _forgottenPassword(){
    Alert(
        context: context,
        title: "Forgotten Password",
        content: Column(
          children: <Widget>[
            Text(
              "We will send You the Password Reset Link on the entered E-mail",
              style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  fontSize: 13.5
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (value){},
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Color(0XFFA4AAEE),
                  ),
                  hintText: "E-mail",
                  hintStyle: TextStyle(
                      color: Colors.grey[500]
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: (){},
            child: const Text(
              "SEND",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
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
              letterSpacing: 1.0
          ),
        ),
      ),
      body: ListView(
        children: [

          const SizedBox(height: 10.0,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  color: kLightBlueColor
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Text(
                  code,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: MaterialButton(
              onPressed: (){
                Clipboard.setData(ClipboardData(text: code));

                SnackBar snackBar = const SnackBar(
                    content: Text(
                        "Copied!"
                    )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
              color: kMediumBlueColor,
              child: const Text(
                "COPY CODE",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
