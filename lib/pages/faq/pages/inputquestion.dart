import 'package:flutter/widgets.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class FAQInputPage extends StatefulWidget {
  const FAQInputPage({super.key});
  static const routeName = "inputquestion";
  
  @override
  State<FAQInputPage> createState() =>  _FAQInputPageState();
}

class _FAQInputPageState extends State<FAQInputPage> {
  String _question = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset('assets/images/title.png'),
      ),
      drawer: DrawerWidget(),
      body: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                      'Add Question',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Question",
                  hintText: "Enter your question here",
                  icon: const Icon(Icons.question_mark),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                // Menambahkan behavior saat nama diketik
                onChanged: (String? value) {
                  setState(() {
                    _question = value!;
                  });
                },
                // Menambahkan behavior saat data disimpan
                onSaved: (String? value) {
                  setState(() {
                    _question = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul tidak boleh kosong!';
                  }
                  return null;
                }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
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
                      Navigator.pushNamed(context, '/faqhome');
                    },
                    child: const Text(
                      'Add',
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
          ],
        ),
      ),
    );
  }
}