import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flare_flutter/flare.dart';
class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
//  final Widget svg = SvgPicture.asset(
//    "images/onboarding_one.svg",
//  );
  List<Slide> slides = new List();
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
          title: "WELCOME",
          description: "A platform to help users to gain opportunities to micro-finance their personal/professional needs securely. ",
          pathImage:"assets/first.png",
          backgroundColor: Color(0xfff5a623),
          styleDescription:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      ),
    );
    slides.add(
      new Slide(
          title: "Easy Investment",
          description: "Invest and help others and earn interest on your investment.",
          pathImage: "assets/second.png",
          backgroundColor: Color(0xff203152),
          styleDescription:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      ),
    );
    slides.add(
      new Slide(
          title: "Security is Our Priority",
          description: "All transactions are handled securely through ethereum blockchain.",
          pathImage: "assets/third.png",
          backgroundColor: Color(0XFF006a71),
          styleDescription:TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
      ),
    );
  }
  void onDonePress(){
      //TODO - ADD NAVIGATOR TO CHOOSE ROLE SCREEN
  }
 Widget build(BuildContext context) {
      return Scaffold(
        body: new IntroSlider(
          slides: this.slides,
          onDonePress: this.onDonePress,
        ),
      );
    }
  }


