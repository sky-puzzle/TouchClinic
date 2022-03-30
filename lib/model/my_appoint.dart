class MyAppointment {
  String? message;
  int? num;
  List<DataModel>? data;
  int? code;

  MyAppointment({this.message, this.num, this.data, this.code});

  MyAppointment.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    num = json['num'];
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(new DataModel.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['num'] = num;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class DataModel {
  String? qrcode;
  String? date;

  DataModel({this.qrcode, this.date});

  DataModel.fromJson(Map<String, dynamic> json) {
    qrcode = json['qrcode'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['qrcode'] = this.qrcode;
    data['date'] = date;
    return data;
  }
}
