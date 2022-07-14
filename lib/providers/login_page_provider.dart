import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/repository/login_page_repository.dart';
import 'package:flutter_task/routes.dart';
import 'package:flutter_task/utils/common_methods.dart';
import 'package:flutter_task/utils/notifiers.dart';

import '../utils/global_variable.dart';
import '../utils/labels.dart';

class LoginPageProvider extends ChangeNotifier {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool autoValidation = false;

  final GlobalKey<State> _keyLoader = GlobalKey<State>();

  final loginPageRepository = LoginPageRepository();

  var logIdInputController = TextEditingController();
  var passwordInputController = TextEditingController();

  Future<void> onClickOfLogin(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus();
      if (formKey.currentState!.validate()) {
        Map body = {
          "jsonrpc": "2.0",
          "method": "call",
          "params":
          {
            "db": "Warehouse-Zota-25-05",
            "login": logIdInputController.text.toString(),
            "password": passwordInputController.text.toString()
          }
        };
        autoValidation = false;
        CommonMethods.setLoaderStatus(_keyLoader, context, true);
        var response = await loginPageRepository.loginResponse(body);
        CommonMethods.setLoaderStatus(_keyLoader, context);
        if(response){
          Navigator.pushNamed(context, Routes.homePage,);
        }else{
          Notifiers.getToastMessage(Labels.unable_to_login);
        }
      } else {
        autoValidation = true;
      }
    }  on DioError catch (e) {
      CommonMethods.setLoaderStatus(_keyLoader, context);
      Notifiers.getToastMessage(Labels.unable_to_login);
    } on Exception catch (e, stackTrace) {
      CommonMethods.setLoaderStatus(_keyLoader, context);
      Notifiers.getToastMessage(Labels.CHECK_UR_CONNECTION);
    }
  }
}