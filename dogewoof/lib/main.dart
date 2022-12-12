import 'package:dogewoof/pages/auth/registerpage.dart';
import 'package:dogewoof/pages/home/donations.dart';
import 'package:dogewoof/pages/supplies/supplies.dart';
import 'package:dogewoof/pages/userprofile/editprofilepage.dart';
import 'package:dogewoof/pages/userprofile/profilepage.dart';
import 'package:dogewoof/pages/userprofile/tambahsaldopage.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'package:dogewoof/pages/home/homepage.dart';
import 'package:dogewoof/pages/auth/loginpage.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:dogewoof/pages/userprofile/profilepage.dart';
import 'package:dogewoof/pages/userprofile/editprofilepage.dart';
import 'package:dogewoof/pages/artikel/page/artikel_page.dart';


import 'pages/faq/pages/faqhomepage.dart';
import 'pages/faq/pages/inputquestion.dart';

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
            "/profile": (BuildContext context) => const HomeStateful(),
            "/editProfile": (BuildContext context) => EditProfile(),
            "/addSaldo": (BuildContext context) => AddSaldo(),
            "/supplies": (BuildContext context) => const SuppliesPage(),
            "/faqhome": (BuildContext context) => const FAQHomepage(),
            "/inputquestions": (BuildContext context) => const FAQInputPage(),
            "/artikel": (BuildContext context) => const ArtikelPage(),
        },
      ),
    );
  }
}