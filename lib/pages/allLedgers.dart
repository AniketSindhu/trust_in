import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
class AllLedgers extends StatefulWidget {
  @override
  _AllLedgersState createState() => _AllLedgersState();
}

final amountInputForm = GlobalKey<FormState>();

class _AllLedgersState extends State<AllLedgers> {
  String amount;
  int Amount;
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter the Amount'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: amountInputForm,
                  child: TextFormField(
                    onChanged: (value){
                      amount = value;
                    },
                    keyboardType: TextInputType.number,
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
                      hintText: "Amount in GEN",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Confirm'),
              onPressed: () {
                if(amountInputForm.currentState.validate())
                {
                  Amount = int.parse(amount);
                  //TODO- CALL FUNCTION TO REPAY
                }
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
        title: Text("All Ledgers"),
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
          itemCount: 10,
          itemBuilder: (BuildContext context,int index){
            return Card(
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(15),
                child:Container(
                  padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFd9ecf2)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Investor: Mr. Gupta",
                          style: TextStyle(
                            fontSize: 30,
                            color: Color(0xFFe8505b),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Amount: 20000 GEN",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF03c4a1),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text("Interest: 5% per month",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF03c4a1),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 4,
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
                              ),
                            ),
                            Text(
                              "GEN remaining",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                _showMyDialog();
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
                                    'REPAY',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
              );
          }
      )
    );
  }
}
