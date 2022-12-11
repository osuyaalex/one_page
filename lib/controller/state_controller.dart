import 'package:flutter/cupertino.dart';

class StateController extends ChangeNotifier{
  bool _req = true;
  bool get req => _req; //getter

  setReqValue(){
    _req = !_req;
    notifyListeners();
  }
}