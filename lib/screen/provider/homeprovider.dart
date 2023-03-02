import 'package:advance_listadd/screen/modal/modalpage.dart';
import 'package:flutter/material.dart';
class Homeprovider extends ChangeNotifier
{
  List<homemodel> l1 = [];

  void add(homemodel h1)
  {
    l1.add(h1);
    notifyListeners();
  }
  void delete(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }
  void editData(int index,homemodel m1)
  {
    l1[index] = m1;
    notifyListeners();
  }
}