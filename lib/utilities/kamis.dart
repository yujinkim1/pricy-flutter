import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';
import 'package:http/http.dart' as http;
import '../providers/dailyByData.dart';

//MARK: VAILD API KEYS
String key = FlutterConfig.get(key);

String id = FlutterConfig.get(id);

//MARK: 기간 별 품목의 가격 조회 URL
var periodByUrl = Uri.parse(
    "http://www.kamis.or.kr/service/price/xml.do?action=periodProductList");

var dailyByUrl = Uri.parse(
    "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList&p_cert_key=${key}&p_cert_id=${id}&p_returntype=json");
