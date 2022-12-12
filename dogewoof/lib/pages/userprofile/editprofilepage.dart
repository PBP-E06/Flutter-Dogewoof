import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/pages/userprofile/models/http_stateful.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class EditProfile extends StatelessWidget {
  static const routeName = "editProfile";
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
   final TextEditingController dogtypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

     Future<void> editProfile(
      String bio, String phone, String address, String dogtype) {
    Uri url = Uri.parse(
        "$siteUrl/profile/edit/");
    return request
        .post(
      "$siteUrl/profile/edit/",
      {
        "bio": bio,
        "phone": phone,
        "address": address,
        "dogtype": dogtype,
      }
    );
      
  }

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
             editProfile(
                nameController.text,
                positionController.text,
                imageController.text,
                dogtypeController.text,
              )
                  .then(
                (response) {
                  print("Kembali ke Home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
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
                decoration: InputDecoration(labelText: "Bio"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Phone"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Address"),
                textInputAction: TextInputAction.next,
                controller: imageController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(labelText: "Dogtype"),
                textInputAction: TextInputAction.next,
                controller: dogtypeController,
              ),
              SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: () {
                    editProfile(
                      nameController.text,
                      positionController.text,
                      imageController.text,
                      dogtypeController.text,
                    )
                        .then(
                      (response) {
                        print("Kembali ke Home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
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