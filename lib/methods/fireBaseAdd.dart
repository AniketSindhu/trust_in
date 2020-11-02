import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trust_in/methods/blockchain.dart';
import 'package:trust_in/models/campaignModel.dart';
import 'package:trust_in/pages/campaign.dart';
import 'package:web3dart/web3dart.dart';

class FirebaseAdd{
  
  Future<String>addUser(String name,String email, String phoneNumber,String uid,String image,int score) async{
    var rng = new Random.secure();
    Credentials random = EthPrivateKey.createRandom(rng);
    var address = await random.extractAddress();
    await FirebaseFirestore.instance.collection('users').doc(address.hex)
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

    var response = await submit("_mint",[address, BigInt.from(1000)]);
    // https://rinkeby.etherscan.io/tx/$response   for transaction info
    print(response);
  }

  Future<bool>addCampaign(String address, CampaignModel campaignModel) async{
  await FirebaseFirestore.instance.collection('users').doc(address).update({'campaigns': FieldValue.arrayUnion([campaignModel.id])});
  await FirebaseFirestore.instance.collection('campaigns').doc(campaignModel.id.toString()).set(campaignModel.toMap());
  await FirebaseFirestore.instance.collection('indexVal').doc('value').update({'val':FieldValue.increment(1)});
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