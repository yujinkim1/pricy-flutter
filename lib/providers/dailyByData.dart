import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/kamis.dart';

//MARK: GET
Future<DailyByData> fetchDaily() async {
  final response = await http.get(dailyByUrl);
  //MARK: isResponseStatusCorrect
  if (response.statusCode == 200) {
    final decodeData = utf8.decode(response.bodyBytes);
    return DailyByData.fromJson(jsonDecode(decodeData));
  } else {
    //MARK: isResponseStatusIncorrect
    throw Exception("데이터를 불러오는데 실패했습니다.");
  }
}

class DailyByData {
  final String condition;
  final String errorcode;
  final List<Price> price;

  DailyByData({
    required this.condition,
    required this.errorcode,
    required this.price,
  });

  factory DailyByData.fromJson(Map<String, dynamic> json) {
    var list = json['price'] as List;
    print(list.runtimeType);
    List<Price> priceList = list.map((i) => Price.fromJson(i)).toList();
    print(priceList);
    return DailyByData(
        condition: json['condition'],
        errorcode: json['errorcode'],
        price: priceList);
  }
}

class Price {
  final String itemName;
  final String categoryName;
  final String lastestDay;
  final String unit;
  final String dpr1;
  final String direction;

  Price({
    required this.itemName,
    required this.categoryName,
    required this.lastestDay,
    required this.unit,
    required this.dpr1,
    required this.direction,
  });

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      itemName: json['item_name'],
      categoryName: json['category_name'],
      lastestDay: json['lastest_day'],
      unit: json['unit'],
      dpr1: json['dpr1'],
      direction: json['direction'],
    );
  }
}
