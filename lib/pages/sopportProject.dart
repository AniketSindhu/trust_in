import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SupportProject extends StatefulWidget {
  @override
  _SupportProjectState createState() => _SupportProjectState();
}
final supportPageForm = GlobalKey<FormState>();
class _SupportProjectState extends State<SupportProject> {
  final svg = SvgPicture.asset("images/invest.svg", height: 300,);
  String amountToBeInvested;
  String interest;
  int AmountToBeInvested;
  int Interest;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          title: Text("Support Project"),
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              const Color(0xFFFFAA85),
              const Color(0XFFB3315F),
            ],
          ),
        ),
        body: Form(
          key: supportPageForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                svg,
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFfcdada),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      amountToBeInvested = value;
                    },
                    validator: (value) {
                      Pattern pattern = r'^[1-9]\d*$';
                      RegExp regex = new RegExp(pattern);
                      if (value.trim().length==0) {
                        return "Cannot be Empty";
                      }
                      else if(!regex.hasMatch(value)){
                        return "Enter A Valid Value (Integer)";
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.attach_money, size: 30,),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      hintText: "Amount to be invested",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0XFFfcdada),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (value){
                      interest = value;
                    },
                    validator: (value) {
                      Pattern pattern = r'^[1-9]\d*$';
                      RegExp regex = new RegExp(pattern);
                      if (value.trim().length==0) {
                        return "Cannot be Empty";
                      }
                      else if(!regex.hasMatch(value)){
                        return "Enter A Valid Value (Integer)";
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.trending_up, size: 30,),
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      hintText: "Interest Percentage per month",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                RaisedButton(
                  onPressed: () {
                    if(supportPageForm.currentState.validate())
                      {
                          AmountToBeInvested = int.parse(amountToBeInvested);
                          Interest = int.parse(interest);
                      }
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0XFFFCCF31),
                          const Color(0XFFF55555),
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(80.0)),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'INVEST',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
