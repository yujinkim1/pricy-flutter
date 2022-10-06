import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/dailyByData.dart';

const String productClassCode = "01";

//MARK: Test 중에만 invaild, Release 후 vaild file 적용
const String key = "6117adaa-7486-4ac3-933d-489d2599d0a9";

const String id = "2797";
//MARK: 기간 별 품목의 가격 조회 URL
var periodByUrl = Uri.parse(
    "http://www.kamis.or.kr/service/price/xml.do?action=periodProductList");

var dailyByUrl = Uri.parse(
    "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList&p_cert_key=${key}&p_cert_id=${id}&p_returntype=xml");

//MARK: GET
Future<Post> fetchPost() async {
  final response = await http.get(periodByUrl);
  //MARK: isResponseStatusCorrect
  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    //MARK: 이전 Response 데이터 표기
    throw Exception('Failed to load post');
  }
}

//MARK: POST Class
class Post {
  final item_name;
  final category_name;
  final latest_date;
  final unit;
  final dpr1;
  final dpr2;
  Post(
      {this.item_name,
      this.category_name,
      this.latest_date,
      this.unit,
      this.dpr1,
      this.dpr2});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        item_name: json['item_name'],
        category_name: json['category_name'],
        unit: json['unit'],
        dpr1: json['dpr1'],
        dpr2: json['dpr2']);
  }
}
