class ResponseDataModel {
  List<JsonData>? jsonData;

  ResponseDataModel({this.jsonData});

  ResponseDataModel.fromJson(Map<String, dynamic> json) {
    if (json['jsonData'] != null) {
      jsonData = <JsonData>[];
      json['jsonData'].forEach((v) {
        jsonData!.add(new JsonData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jsonData != null) {
      data['jsonData'] = this.jsonData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JsonData {
  List<int>? arrayValue;
  int? pointerValue;

  JsonData({this.arrayValue, this.pointerValue});

  JsonData.fromJson(Map<String, dynamic> json) {
    arrayValue = json['array_value'].cast<int>();
    pointerValue = json['pointer_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['array_value'] = this.arrayValue;
    data['pointer_value'] = this.pointerValue;
    return data;
  }
}
