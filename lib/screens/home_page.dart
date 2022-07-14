import 'package:flutter/material.dart';
import 'package:flutter_task/models/home_Screen_Model.dart';
import 'package:flutter_task/providers/home_page_provider.dart';
import 'package:flutter_task/utils/labels.dart';
import 'package:flutter_task/utils/loaders.dart';
import 'package:flutter_task/utils/notifiers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
    provider.getJsonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
provider.response;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        shadowColor: Colors.black,
        backgroundColor: Colors.blue,
        title: Text(Labels.home,
            style: Theme
                .of(context)
                .textTheme
                .subtitle2
                ?.apply(
                color: Colors.white, fontSizeDelta: 10, fontWeightDelta: 2)),
        centerTitle: true,
      ),
      body: Consumer<HomePageProvider>(builder: (_, providerr, child) => StreamBuilder(
          stream: providerr.homePageStreamController.stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return _buildBody(snapshot.data);
            } else if (snapshot.hasError) {
              return Notifiers.networkErrorPage(context, callBack);
            } else {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Loaders.circularLoader();
                case ConnectionState.active:
                  return Loaders.circularLoader();
                default:
                  return Container();
              }
            }
          }),
    ));
  }

  _buildBody(ResponseDataModel? data) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(data!.jsonData!.length, (ind) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: LayoutBuilder(builder: ((context, constraints) =>
                    Stack(
                      children: [
                        Positioned(
                          left: ((constraints.maxWidth) * data
                              .jsonData![ind].pointerValue!.toInt()) /
                              data.jsonData![ind].arrayValue!.reduce((value,
                                  element) => value + element),
                          child: Icon(Icons.arrow_drop_down_sharp, color: getPointerColor(data
                              .jsonData![ind].pointerValue!.toInt(),
                            data.jsonData![ind].arrayValue,
                          ),)),
                        Row(
                            children: List.generate(data.jsonData![ind]
                                .arrayValue!.length, (index) =>
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .end,
                                  children: [
                                    Text("${data.jsonData![ind]
                                        .arrayValue![index]}",
                                      textAlign: TextAlign.right,),
                                    Container(
                                      width: ((constraints.maxWidth) *
                                          data.jsonData![ind]
                                              .arrayValue![index]) /
                                          data.jsonData![ind].arrayValue!
                                              .reduce((value,
                                              element) => value + element),
                                      height: 20,
                                      color: getColors(index),
                                    ),
                                    // Text(getString(index), textAlign: TextAlign.left,),
                                  ],
                                ))
                        ),
                      ],
                    ))),
              )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Wrap(
              runSpacing: 10,
              children: [
                _buildText(Labels.underWeight, Colors.blue),
                _buildText(Labels.normal, Colors.green),
                _buildText(Labels.overWeight, Colors.yellow),
                _buildText(Labels.obesity, Colors.red)

              ],
            ),
          )
        ]
        ,
      ),
    );
  }

  Widget _buildText(String label, Color color){
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 3,
      children: [
        Container(
          height: 10,
          width: 10,
          color: color,
        ),
        Text(label)
      ],
    );
  }

  getString(int index){
    switch(index){
      case 0 :
        return "Underweight";
      case 1 :
        return "Normal";
      case 2 :
        return "Overweight";
      case 3 :
        return "Obesity";
    }
  }

  getPointerColor(int index, List<int>? array){
    for(var i = 0; i <= array!.length ; i++){
      if(index < array[i])
      return getColors(i);
    }
  }
  getColors(int index){
    switch(index){
      case 0 :
        return Colors.blue;
      case 1 :
        return Colors.green;
      case 2 :
        return Colors.yellow;
      case 3 :
        return Colors.red;
    }
  }

  callBack(){}
}
