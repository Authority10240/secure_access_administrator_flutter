import 'dart:convert';

import 'package:dio/dio.dart';

import 'base_failure.dart';


class ApiException extends BaseFailure {
  ApiException({required DioException dioException}) {
    Map<String, dynamic> error = json
        .decode(dioException.response!.data as String) as Map<String, dynamic>;
    message = error['message'] as String;
    errorCode = error['errorCode'] as String;
  }
}
