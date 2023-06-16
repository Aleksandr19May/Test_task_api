import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import 'package:test_task_api/model.dart';

class NetworkManager {
  static const _url =
      "https://nastintesthodl.stocrm.ru/api/external/v1/offers/get_from_filter?SID=10813_0c0a9a2f86eab09196705a274378b64a&&FILTER[BOARD_ID][1]=1843";

  const NetworkManager();

  Future<List<Info>> getData() async {
    final uri = Uri.parse(_url);
    final repsonse = await get(uri);
    if (repsonse.statusCode == 200) {
      final body = repsonse.body;

      final json = jsonDecode(body) as Map<String, dynamic>;

      final List<dynamic> list = json['RESPONSE']['DATA'] as List<dynamic>;

      List<Info> listInfo = [];

      for (int i = 0; i < list.length; i++) {
        final info = Info.fromJson(list[i]);
        listInfo.add(info);
      }

      return listInfo;
    }
    throw ArgumentError();
  }
}
