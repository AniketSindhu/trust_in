//TODO VALIDATORS DAALDO

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:random_string/random_string.dart';
import 'package:trust_in/models/campaignModel.dart';
import 'dart:io';
import 'package:velocity_x/velocity_x.dart';
import 'package:trust_in/models/UserModel.dart';

class CreateCampaign extends StatefulWidget {
  final UserModel user;
  CreateCampaign({Key key, this.user}) : super(key: key);
  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  PickedFile _image1;
  PickedFile _image2;
  PickedFile _image3;
  String projectName;
  String amount;
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  bool loading=false;
  Future pickImage(int val) async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (val == 0) {
        _image1 = image;
      } else if (val == 1) {
        _image2 = image;
      } else if (val == 2) {
        _image3 = image;
      }
    });
  }

  _selectStartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedStartDate)
      setState(() {
        selectedStartDate = picked;
      });
  }

  _selectEndDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedEndDate)
      setState(() {
        selectedEndDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    child: Column(
                      children: [
                        (10).heightBox,
                        "Your Trust Score: ${widget.user.score}"
                            .text
                            .bold
                            .size(25)
                            .makeCentered(),
                        (20).heightBox,
                        Align(
                            alignment: Alignment.centerLeft,
                            child: "Name of the product"
                                .text
                                .size(20)
                                .semiBold
                                .red700
                                .make()),
                        (8).heightBox,
                        Container(
                          decoration: BoxDecoration(
//                                    gradient: LinearGradient(
//                                        begin: Alignment.centerLeft,
//                                        end: Alignment.centerRight,
//                                        colors: [
//                                          const Color(0xFFFFAA85),
//                                          const Color(0XFFB3315F),
//                                        ],
//                                    ),
                            color: Color(0XFFfcdada),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              projectName = value;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.title,
                                size: 30,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              hintText: "Project Name",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.photo,
                              size: 40,
                              color: Vx.red700,
                            ),
                            (3).widthBox,
                            Text(
                              "Pictures",
                              style: TextStyle(fontSize: 20, color: Vx.red700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 150,
                          color: Colors.transparent,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            children: [
                              GestureDetector(
                                onTap: () => pickImage(0),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black12,
                                  ),
                                  child: _image1 == null
                                      ? Center(
                                          child: Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Vx.red700,
                                          ),
                                        )
                                      : Image.file(File(_image1.path)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => pickImage(1),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black12,
                                  ),
                                  child: _image2 == null
                                      ? Center(
                                          child: Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Vx.red700,
                                          ),
                                        )
                                      : Image.file(File(_image2.path)),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => pickImage(2),
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.black12,
                                  ),
                                  child: _image3 == null
                                      ? Center(
                                          child: Icon(
                                            Icons.add_a_photo,
                                            size: 40,
                                            color: Vx.red700,
                                          ),
                                        )
                                      : Image.file(File(_image3.path)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: "Amount you want to raise"
                                .text
                                .size(20)
                                .semiBold
                                .red700
                                .make()),
                        (8).heightBox,
                        Container(
                          decoration: BoxDecoration(
//                              gradient: LinearGradient(
//                                begin: Alignment.centerLeft,
//                                end: Alignment.centerRight,
//                                colors: [
//                                  const Color(0xFFFFAA85),
//                                  const Color(0XFFB3315F),
//                                ],
//                              ),
                            color: Color(0XFFfcdada),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              amount = value;
                            },
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.attach_money,
                                size: 30,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              hintText: "Amount Required",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
/*                             Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  height: 100,
                                  padding: EdgeInsets.all(20),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text("Starts on: \n" + "${selectedStartDate.toLocal()}".split(' ')[0],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        const Color(0xFFFFAA85),
                                        const Color(0XFFB3315F),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                                Container(
                                  height: 100,
                                  margin: EdgeInsets.only(right: 20),
                                  padding: EdgeInsets.all(20),
                                  child:Align(
                                        alignment: Alignment.center,
                                        child: Text("Ends on: \n" + "${selectedEndDate.toLocal()}".split(' ')[0],
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        const Color(0xFFFFAA85),
                                        const Color(0XFFB3315F),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ],
                            ), */
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 45, right: 45),
/*                           child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RaisedButton(
                                onPressed: () => _selectStartDate(context),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
//                                      gradient: LinearGradient(
//                                        begin: Alignment.centerLeft,
//                                        end: Alignment.centerRight,
//                                        colors: [
//                                          const Color(0XFFFCCF31),
//                                          const Color(0XFFF55555),
//                                        ],
//                                      ),
                                    color: Color(0XFFbb2205),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: 100,
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            36.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                              RaisedButton(
                                onPressed: () => _selectEndDate(context),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
//                                      gradient: LinearGradient(
//                                        begin: Alignment.centerLeft,
//                                        end: Alignment.centerRight,
//                                        colors: [
//                                          const Color(0XFFFCCF31),
//                                          const Color(0XFFF55555),
//                                        ],
//                                      ),
                                    color: Color(0XFFbb2205),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    width: 100,
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight:
                                            36.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'SELECT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ), */
                        ),
/*                         SizedBox(
                          height: 50,
                        ), */
                        Align(
                            alignment: Alignment.centerLeft,
                            child: "Product Description"
                                .text
                                .size(20)
                                .semiBold
                                .red700
                                .make()),
                        (8).heightBox,
                        Container(
                          decoration: BoxDecoration(
//                                    gradient: LinearGradient(
//                                        begin: Alignment.centerLeft,
//                                        end: Alignment.centerRight,
//                                        colors: [
//                                          const Color(0xFFFFAA85),
//                                          const Color(0XFFB3315F),
//                                        ],
//                                    ),
                            color: Color(0XFFfcdada),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            onChanged: (value) {
                              projectName = value;
                            },
                            maxLines: 4,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              decoration: TextDecoration.none,
                            ),
                            decoration: InputDecoration(
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.description,
                                size: 30,
                              ),
                              hintStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                              hintText:
                                  "Give a short description of the product and why you need it",
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        RaisedButton(
                          onPressed: () async {
                            // TODO phele validation check krna hai fir niche example ki tarah score check krna hai aur else part mai function call jo niche hai 
/*                          if (int.parse(amount) / widget.user.score < 100) {
                              Fluttertoast.showToast(
                                  msg: 'Score too low for this amount',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  gravity: ToastGravity.TOP);
                            } */
                            final campaignId = randomAlpha(8);
                            setState(() {
                              loading =true;
                            });
/*                             String fileName = "Banners/$campaignId/";
                            StorageReference firebaseStorageRef =
                            FirebaseStorage.instance.ref().child(fileName);
                            StorageUploadTask uploadTask = firebaseStorageRef.putFile(File(_image1.path));
                            await firebaseStorageRef.getDownloadURL().then((fileURL) async {
                              _uploadedFileURL = fileURL;
                            }); */
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          padding: const EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  const Color(0XFFFCCF31),
                                  const Color(0XFFF55555),
                                ],
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 300,
                              constraints: const BoxConstraints(
                                  minWidth: 88.0,
                                  minHeight:
                                      36.0), // min sizes for Material buttons
                              alignment: Alignment.center,
                              child: const Text(
                                'CREATE CAMPAIGN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        (10).heightBox
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
