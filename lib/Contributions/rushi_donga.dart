import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:widgets_book/Constants/color.dart';

class RushiDonga extends StatefulWidget {
  @override
  _RushiDongaState createState() => _RushiDongaState();

  final String widgetName;
  final String contributorName;
  RushiDonga({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);
}

class _RushiDongaState extends State<RushiDonga> {

  String code = "";

  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/gf_card@rushi_donga.txt");

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

          GFCard(
            image: Image.network('https://images.unsplash.com/photo-1632130802948-de3c11e52c9f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1933&q=80'),
            title: const GFListTile(
              avatar: GFAvatar(
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1632130802948-de3c11e52c9f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1933&q=80'),
              ),
              title: Text('GF Card',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              subTitle: Text('@rushi_donga'),
            ),
            content: const Text("Some quick example text to build on the card"),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {},
                  text: 'OK',
                  color: kMediumBlueColor,
                ),
                GFButton(
                  onPressed: () {},
                  text: 'Cancel',
                  color: kMediumBlueColor,
                ),
              ],
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
