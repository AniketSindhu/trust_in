import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class SingleInvestment extends StatefulWidget {
  @override
  _SingleInvestmentState createState() => _SingleInvestmentState();
}

class _SingleInvestmentState extends State<SingleInvestment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: GradientAppBar(
          centerTitle: true,
          title: Text("Investment"),
          gradient: LinearGradient(
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            colors: [
              const Color(0xFFFFAA85),
              const Color(0XFFB3315F),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(15),
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //color: Color(0xFFd9ecf2),
                      color: Color(0xFFff7171),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total Amount Invested:",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFcffffe),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "20000",
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFcffffe),
                            ),
                          ),
                          Text(
                            "GEN",
                            style: TextStyle(
                              fontSize: 30,
                              color: Color(0xFFcffffe),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "at 15% per month",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFFfddb3a),
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(15),
                elevation: 10,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //color: Color(0xFFd9ecf2),
                    color: Color(0xFFff7171),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Amount Due: 20000 GEN",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFcffffe),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Amount Repaid: 20000 GEN ",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFcffffe),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
