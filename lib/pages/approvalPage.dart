import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ApprovalPage extends StatefulWidget {
  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  Future<void> _showAcceptDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are You Sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to accept this proposal?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                //TODO- HERE UPDATE THE TRANSACTION FOR THIS USER TO ACCEPT THIS PROPOSAL IN BLOCKCHAIN
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  Future<void> _showRejectDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are You Sure?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to reject this proposal?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                //TODO- HERE REJECT THIS PROPOSAL AND REMOVE IT FROM THE LIST OF PROPOSALS
              },
            ),
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text("Accept Or Reject Proposals"),
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
                      _showAcceptDialog();
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
                      _showRejectDialog();
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
