import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seeds/models/models.dart';
import 'package:seeds/providers/services/http_service.dart';

class BalanceNotifier extends ChangeNotifier {
  BalanceModel balance;

  String tokenSymbol;
  String tokenContract;

  HttpService _http;

  static of(BuildContext context, {bool listen = false}) =>
      Provider.of<BalanceNotifier>(context, listen: listen);

  void update({HttpService http, String tokenSymbol, String tokenContract}) {
    _http = http;
    print("UPDATE BALANCE");
    if (tokenSymbol != this.tokenSymbol ||
        tokenContract != this.tokenContract) {
      this.tokenSymbol = tokenSymbol;
      this.tokenContract = tokenContract;
      fetchBalance();
    }
  }

  Future<void> fetchBalance() {
    print("FETCH BALANCE");
    return _http
        .getBalance(this.tokenContract, this.tokenSymbol)
        .then((result) {
      balance = result;
      notifyListeners();
    });
  }
}
