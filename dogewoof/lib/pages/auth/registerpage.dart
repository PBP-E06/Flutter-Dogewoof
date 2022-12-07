import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});
    static const routeName = "register";

    @override
    State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final _registerFormKey = GlobalKey<FormState>();

    String _email = "";
    String _username = "";
    String _password1 = "";
    String _password2 = "";

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
                key: _registerFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                    Text(
                                        'Register to DogeWoof',
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
                                    labelText: "Email",
                                    hintText: "Enter your email",
                                    icon: const Icon(Icons.people),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState((){
                                        _email = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Email is required';
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
                                        _password1 = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                    }
                                    return null;
                                },
                                obscureText: true,
                            ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                                decoration: InputDecoration(
                                    labelText: "Confirm Your Password",
                                    hintText: "Enter your password",
                                    icon: const Icon(Icons.lock),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                    ),
                                ),
                                onChanged: (String? value) {
                                    setState((){
                                        _password2 = value!;
                                    });
                                },
                                validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                        return 'Password is required';
                                    }
                                    if (value != _password1) {
                                        return 'Password does not match';
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
                                            if (_registerFormKey.currentState!.validate()) {
                                                final response = await request.post("$siteUrl/authentication/register/", {
                                                    'username': _username,
                                                    'password1': _password1,
                                                    'password2': _password2,
                                                    'email': _email,
                                                });
                                                if (response['status'] ==   true) {
                                                    Navigator.pushNamed(context, '/login');
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
                                                                                    'Username and Password not valid',
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
                                            'Register',
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
