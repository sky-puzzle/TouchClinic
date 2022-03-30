class Appointment {
  String? message;
  int? qrcode;
  int? code;

  Appointment({this.message, this.qrcode, this.code});

  Appointment.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    qrcode = json['qrcode'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    data['qrcode'] = qrcode;
    data['code'] = code;
    return data;
  }
}
