

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/pages/userprofile/models/http_stateful.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class AddSaldo extends StatelessWidget {
  static const routeName = "addSaldo";
  final TextEditingController saldoController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    Future<void> addSaldo(int saldo) {
      Uri url = Uri.parse("$siteUrl/profile/saldo/");
      return request.post("$siteUrl/profile/saldo/", {
        "saldo": "$saldo",
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              addSaldo(
                int.parse(saldoController.text),
              ).then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Saldo Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(labelText: "Jumlah Saldo"),
                textInputAction: TextInputAction.next,
                controller: saldoController,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    addSaldo(
                      int.parse(saldoController.text)
                    ).then(
                      (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Saldo Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
