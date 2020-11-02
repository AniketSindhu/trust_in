import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:trust_in/config/config.dart';
import 'package:trust_in/methods/getUser.dart';
import 'package:trust_in/models/UserModel.dart';
import 'package:trust_in/pages/createCampaign.dart';
import 'package:velocity_x/velocity_x.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  UserModel user;
  bool loading =true;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async{
    setState(() {
      loading =true;
    });
    user = await getCurrentUser();
    setState(() {
      loading =false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    AppColors.primary,
                    AppColors.secondary
                  ])),
          child: loading==true?
          Center(
            child: SpinKitWave(
              color:AppColors.primary,
              size:60,
            ),
          )
          :Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Image.asset(                            
                'assets/logo.jpeg',
                fit: BoxFit.contain,
                height: 170
              ),
              (10).heightBox,
              Column(
                children: <Widget>[
                  Text(
                    'Hello',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Text(
                    '${user.name}',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  '${user.getEthaddress(user.address)}'.text.normal.size(14).gray800.maxLines(1).make().px32().py8(),
                  IconButton(icon:Icon(Icons.copy,color: Colors.white,size: 25,),splashColor: Colors.green,iconSize: 25,onPressed: (){},)
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF352740),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 100,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '${user.balance} GEN',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                (5).heightBox,
                                "1 GEN Coin = 50 INR".text.size(14).white.makeCentered()
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        Table(
                          border: TableBorder.symmetric(
                            inside: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.5),
                          ),
                          children: [
                            TableRow(children: [
                              _actionList(
                                  Icons.call_made_outlined,
                                  'Send Money',
                                  (){
                                        //TODO Show dialog mai address fir blockchain mai tranferFrom
                                  }),
                              _actionList(
                                  Icons.call_received_outlined, 
                                  'Request',
                                  (){
                                    //TODO Show dialog with qr code of eth address of user
                                  }),
                            ]),
                            TableRow(children: [
                              _actionList(
                                Icons.attach_money_outlined,
                                  'Create Campaign',
                                  (){
                                    Navigator.push(context, MaterialPageRoute(builder:(context){return CreateCampaign(user:user);}));
                                  }),
                              _actionList(
                                Icons.assignment_returned_outlined,
                                  'Invest in Campaigns',
                                  (){
                                    //TODO navigate to list of campigns.
                                  }),
                            ]),
                            TableRow(children: [
                              _actionList(
                                Icons.my_library_books_outlined,
                                'My Campigns',
                                (){
                                  //TODO  navigate to my campigns
                                }),
                              _actionList(
                                Icons.monetization_on_outlined,
                                  'My Investments',
                                  (){
                                    //TODO Navigate to my investment
                                  }),
                            ])
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ).pLTRB(5, 5, 5, 0)
            ],
          ),
        ),
      ),
    );
  }

// custom action widget
  Widget _actionList(IconData icon, String desc, Function tapFunction) {
    return GestureDetector(
      onTap: tapFunction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon,color: Colors.white,size:40),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}