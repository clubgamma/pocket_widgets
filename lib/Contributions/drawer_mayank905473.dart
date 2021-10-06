import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widgets_book/Constants/color.dart';

class Drawermayank905473 extends StatefulWidget {
  final String widgetName;
  final String contributorName;
  Drawermayank905473({Key? key, required this.contributorName, required this.widgetName}) : super(key: key);

  @override
  _Drawermayank905473State createState() => _Drawermayank905473State();
}

class _Drawermayank905473State extends State<Drawermayank905473> {
  String code = "";
  fetchAlgoFromFile() async{
    String algorithm;
    algorithm = await rootBundle.loadString("assets/files/drawer@mayank905473.txt");

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
  Widget listTile({String? title, IconData? icon, onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
        color: Colors.black,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black),
      ),
    );
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
      drawer: Drawer(
      child: Container(
        width: 100,
        color: kMediumBlueColor,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 43,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1629771764446-49323c3b36f9?ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTF8OTYyOTgwOXx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome Guest"),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 33,
                        child: OutlineButton(
                          onPressed: () {},
                          child: Text("Login"),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(width: 2),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home"),
            listTile(
                icon: Icons.shop_outlined,
                title: "Review Cart",),
            listTile(
                icon: Icons.person_outline,
                title: "My Profile",
                ),
            listTile(icon: Icons.notifications_outlined, title: "Notification"),
            listTile(icon: Icons.star_outline, title: "Rating & Review"),
            listTile(icon: Icons.favorite_outline, title: "Wishlist"),
            listTile(icon: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Support",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        " Call us",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "+91 123456xxxx",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          " Mail us",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "mayankchhatraya90415@gmail.com",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
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