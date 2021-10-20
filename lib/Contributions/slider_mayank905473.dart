import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';


class Image_slider extends StatefulWidget {
  final String widgetName;
  final String contributorName;
  const Image_slider({ Key? key,required this.contributorName, required this.widgetName }) : super(key: key);

  @override
  _Image_sliderState createState() => _Image_sliderState();
}

class _Image_sliderState extends State<Image_slider> {

  String code = "";
  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/slider@mayank905473.txt");

    setState(() {
      code = algorithm;
    });

    // _showBottomSheet(context);
  }
  @override
  void initState() {
    // TODO: implement initState
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
          child: CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider1.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            
              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider2.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            
              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider3.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            
              //4th image
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider4.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            
              //5th image
              Container(
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/slider5.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
            
            //Slider Container properties
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * .35,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.9,
            ),
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