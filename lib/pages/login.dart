import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.white, Colors.white10])),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'TrustIn',
                style: GoogleFonts.orbitron(
                    textStyle: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xFFFFAA85), Color(0xFFB3315F)],
                          ).createShader(Rect.fromLTWH(100, 0, 200, 0)),
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: SvgPicture.asset(
                  'assets/loginred.svg',
                  height: 350,
                  width: 350,
                ),
              ),
              //SignInButton(
              //  Buttons.GoogleDark,
              //  onPressed: () {
              //    //Google Sign-in
              //  },
              //  text: 'Continue With Google',
              //)
            ]),
      ),
    );
  }
}
