import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../providers/dailyByData.dart';

//MARK: Test 중에만 invaild, Release 후 vaild file 적용
const String key = "6117adaa-7486-4ac3-933d-489d2599d0a9";

const String id = "2797";

//MARK: 기간 별 품목의 가격 조회 URL
var periodByUrl = Uri.parse(
    "http://www.kamis.or.kr/service/price/xml.do?action=periodProductList");

var dailyByUrl = Uri.parse(
    "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList&p_cert_key=${key}&p_cert_id=${id}&p_returntype=json");
