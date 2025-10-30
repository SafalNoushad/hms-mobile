import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  static final DataProvider _instance = DataProvider._internal();

  factory DataProvider() => _instance;

  DataProvider._internal();
}
