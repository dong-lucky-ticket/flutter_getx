import 'dart:convert';

import 'package:flutter_getx/app/data/model/account.dart';
import 'package:flutter_getx/app/data/model/paginated_data.dart';
import 'package:flutter_getx/app/data/model/response.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class AccountProvider extends GetConnect {

  // Future<Response<CasesModel>> getList(List<int> image) {
 
  //   return post('http://youapi/users/upload', form);
  // }

  Future<ResponseModal<PaginatedData<AccountModal>>> getList() async {
 
    final response = await rootBundle.loadString('assets/json/account_result.json');
    final responseJson = jsonDecode(response);
    final List<AccountModal> data = responseJson['result']['data'].map<AccountModal>((e) => AccountModal.fromMap(e)).toList();
    final PaginatedData<AccountModal> result = PaginatedData(data: data, total: responseJson['result']['total']);
    return ResponseModal(result: result, message: responseJson['message'], success: responseJson['success'], code: responseJson['code']);
  }

  Future<ResponseModal<AccountModal>> getDetail() async {

    Response response = await get('https://mock.presstime.cn/mock/6752fc425750db2bfa560d29/example/account/detail');

    return ResponseModal.fromMap(response.body, (map)=> AccountModal.fromMap(map));
    // final result = AccountModal.fromMap(response.body['result']);
    // return ResponseModal(result: result, message: response.body['message'], success: response.body['success'], code: response.body['code']);
  }
}