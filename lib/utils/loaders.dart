import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loaders {

  static Future<void> showLoadingDialog(BuildContext context,
      GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: SimpleDialog(
                    elevation: 0.0,
                    backgroundColor: Colors.transparent,
                    children: <Widget>[
                      Center(
                        child:  Column(children: [
                          SpinKitThreeBounce(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            size: 30.0,
//                            controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Please Wait...',
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          )
                        ]),
                      )
                    ]),
              ));
        });
  }

  static circularLoader(){
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}