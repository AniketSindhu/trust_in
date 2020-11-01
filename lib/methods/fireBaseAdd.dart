import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web3dart/web3dart.dart';

class FirebaseAdd{
  
  addUser(String name,String email, String phoneNumber,String uid,String image,int score) async{
    var rng = new Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);
    var address = await random.extractAddress();
    FirebaseFirestore.instance.collection('users').doc(address.hex)
    .set({ 
      'name': name, 
      'email': email,
      'phoneNumber': phoneNumber,
      'uid':uid,
      'image':image,
      'score':score,
      'ethAddress':address.hex,
      'balance':1000
    },SetOptions(merge:true));

    //TODO: etherum mint 1000 coins in the wallet
    
  }

}