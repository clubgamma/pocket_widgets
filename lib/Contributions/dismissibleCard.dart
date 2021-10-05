import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class DismissibleCard extends StatefulWidget {
  @override
  _DismissibleCardState createState() => _DismissibleCardState();

  final String widgetName;
  final String contributorName;
  DismissibleCard(
      {Key? key, required this.contributorName, required this.widgetName})
      : super(key: key);
}

List<Widget> cards = [
  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kDarkBlueColor,
      ),
      height: 70,
      child: Center(
          child: Text(
        "1. Swipe to Remove",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      )),
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kDarkBlueColor,
      ),
      height: 70,
      child: Center(
          child: Text(
        "2. Swipe to Remove",
        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
      )),
    ),
  ),
];

class _DismissibleCardState extends State<DismissibleCard> {
  String code = "";

  fetchAlgoFromFile() async {
    String algorithm;
    algorithm =
        await rootBundle.loadString("assets/files/dismissible_card@palak.txt");

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
      body: ListView(
        children: [
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(cards[index]),
                    child: cards[index],
                    background: Container(
                        height: 55,
                        color: Colors.red[300],
                        child: Center(
                            child: Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 15,
                        ))),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.startToEnd) {
                        if (cards.contains(cards.removeAt(index))) {
                          setState(() {
                            cards.remove(cards.removeAt(index));
                          });
                        }
                      }
                    },
                  );
                }),
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
                Scaffold.of(context).showSnackBar(snackBar);
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
