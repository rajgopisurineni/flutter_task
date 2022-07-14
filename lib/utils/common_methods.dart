import 'package:flutter/material.dart';
import 'package:flutter_task/utils/global_variable.dart';
import 'package:flutter_task/utils/loaders.dart';

class CommonMethods {

  static setLoaderStatus(GlobalKey key, BuildContext context,
      [enable = false]) {
    if (enable) {
      Loaders.showLoadingDialog(context, key);
      return;
    }
    Navigator.of(context).pop();
  }

}
