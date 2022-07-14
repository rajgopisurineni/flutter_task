import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/models/home_Screen_Model.dart';
import 'package:flutter_task/utils/labels.dart';

class HomePageProvider extends ChangeNotifier {

  final homePageStreamController = StreamController.broadcast();

  ResponseDataModel? response;

  Future<void> getJsonData() async {
    homePageStreamController.add(null);
    try {
      var response = await json.decode(await rootBundle.loadString('assets/jsonData.json'));
      await Future.delayed(const Duration(seconds: 1));
      response = ResponseDataModel.fromJson(response);
      homePageStreamController.add(response);
      notifyListeners();
    } catch (e) {
      homePageStreamController.addError(Labels.CHECK_UR_CONNECTION);
      return;
    }
  }

}