import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:milestone_progress/milestone_progress.dart';
import 'package:trust_in/models/campaignModel.dart';
import 'package:velocity_x/velocity_x.dart';

class Campaign extends StatefulWidget {
  final CampaignModel campaignModel;
  Campaign({Key key,this.campaignModel}) : super(key: key);
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ZStack([
          CachedNetworkImage(
            fadeInDuration: Duration(seconds: 1),
            fit: BoxFit.fitWidth,
            imageUrl: widget.campaignModel.image,
            imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            )),
            placeholder: (context, url) =>
                SpinKitWave(color: Colors.red, size: 25).shimmer(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ).h(context.percentHeight * 45).w(context.screenWidth),
      VStack([
        (context.percentHeight * 33).heightBox,
        Expanded(
            child: VxBox(
                child: VStack(
          [
            HStack(
              [
                "Technology".text.semiBold.size(20).red500.make(),
                HStack(
                  [
                    Icon(Icons.timelapse).iconColor(Colors.grey),
                    (5).widthBox,
                    "15 days left".text.normal.gray400.size(18).make()
                  ],
                )
              ],
              alignment: MainAxisAlignment.spaceBetween,
              axisSize: MainAxisSize.max,
            ),
            (20).heightBox,
            "${widget.campaignModel.campaignName}".text.size(25).extraBold.xl2.make(),
            (10).heightBox,
            Divider(color:Colors.grey[400]),
            (10).heightBox,
            HStack([
              "\$540".text.size(18).red400.bold.make(),
              "\$800".text.size(18).black.bold.make(),
            ]
            ,axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.spaceBetween,
            ),
            (10).heightBox,
            GradientProgressIndicator(
              gradient:LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors:[
                  Color(0xFFFFAA85),
                  Color(0XFFB3315F)
                ]),
              value: 0.75,
            ).h(10),
            (10).heightBox,
            HStack([
              "75%".text.size(18).normal.color(Colors.grey).make(),
              "Collected".text.size(18).normal.color(Colors.grey).make(),
            ]
            ,axisSize: MainAxisSize.max,
            alignment: MainAxisAlignment.spaceBetween,
            ),
            (15).heightBox,
            Divider(color:Colors.grey[400]),
            DefaultTabController(
              length: 2,
              child: TabBar(
                onTap:(val){} ,
                labelColor: Vx.red400,
                labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                indicatorColor: Vx.red400,
                unselectedLabelColor: Vx.gray400,
                tabs: [
                  Tab(text: "Description",),
                  Tab(text: "MileStones",),
                ],
              ),
            ),
            (10).heightBox,
            DefaultTabController(
              length: 2,
              child: TabBarView(
                children:[
                  "${widget.campaignModel.campaignDescription}".text.overflow(TextOverflow.fade).xl.gray700.semiBold.make(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MilestoneProgress(
                        completedMilestone: 3,
                        maxIconSize: 30,
                        totalMilestones: 6,
                        width: 250,
                        completedIconData: Icons.check_box, //optional 
                        completedIconColor: Colors.green, //optional 
                        nonCompletedIconData: Icons.circle, //optional 
                        incompleteIconColor: Colors.grey, //optional 
                      ).centered(),
                      (10).heightBox,
                      "3 milestones are completed".text.makeCentered()
                    ],
                  )
                ]
              ),
            ).h(90),
            (20).heightBox,
            RaisedButton(
              onPressed: (){},
              padding: EdgeInsets.all(0.0),
              shape:  StadiumBorder(),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFFAA85),
                      Color(0XFFB3315F),
                    ],
                  ),
                ),
                child: "Support this Project".text.semiBold.size(18).white.make().centered(),
                padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
              ).w(context.screenWidth).h(50),
            ).centered(),
            (20).heightBox,
          ],
          alignment: MainAxisAlignment.start,
        ).scrollVertical()).padding(EdgeInsets.fromLTRB(32, 20, 32, 0)).white.shadow2xl.roundedLg.width(context.screenWidth).make())
      ])
    ]));
  }
}