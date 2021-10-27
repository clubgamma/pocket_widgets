import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:widgets_book/Constants/color.dart';
import 'package:widgets_book/Contributions/FlipCard.dart';
import 'package:widgets_book/Contributions/dismissibleCard.dart';
import 'package:widgets_book/Contributions/drawer_mayank905473.dart';
import 'package:widgets_book/Contributions/modal_bottom_sheet_krunal3909.dart';
import 'package:widgets_book/Contributions/rgbPicker_hurshh.dart';
import 'package:widgets_book/Contributions/rushi_donga.dart';
import 'package:widgets_book/Contributions/sidB67.dart';
import 'package:widgets_book/Contributions/Krunal3909_custom_button.dart';
import 'package:widgets_book/Contributions/rounded_textfield_krunal3909.dart';
import 'package:widgets_book/Contributions/krunal3909_popup.dart';
import 'package:widgets_book/Contributions/slider_mayank905473.dart';
import 'package:widgets_book/Contributions/warpaltarpers.dart';

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

  loadWidgets() {
    List<Widget> cards = [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RushiDonga(
                      contributorName: "rushi_donga", widgetName: "GF Card")));
        },
        child: HomeCard(
          widgetName: "GF Card",
          contributorName: "rushi_donga",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClubGamma(
                      contributorName: "club_gamma", widgetName: "List Card")));
        },
        child: HomeCard(
          widgetName: "List Card",
          contributorName: "club_gamma",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const sidB67()));
        },
        child: HomeCard(
          widgetName: "Rate Widget",
          contributorName: "sidB67",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CustomButton(widgetName: "Custom Button")));
        },
        child: HomeCard(
          widgetName: "Custom Button",
          contributorName: "Krunal3909",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoundedTextField(
                      contributorName: "krunal3909",
                      widgetName: "RoundedTextField")));
        },
        child: HomeCard(
          widgetName: "RoundedTextField",
          contributorName: "krunal_3909",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Popup(
                      contributorName: "krunal3909", widgetName: "Popup")));
        },
        child: HomeCard(
          widgetName: "Popup",
          contributorName: "krunal_3909",
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Warpaltarpers(
                      contributorName: "warpaltarpers",
                      widgetName: "Neumorphic Round Button")));
        },
        child: HomeCard(
          widgetName: "Neumorphic Round Button",
          contributorName: "warpaltarpers",
        ),
      ),
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ModalBottomSheet(contributorName: "krunal3909", widgetName: "Bottom Sheet")));
        },
        child: HomeCard(
          widgetName: "Modal Bottom Sheet",
          contributorName: "krunal_3909",
        ),
      ),
         GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DismissibleCard(
                      contributorName: "Palak-Bera",
                      widgetName: "Dismissible Card")));
        },
        child: HomeCard(
          widgetName: "Dismissible Card",
          contributorName: "Palak-Bera",
        ),
      ),
      
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => Drawermayank905473(contributorName: "mayank905473", widgetName: "Drawer")));
        },
        child: HomeCard(
          widgetName: "Drawer ",
          contributorName: "mayank905473",
        ),
      ),
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => rgb_picker(contributorName: "hurshh", widgetName: "RGB Picker")));
        },
        child: HomeCard(
          widgetName: "RGB Picker",
          contributorName: "hurshh",
        ),
      ),

       GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FlipCardPage(
                      contributorName: "Palak-Bera", widgetName: "Flip Card")));
        },
        child: HomeCard(
          widgetName: "Flip Card",
          contributorName: "Palak-Bera",
        ),
      ),

       GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Image_slider(
                      contributorName: "Mayank Chhatraya", widgetName: "Image Slider")));
        },
        child: HomeCard(
          widgetName: "Image Slider",
          contributorName: "mayank chhatraya",
        ),
      ),
      
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TextGradientPage(contributorName: "Sunali", widgetName: "Text Gradient")));
        },
        child: HomeCard(
          widgetName: "Text Gradient",
          contributorName: "sunalii",
        ),
      ),
    
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
                letterSpacing: 1.5),
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
        ));
  }
}
