import 'package:flutter_config/flutter_config.dart';
/*MARK: HIDE CERTIFICATE KEYS FROM .env
  key ? FlutterConfig.get('key');

  id ? FlutterConfig.get('id');
*/

//MARK: PERIOD BY PRICE DATA TO USING KAMIS URL
var periodByUrl = Uri.parse(
    "http://www.kamis.or.kr/service/price/xml.do?action=periodProductList");

var dailyByUrl = Uri.parse(
    "http://www.kamis.co.kr/service/price/xml.do?action=dailySalesList&p_cert_key=${FlutterConfig.get('key')}&p_cert_id=${FlutterConfig.get('id')}&p_returntype=json");
