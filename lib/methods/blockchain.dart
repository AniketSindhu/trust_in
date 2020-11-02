import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/web3dart.dart';
  

  Future<DeployedContract> loadContract() async {
    String abi = await rootBundle.loadString("assets/abi.json");
    String contractAddress = "0x94aba5C3BF3521366f0f98403b7318310d8472F9";
    final contract = DeployedContract(ContractAbi.fromJson(abi, "SharedOwenrship"),
        EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    Client httpClient;
    Web3Client ethClient;
    httpClient = Client();
    ethClient = Web3Client(
        'https://rinkeby.infura.io/v3/1a47048363ec47db96388454619239fe',
        httpClient);
    final contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);
    return result;
  }

  Future<String> submit(String functionName, List<dynamic> args)async{
    Client httpClient;
    Web3Client ethClient;
    httpClient = Client();
    ethClient = Web3Client(
        'https://rinkeby.infura.io/v3/79a71b288cea4e2ea6e41389d8c7b46f',
        httpClient);
    EthPrivateKey credential =EthPrivateKey.fromHex("2d0b3dd23b10339a1791f4cdc82602029db757c031191bef9b0652474892a2b7");
    DeployedContract contract = await loadContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(credential, Transaction.callContract(contract: contract, function: ethFunction, parameters: args),fetchChainIdFromNetworkId: true);
    print(result);
    return result;
  }
