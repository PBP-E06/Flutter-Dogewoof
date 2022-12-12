import 'package:dogewoof/pages/faq/util/fetch.dart';
import 'package:flutter/widgets.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class FAQHomepage extends StatefulWidget {
  const FAQHomepage({super.key});
  static const routeName = "faqhome";
  
  @override
  State<FAQHomepage> createState() =>  _FAQHomepageState();
}

class _FAQHomepageState extends State<FAQHomepage> {

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                      'Frequently Asked Questions',
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
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
                      Navigator.pushNamed(context, '/inputquestions');
                    },
                    child: const Text(
                      'Add Question',
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
            Container(
              margin: const EdgeInsets.fromLTRB(5, 10, 5, 0),
              width: 200,
              height: 500,
              child: FutureBuilder(
                future: fetchFAQ(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  else if (!snapshot.hasData) {
                     {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada pertanyaan :(",
                            style: TextStyle(
                              color: Color(0xff59A5D8), fontSize: 20
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    }
                  }
                  else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(255, 174, 197, 230),
                                  blurRadius: 2.0
                              )
                            ]
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${snapshot.data![index].question}",
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,  
                                  color:
                                    Color.fromARGB(255, 60, 126, 226
                                  )
                                ),
                              ),
                            ]
                          ),
                        ),
                      ),
                    );      
                  }
                },
              ),
            ) 
          ],
        ),    
      ),
    );
  }
}