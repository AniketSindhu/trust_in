import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdd{
  addUser(String name,String email, String phoneNumber,String uid,String image,int score){
    FirebaseFirestore.instance.collection('users').doc(uid)
    .set({ 'name': name, 'email': email,'phoneNumber': phoneNumber,'uid':uid,'image':image,'score':score},SetOptions(merge:true));
  }
}