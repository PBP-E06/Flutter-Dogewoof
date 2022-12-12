import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../../assets/environment.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const routeName = "login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  String _username = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset('assets/images/title.png'),
        ),
        drawer: DrawerWidget(),
        body: Form(
            key: _loginFormKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                                Text(
                                    'Login to DogeWoof',
                                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                                ),
                            ],
                        ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Username",
                            hintText: "Enter your username",
                            icon: const Icon(Icons.people),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState((){
                                _username = value!;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Username is required';
                            }
                            return null;
                        },
                    ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                            labelText: "Password",
                            hintText: "Enter your password",
                            icon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                            ),
                        ),
                        onChanged: (String? value) {
                            setState((){
                                _password = value!;
                            });
                        },
                        validator: (String? value) {
                            if (value == null || value.isEmpty) {
                                return 'Username is required';
                            }
                            return null;
                        },
                        obscureText: true,
                    ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Container(
                                margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
                                width: 200,
                                height: 40,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                                    ),
                                    onPressed: () async {
                                        if (_loginFormKey.currentState!.validate()) {
                                            final response = await request.login("$siteUrl/authentication/login/", {
                                                'username': _username,
                                                'password':_password,
                                            });
                                            if (request.loggedIn) {
                                                User.isLogin = true;
                                                Navigator.pushNamed(context, '/');
                                            }
                                            else {
                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                        return Dialog(
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            elevation: 10,
                                                            child: Container(
                                                                child: ListView(
                                                                    padding: const EdgeInsets.only(
                                                                        top: 20, bottom: 20),
                                                                    shrinkWrap: true,
                                                                    children: <Widget>[
                                                                        const Center(
                                                                            child: Text(
                                                                                'Username or Password is wrong',
                                                                                style: TextStyle(
                                                                                    fontSize: 24,
                                                                                    fontWeight: FontWeight.bold
                                                                                ),
                                                                            )
                                                                        ),
                                                                        const SizedBox(height: 20),
                                                                        TextButton(
                                                                            onPressed: () {
                                                                                Navigator.pop(context);
                                                                            },
                                                                            child: const Text('Try again'),
                                                                        )
                                                                    ]
                                                                ),
                                                            ),
                                                        );
                                                    }
                                                );
                                            }
                                        }
                                    },
                                    child: const Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                        ),
                                    ),
                                )
                            ),
                        ],
                    ),
                ]
            ),
        ),
    );
  }
}
