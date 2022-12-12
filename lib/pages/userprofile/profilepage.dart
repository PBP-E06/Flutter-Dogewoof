import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:dogewoof/pages/userprofile/models/http_stateful.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:dogewoof/assets/constants.dart';

import 'editprofilepage.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});
  static const routeName = "profile";

  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  String username = "";
  String bio = "";
  String address = "";
  String dogtype = "";
  String image = "";
  int saldo = 0;
  String phone = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    Future<void> connectAPI() async {
      var hasilResponse = await request.get("$siteUrl/profile/");

    //   print(hasilResponse);

      setState(() {
        username = hasilResponse['data']['username'];
        bio = hasilResponse['data']['bio'];
        image = hasilResponse['data']['image'];
        address = hasilResponse['data']['address'];
        dogtype = hasilResponse['data']['dogtype'];
        saldo = hasilResponse['data']['saldo'];
        phone = hasilResponse['data']['phone'];
      });

      return;
    }

    connectAPI();
    

    return Scaffold(
      appBar: AppBar(
        title: Text("$username" + " profile page"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Image.network(
                  siteUrl + image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            FittedBox(
                child: Text("Username : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$username",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            FittedBox(child: Text("Bio : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$bio",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            FittedBox(
                child: Text("Address : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$address",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 10),
            FittedBox(
                child: Text("Dogtype : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$dogtype",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children:[
            SizedBox(height: 10),
            FittedBox(child: Text("Saldo : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$saldo",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
                  width: 20,
                  height: 20,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {Navigator.pushNamed(context, '/addSaldo');},
                    child: const Icon(Icons.add)
                  ),
                ),
                
                
            ],
            ),
            
            SizedBox(height: 10),
            FittedBox(child: Text("phone : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                "$phone",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/editProfile');
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit Profile')),
          ],
        ),
      ),
    );
  }
}
