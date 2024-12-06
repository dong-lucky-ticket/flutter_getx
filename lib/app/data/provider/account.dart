import 'dart:convert';

import 'package:app_demo/app/data/model/account.dart';
import 'package:app_demo/app/data/model/paginated_data.dart';
import 'package:app_demo/app/data/model/response.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class AccountApi extends GetConnect {

  // Future<Response<CasesModel>> getList(List<int> image) {
 
  //   return post('http://youapi/users/upload', form);
  // }

  static Future<ResponseModal<PaginatedData<AccountModal>>> getList() async {
 
    final response = await rootBundle.loadString('assets/json/account_result.json');
    final responseJson = jsonDecode(response);
    final List<AccountModal> data = responseJson['result']['data'].map((e) => AccountModal.fromMap(e)).toList();
    final PaginatedData<AccountModal> result = PaginatedData(data: data, total: responseJson['result']['total']);
    return ResponseModal(result: result, message: responseJson['message'], success: responseJson['success'], code: responseJson['code']);
  }
}