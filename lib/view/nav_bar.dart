import 'package:clerk/view/error_correction_screen/error_correction_screen.dart';
import 'package:clerk/view/summarization_screen/summarization-screen.dart';
import 'package:clerk/view/text_extraction_screen/text_extraction_screen.dart';
import 'package:clerk/view/translation_screen/translation_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../constants.dart';

class NavigationBar extends StatefulWidget {
  static String id = "NavBarScreen";

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _index = 0;
  @override
void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [];
    screens = <Widget>[
      TextExtractionScreen(),
      SummarizationScreen(),
      TranslationScreen(),
      ErrorCorrectionScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title:Image.asset("assets/images/clerk logo.png",width: MediaQuery.of(context).size.width*.25,),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: //SizedBox.expand(child: child),
      screens[_index],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          onTap: (newIndex) => setState(() => _index = newIndex),
          currentIndex: _index,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.gesture), title: Text("Error Correction")),
            BottomNavigationBarItem(
                icon: Icon(Icons.translate), title: Text("Translation")),
            BottomNavigationBarItem(
                icon: Icon(Icons.gesture),
                title: Text(
                  "Summarization",
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.text_fields), title: Text("Text Extraction")),
          ],
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Color(0xFF8E8E8E),
         //backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,

        ),
      ),
    );
  }
}
