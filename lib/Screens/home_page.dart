import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:widgets_book/Constants/color.dart';
import 'package:widgets_book/Contributions/rushi_donga.dart';
import 'package:widgets_book/Contributions/sidB67.dart';
import 'package:widgets_book/Contributions/Krunal3909_custom_button.dart';
import 'package:widgets_book/Contributions/rounded_textfield_krunal3909.dart';
import 'package:widgets_book/Contributions/krunal3909_popup.dart';

import '../Contributions/club_gamma.dart';
import '../Widget/home_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> _widgets = [];

  @override
  void initState() {
    super.initState();
    loadWidgets();
  }

  loadWidgets(){

    List<Widget> cards = [

      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RushiDonga(contributorName: "rushi_donga", widgetName: "GF Card")));
        },
        child: HomeCard(
          widgetName: "GF Card",
          contributorName: "rushi_donga",
        ),
      ),

      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ClubGamma(contributorName: "club_gamma", widgetName: "List Card")));
        },
        child: HomeCard(
          widgetName: "List Card",
          contributorName: "club_gamma",
        ),
      ),
       GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const sidB67()));
        },
        child: HomeCard(
          widgetName: "Rate Widget",
          contributorName: "sidB67",
        ),
      ),
      
       GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomButton(widgetName: "Custom Button")));
        },
        child: HomeCard(
          widgetName: "Custom Button",
          contributorName: "Krunal3909",
        ),
      ),
      
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => RoundedTextField(contributorName: "krunal3909", widgetName: "RoundedTextField")));
        },
        child: HomeCard(
          widgetName: "RoundedTextField",
          contributorName: "krunal_3909",
        ),
      )
      
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Popup(contributorName: "krunal3909", widgetName: "Popup")));
        },
        child: HomeCard(
          widgetName: "Popup",
          contributorName: "krunal_3909",
        ),
      )

    ];

    for (int i = 0; i < cards.length; i++) {
      _widgets.add(cards[i]);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMediumBlueColor,
      appBar: AppBar(
        backgroundColor: kMediumBlueColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Widget's App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5
          ),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          itemCount: _widgets.length,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 1000),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: _widgets[index],
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
