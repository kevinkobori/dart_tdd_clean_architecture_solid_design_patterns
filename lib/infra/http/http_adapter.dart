import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../data/http/http.dart';

class HttpAdapter implements HttpClient {
  final Client client;

  HttpAdapter({this.client});

  Future<Map> request(
      {@required String url, @required String method, Map body}) async {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    final jsonBody = body == null ? null : jsonEncode(body);
    final response =
        await client.post(Uri.parse(url), headers: headers, body: jsonBody);
    if (response.statusCode == 200)
      return response.body.isEmpty ? null : jsonDecode(response.body);
    else
      return null;
  }
}
