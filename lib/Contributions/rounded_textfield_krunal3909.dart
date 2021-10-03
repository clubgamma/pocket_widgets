import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class RoundedTextField extends StatefulWidget {
  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();

  final String widgetName;
  final String contributorName;
  RoundedTextField({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);
}

class _RoundedTextFieldState extends State<RoundedTextField> {

  String code = "";

  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/rounded_textfield@krunal3909.txt");

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
              letterSpacing: 1.0
          ),
        ),
      ),
      body: ListView(
        children: [

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(50.0)),
                color: Colors.grey[900]?.withOpacity(0.7)
            ),
            child: TextField(
                obscureText: true,
                onChanged: (value){},
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    prefixIcon:const Icon(
                      Icons.lock_outline,
                      color: Colors.white,
                      size: 27.0,
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 17.0
                    )
                )
            ),
          ),

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
