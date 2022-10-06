import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import '../utilities/kamis.dart';

//MARK: GET
Future<DailyByData> fetchPost() async {
  final response = await http.get(dailyByUrl);
  //MARK: isResponseStatusCorrect
  if (response.statusCode == 200) {
    return DailyByData.fromJson(json.decode(response.body));
  } else {
    //MARK: 이전 Response 데이터 표기
    return DailyByData.fromJson(json.decode(response.body));
  }
}

class DailyByData {
  final item_name;
  final category_name;
  final latest_date;
  final unit;
  final dpr1;
  final value;
  final direction;

  DailyByData(
      {this.item_name,
      this.category_name,
      this.latest_date,
      this.unit,
      this.dpr1,
      this.value,
      this.direction});

  factory DailyByData.fromJson(Map<String, dynamic> json) {
    return DailyByData(
        item_name: json['item_name'],
        category_name: json['category_name'],
        unit: json['unit'],
        dpr1: json['dpr1'],
        value: json['value'],
        direction: json['direction']);
  }
}
