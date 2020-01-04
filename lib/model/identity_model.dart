import 'package:flutter/foundation.dart';
enum Identity {boss, employee}

class IdentityModel extends ChangeNotifier{
  Identity _identity=Identity.employee;
  int _selectedIndex = 0;
  Identity get identity {
    return _identity;
  }

  int get selectedIndex {
    return _selectedIndex;
  }

  void changeIdentity(Identity identity){
    _identity=identity;
    _selectedIndex=0;
    notifyListeners();
  }

  void changeSelectTap(int index){
    _selectedIndex=index;
    notifyListeners();
  }
}