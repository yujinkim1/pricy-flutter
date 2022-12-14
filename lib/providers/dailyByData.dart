import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async' show Future;
import '/utilities/kamis.dart';

Future<PriceList> fetchDaily() async {
  final response = await http.get(dailyByUrl);

  //MARK: IS RESPONSE STATUS CORRECT 200
  final jsonResponse = json.decode(response.body);
  return new PriceList.fromJson(jsonResponse);
}

class PriceList {
  List<Price>? price;

  PriceList({this.price});

  PriceList.fromJson(Map<String, dynamic> json) {
    if (json['price'] != null) {
      price = <Price>[];
      // List price = [];
      json['price'].forEach((v) {
        price!.add(Price.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(Type priceList) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price!.map((v) => v.toJson()).toList();
    } else if (this.price == null) {
      const emptyValue = '0';
      this.price!.map((emptyValue) => emptyValue.toJson()).toList();
    }
    return data;
  }
  /*
  String PriceListToJson(List<Price> price) =>
  jsonEncode(price.map((v) => v.toJson()).toList().toString());
  */
}

class Price {
  String itemName;
  String categoryName;
  String lastestDay;
  String unit;
  String dpr1;
  String dpr2;
  String dpr3;
  String dpr4;

  Price({
    required this.itemName,
    required this.categoryName,
    required this.lastestDay,
    required this.unit,
    required this.dpr1,
    required this.dpr2,
    required this.dpr3,
    required this.dpr4,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
        categoryName: json["category_name"],
        lastestDay: json["lastest_day"],
        itemName: json["item_name"],
        unit: json["unit"],
        dpr1: json["dpr1"],
        dpr2: json["dpr2"].toString(),
        dpr3: json["dpr3"].toString(),
        dpr4: json["dpr4"].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_name'] = categoryName;
    data['lastest_day'] = lastestDay;
    data['item_name'] = itemName;
    data['unit'] = unit;
    data['dpr1'] = dpr1;
    data['dpr2'] = dpr2;
    data['dpr3'] = dpr3;
    data['dpr4'] = dpr4;
    return data;
  }
}
