import 'dart:convert' as json;

import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'package:mall/src/parse/parse.dart';

const String parseApplicationName = 'MyApp';
const String parseApplicationId = 'myAppId';
const String parseMasterKey = 'myMasterKey';
//const String parseServerUrl = 'http://localhost:1337/parse';
const String parseServerUrl = 'http://10.0.2.2:1337/parse'; // Android emulator

const String keyVarParseObject = 'parseObject';

Map<String, dynamic> parseObjectToMap(ParseObject object) {
  if (object == null) {
    return null;
  }
  try {
    final Map<String, dynamic> ret = Map<String, dynamic>();
    // ignore: invalid_use_of_protected_member
    ret[keyVarParseObject] = json.jsonEncode(object.toJson(full: true));
    ret[keyVarObjectId] = object.objectId;
    object.updatedAt != null
        ? ret[keyVarUpdatedAt] = object.updatedAt.millisecondsSinceEpoch
        : ret[keyVarCreatedAt] = DateTime.now().millisecondsSinceEpoch;
    return ret;
  } catch (e) {
    return null;
  }
}

User userFromMap(Map<String, dynamic> data) {
  if (data == null) {
    return null;
  }
  try {
    final User ret = User().clone(json.jsonDecode(data[keyVarParseObject]));
    return ret;
  } catch (e) {
    return null;
  }
}
