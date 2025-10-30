import 'dart:convert';

import 'package:hms_mobile/common/constants/types.dart';
import 'package:http/http.dart';

JSONObject _validate(Response response, String fallbackMessage) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      JSONObject json = jsonDecode(response.body);
      throw json["message"] ?? fallbackMessage;
    }
    return jsonDecode(response.body);
  }


  JSONObject _validateJson(Response response, {required String fallbackMessage}) {
    final json = _validate(response, fallbackMessage);
    return JSONObject.from(json["data"] ?? {});
  }

  JSONList _validateJsonList(Response response, {required String fallbackMessage}) {
    final json = _validate(response, fallbackMessage);
    return JSONList.from(json["data"] ?? []);
  }
