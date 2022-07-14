import 'package:flutter/material.dart';
import 'package:flutter_task/utils/labels.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Notifiers {
  static getToastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static Widget networkErrorPage(context, Function callBack) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            Labels.CHECK_UR_CONNECTION,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subtitle1!.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RaisedButton(
              color: const Color.fromRGBO(78, 76, 77,1),
              onPressed: () => callBack(),
              child: const Text(
                Labels.RETRY,
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

}