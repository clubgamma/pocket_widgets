import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class ClubGamma extends StatefulWidget {
  @override
  _ClubGammaState createState() => _ClubGammaState();

  final String widgetName;
  final String contributorName;
  ClubGamma({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);
}

class _ClubGammaState extends State<ClubGamma> {

  String code = "";

  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/list_card@club_gamma.txt");

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

          const SizedBox(height: 10.0,),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Stack(
              children: [

                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width-80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: kDarkBlueColor
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, top: 13.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "List Card",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                letterSpacing: 1.0
                            ),
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            "@club_gamma",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                                letterSpacing: 1.0
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 8.0),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      color: const Color(0xffdfddee),
                    ),
                    child:  const Center(
                      child: Text(
                        "L C",
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
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
