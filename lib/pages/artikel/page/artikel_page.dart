import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/assets/environment.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:dogewoof/pages/artikel/api/artikel_get.dart';
import 'package:dogewoof/pages/artikel/page/artikel_detail_page.dart';

import '../../auth/loginpage.dart';
import '../models/model_artikel.dart';

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                 Colors.blue,
                 Colors.red
                ])          
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: FutureBuilder(
        future: get_model_json(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    "Tidak ada Artikel :(",
                    style:
                        TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  Artikel data = snapshot.data[index];
                  return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black, blurRadius: 2.0)
                    ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tipe event --> Talkshow/Workshop
                      
                      Text(
                        "${data.name}",
                        
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Judul Event
                      Text(
                        "${data.firstDescription}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Jarak line spacing
                      Text(
                        "",
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Lokasi event
                      
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 149, 231, 248),
                        minimumSize: const Size.fromHeight(40),
                        ),
                        onPressed: () {
                          if(request.loggedIn) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArtikelDetail(data: snapshot.data![index]))
                          );
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage())
                          );

                        }
                        
                        },
                        child: Text(
                          //enabled: request.loggedIn ? true : false,
                          request.loggedIn ? 'READ MORE' : 'LOGIN FIRST',
                          
                          
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
                }
              );
            }
          }
        }
      )
    );
  }
}