import 'package:dogewoof/pages/auth/registerpage.dart';
import 'package:dogewoof/pages/home/donations.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:dogewoof/pages/artikel/page/artikel_page.dart';
import 'package:dogewoof/pages/home/homepage.dart';
import 'package:dogewoof/pages/auth/loginpage.dart';
import 'package:dogewoof/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
            CookieRequest request = CookieRequest();
            return request;
        },
        child: MaterialApp(
            title: 'DogeWoof',
            theme: ThemeData(
                primarySwatch: Colors.orange,
            ),
            routes: {
                "/": (BuildContext context) => const HomePage(),
                "/login": (BuildContext context) => const LoginPage(),
                "/register": (BuildContext context) => const RegisterPage(),
                "/artikel": (BuildContext context) => const ArtikelPage(),
            },
        ),
    );
  }
}