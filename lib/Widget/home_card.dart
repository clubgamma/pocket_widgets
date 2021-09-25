import 'package:flutter/material.dart';
import 'package:widgets_book/Constants/color.dart';

class HomeCard extends StatelessWidget {

  final String widgetName;
  final String contributorName;
  HomeCard({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  children: [
                    Text(
                      "$widgetName",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          letterSpacing: 1.0
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    Text(
                      "@$contributorName",
                      style: const TextStyle(
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
              child:  Center(
                child: Text(
                  "${widgetName[0]} ${contributorName[0].toUpperCase()}",
                  style: const TextStyle(
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
    );
  }
}