import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ApprovalPage extends StatefulWidget {
  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text("Create A Campaign"),
        gradient: LinearGradient(
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
          colors: [
            const Color(0xFFFFAA85),
            const Color(0XFFB3315F),
          ],
        ),
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder:(BuildContext context,int index){
            bool pressedCheck = false;
            bool pressedBlock = false;
            return Card(
              child: ListTile(
                title: Text(
                  "Mr. Gupta offers Rs.20000"
                ),
                subtitle: Text(
                  "at 15% per month",
                ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      //TODO - alert dialog box
                      //TODO - update the transaction
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.check,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),

                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      //TODO - alert dialog box
                      //TODO - update the transaction
                    },
                    shape: CircleBorder(),
                    child: Icon(
                      Icons.block,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
              ),
            );
          }
      ),
    );
  }
}
