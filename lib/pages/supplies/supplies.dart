import 'package:dogewoof/pages/supplies/supplies_model.dart';
import 'package:dogewoof/pages/supplies/supplies_parser.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';


class SuppliesPage extends StatefulWidget {
  const SuppliesPage({super.key});
  @override
  State<SuppliesPage> createState() => _SuppliesState();
}

//============Menampilam semua data dari masing-masing product, dihalaman baru============
class DetailSupplies extends StatelessWidget {
  final Product thisProduct;
  const DetailSupplies({Key? key, required this.thisProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Supplies Product')),
      drawer: DrawerWidget(),
      body: Container(
        alignment: Alignment.center,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            thisProduct.fields.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 10),
          Text("Price : " + thisProduct.fields.price),
          const SizedBox(height: 10),
          Text("Description : " + thisProduct.fields.description),
          const SizedBox(height: 10),
          Text("Contact us on : " + thisProduct.fields.contact),
          const SizedBox(height: 10),
          // Text("By : " + thisProduct.fields.user),
          // const SizedBox(height: 10),
        ]),
      ),
      bottomNavigationBar: TextButton(
        child: const Text("Back"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

//============Menyediakan page form untuk menambahkan product============

class SuppliesFormPage extends StatefulWidget {
  const SuppliesFormPage({super.key});

  @override
  State<SuppliesFormPage> createState() => _SuppliesFormPageState();
}

class _SuppliesFormPageState extends State<SuppliesFormPage> {
  final _formKey = GlobalKey<FormState>();
  String title = "";
  String price = "";
  String description = "";
  String contact = "";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset('assets/images/title.png'),
      ),
      // Menambahkan drawer menu
      drawer: DrawerWidget(),
      body: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Sell Your Dog Supplies to DogeWoof',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Product",
                hintText: "Enter your Product",
                icon: const Icon(Icons.add_box),
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  title = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  title = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Product name is required';
                }
                if (value.length >= 200) {
                  return 'Product name is too long!';
                }
                return null;
              },
            ),
          ),
          
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Price",
                hintText: "(Ex : 100.000)",
                icon: const Icon(Icons.money),                    // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  price = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  price = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Price is required!';
                }
                return null;
              },
            ),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "What is your product? why it's intersting?",
                icon: const Icon(Icons.text_format),
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  description = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  description = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Description is required!';
                }
                if (value.length >= 200) {
                  return 'Description is too long!';
                }
                return null;
              },
            ),
          ),
          Padding(
            // Menggunakan padding sebesar 8 pixels
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Contact",
                hintText: "(ex: 085156571359)",
                icon: const Icon(Icons.whatsapp),
                // Menambahkan circular border agar lebih rapi
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              // Menambahkan behavior saat nama diketik
              onChanged: (String? value) {
                setState(() {
                  contact = value!;
                });
              },
              // Menambahkan behavior saat data disimpan
              onSaved: (String? value) {
                setState(() {
                  contact = value!;
                });
              },
              // Validator sebagai validasi form
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Contact is required!';
                }
                return null;
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SuppliesPage()),
                );
              },
              child: const Text("Back")),
          TextButton(
            child: const Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 15,
                      child: Container(
                        child: ListView(
                          padding:
                              const EdgeInsets.only(top: 40, bottom: 24),
                          shrinkWrap: true,
                          children: <Widget>[
                            Center(
                                child: const Text(
                              'Your Product Has Been Added!',
                              style: TextStyle(fontSize: 20),
                            )),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 7, 7, 7),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Still Want Sell Product'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 250, 223, 255),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SuppliesPage()),
                                );
                              },
                              child: Text('Back to Supplies Page'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
                createProduct( title, price, description, contact);
                setState(() {
                  _formKey.currentState?.reset();
                });
              }
            },
          ),
        ]),
      ),
    );
  }
}

//============Page utama menampilkan judul2 product============

class _SuppliesState extends State<SuppliesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Image.asset('assets/images/title.png'),
        ),
        // Menambahkan drawer menu
        drawer: DrawerWidget(),
        bottomNavigationBar: Container( 
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            child: Text('Sell My Product'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SuppliesFormPage()));
            },
          ),
        ),
        body: FutureBuilder(
          future: fetchSupplies(),
          builder: ((context, snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final item = snapshot.data!.elementAt(index);
                    return ListTile(
                      shape: ContinuousRectangleBorder(
                        side: BorderSide(color: Colors.black, width: 1),
                      ),
                      title: Text(item.fields.title),
                      //subtitle: Text(item.fields.category),
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context) => DetailSupplies(thisProduct: item, )));
                      },
                    );
                  },
                );
              } else {
                return Column(
                  children: const [
                    Text("No Product Yet "),
                    SizedBox(height: 8),
                  ],
                );
              }
            }
          }),
        ));
  }
}
