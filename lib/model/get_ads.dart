class GetAdsModel {
  String? message;
  int? num;
  List<Data>? data;
  int? code;

  GetAdsModel({this.message, this.num, this.data, this.code});

  GetAdsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    num = json['num'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    code = json['code'];
  }


}

class Data {
  String? id;
  List<Offer>? offer;
  String? name;
  String? address;
  String? time;
  String? body;
  String? img;
  String? status;
  String? date;

  Data(
      {this.id,
        this.offer,
        this.name,
        this.address,
        this.time,
        this.body,
        this.img,
        this.status,
        this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(Offer.fromJson(v));
      });
    }
    name = json['name'];
    address = json['address'];
    time = json['time'];
    body = json['body'];
    img = json['img'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (offer != null) {
      data['offer'] = offer!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    data['address'] = address;
    data['time'] = time;
    data['body'] = body;
    data['img'] = img;
    data['status'] = status;
    data['date'] = date;
    return data;
  }
}

class Offer {
  String? id;
  String? title;
  String? body;
  String? befor;
  String? after;
  String? img;
  String? offer;
  String? date;

  Offer(
      {this.id,
        this.title,
        this.body,
        this.befor,
        this.after,
        this.img,
        this.offer,
        this.date});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    befor = json['befor'];
    after = json['after'];
    img = json['img'];
    offer = json['offer'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['befor'] = this.befor;
    data['after'] = this.after;
    data['img'] = this.img;
    data['offer'] = this.offer;
    data['date'] = this.date;
    return data;
  }
}
