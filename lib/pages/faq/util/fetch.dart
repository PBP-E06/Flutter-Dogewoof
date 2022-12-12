import 'package:dogewoof/pages/faq/models/faq.dart';
import 'package:dogewoof/pages/faq/models/faq.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<FAQ>> fetchFAQ(CookieRequest request) async {
  var url = Uri.parse(
      'https://dogewoof.up.railway.app/faq/json/');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<FAQ> listQuestion = [];
  for (var d in data) {
    if (d != null) {
      listQuestion.add(FAQ.fromJson(d));
    }
  }

  return listQuestion;
}

addFAQ(request, question) async {
  var response = await request.post(
    '',
    {"question": question}
  );
  return response;
}