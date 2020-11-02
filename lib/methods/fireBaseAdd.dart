import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trust_in/models/campaignModel.dart';
import 'package:trust_in/pages/campaign.dart';
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

  Future<bool>addCampaign(String address, CampaignModel campaignModel) async{
   await FirebaseFirestore.instance.collection('users').doc(address).update({'campaigns': FieldValue.arrayUnion([campaignModel.id])});
    await FirebaseFirestore.instance.collection('campaigns').add(campaignModel.toMap());

    if(campaignModel.totalAmount>=2000&&campaignModel.totalAmount<=4000){
      await FirebaseFirestore.instance.collection('users').doc(address).update({'score': FieldValue.increment(-50)});
    }  //1lakh rs -2 lakh rs
    else if(campaignModel.totalAmount>4000&&campaignModel.totalAmount<=6000){
      await FirebaseFirestore.instance.collection('users').doc(address).update({'score': FieldValue.increment(-100)});
    }  //2 lakh rs - 3 lakh 
    else if(campaignModel.totalAmount>6000){
      await FirebaseFirestore.instance.collection('users').doc(address).update({'score': FieldValue.increment(-150)});
    }
    // TODO invoke createcampign on blockchain also
    return true;
  }

}