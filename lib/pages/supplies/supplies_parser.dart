import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'supplies_model.dart';

Future<List<Product>> fetchSupplies() async {
  var url = Uri.parse('https://dogewoof.up.railway.app/supplies/json/');
  var response = await http.get(
    url
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object MyWatchList
  List<Product> listWatchList = [];
  for (var d in data) {
    if (d != null) {
      listWatchList.add(Product.fromJson(d));
    }
  }

  return listWatchList;
}

void createProduct( String title, String price, String description, String contact) async {
  final response = await http
      .post(Uri.parse('https://dogewoof.up.railway.app/supplies/json/'), body: {
    'title': title,
    'price': price,
    'description': description,
    'contact': contact,
  });
}
