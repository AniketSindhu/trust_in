import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:trust_in/models/campaignModel.dart';
import 'package:velocity_x/velocity_x.dart';

class ApprovalPage extends StatefulWidget {
  final CampaignModel campaign;
  ApprovalPage({this.campaign});
  @override
  _ApprovalPageState createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  Stream getApprovals() {
    final x =  FirebaseFirestore.instance
        .collection("campaigns")
        .doc(widget.campaign.id.toString())
        .collection("notApproved")
        .where('isApproved', isEqualTo: false)
        .snapshots();
    return x;
  }

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
      body: StreamBuilder(
        stream: getApprovals(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: SpinKitWave(color:Colors.red,size:50),);
          }
          if(snapshot.hasData){
            if(snapshot.data.documents.length==0){
              return Center(child:"Nothing to Approve".text.size(22).semiBold.red600.make());
            }
            else{
              return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool pressedCheck = false;
                    bool pressedBlock = false;
                    return Card(
                      child: ListTile(
                          title: Text("${snapshot.data.documents[index].data()['investorName']} offers ${snapshot.data.documents[index].data()['investAmount']} GEN"),
                          subtitle: Text(
                            "at ${snapshot.data.documents[index].data()['interest']}% per month for ${snapshot.data.documents[index].data()['ownershipPercent']}% ownership",
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
                          )),
                    );
                  });
                }
              }
              else{
                return Center(child:"Nothing to Approve".text.size(22).semiBold.red600.make());
              }
        }
      ),
    );
  }
}
