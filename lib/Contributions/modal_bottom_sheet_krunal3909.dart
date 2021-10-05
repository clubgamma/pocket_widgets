import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();

  final String widgetName;
  final String contributorName;
  ModalBottomSheet({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {

  String code = "";

  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/modal_bottom_sheet@krunal3909.txt");

    setState(() {
      code = algorithm;
    });

    _showBottomSheet(context);
  }

  _showBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Container(
            height: 200.0,
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [


                  GestureDetector(
                    onTap: (){

                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.location_fill,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){

                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.arrow_down_doc,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Copy",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){

                    },
                    child: const ListTile(
                      leading: Icon(
                        CupertinoIcons.delete,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Delete",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
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
