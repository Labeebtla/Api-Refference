import 'dart:convert';

import 'package:app_1/number_fact_resp/number_fact_resp.dart';
import 'package:http/http.dart';

Future<NumberFactResp> getNumberFact({required String number}) async {
  final _response = await get(Uri.parse('http://numbersapi.com/$number?json'));
  final _bodyAsJson = jsonDecode(_response.body) as Map<String, dynamic>;
  final _data = NumberFactResp.fromJson(_bodyAsJson);
  return _data;
}
