import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dogewoof/pages/artikel/models/model_artikel.dart';

Future<List<Artikel>> get_model_json() async {
        var url = Uri.parse('https://dogewoof.up.railway.app/artikel/model-json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",

        },
        );

        // print(response.body);
        try {
          var hasilresponse = jsonDecode(response.body);
          var tempList = hasilresponse['data'];

          List<Artikel> artikel = [];

          for(int i = 0; i < tempList.length; i++) {
            Artikel temp = Artikel(
              id: tempList[i]['id'] ?? '',
              name: tempList[i]['name'] ?? '',
              image: tempList[i]['image'] ?? '',
              firstDescription: tempList[i]['first_description'] ?? '',
              secontDescription: tempList[i]['secont_description'] ?? '',
              funfact: Funfact(tinggi: tempList[i]['funfact']['tinggi'] ?? '',
                            berat: tempList[i]['funfact']['tinggi'] ?? '',
                            namaIlmiah:  tempList[i]['funfact']['tinggi'] ?? '',
                            masaHidup:  tempList[i]['funfact']['tinggi'] ?? '',)
            );
            artikel.add(temp);
          }

        // print('zzzzzzzzzzzz');
        // print(artikel.toString());
        
        return artikel;
        }catch (e) {
        //   print('##################');
        //   print(e.toString());
        }
        
        // melakukan konversi data json menjadi object events
        List<Artikel> artikel = [];

        // for (var d in hasilresponse) {
        //   print(d);
        // if (d != null) {
        //     print(Artikel.fromJson(d));
        //     artikel.add(Artikel.fromJson(d));
        //     print(artikel);
        // }
        // }
        
        return artikel;
    }

Future<List<Artikel>> get_dog_detail_json() async {
        var url = Uri.parse('https://dogewoof.up.railway.app/artikel/get-dog-detail-json/');
        var response = await http.get(
        url,
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
        },
        );

        // melakukan decode response menjadi bentuk json
        // print(response.body);
        try {
          var hasilresponse = jsonDecode(response.body);
          var tempList = hasilresponse['data'];

          List<Artikel> artikel = [];

          for(int i = 0; i < tempList.length; i++) {
            Artikel temp = Artikel(
              id: tempList[i]['id'] ?? '',
              name: tempList[i]['name'] ?? '',
              image: tempList[i]['image'] ?? '',
              firstDescription: tempList[i]['first_description'] ?? '',
              secontDescription: tempList[i]['secont_description'] ?? '',
              funfact: Funfact(tinggi: tempList[i]['funfact']['tinggi'] ?? '',
                            berat: tempList[i]['funfact']['tinggi'] ?? '',
                            namaIlmiah:  tempList[i]['funfact']['tinggi'] ?? '',
                            masaHidup:  tempList[i]['funfact']['tinggi'] ?? '',)
            );
            artikel.add(temp);
          }

        // print('zzzzzzzzzzzz');
        // print(artikel.toString());
        
        return artikel;
        }catch (e) {
        //   print('##################');
        //   print(e.toString());
        }
        
        // melakukan konversi data json menjadi object events
        List<Artikel> artikel = [];

        // for (var d in hasilresponse) {
        //   print(d);
        // if (d != null) {
        //     print(Artikel.fromJson(d));
        //     artikel.add(Artikel.fromJson(d));
        //     print(artikel);
        // }
        // }
        
        return artikel;
    }