import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:flutter/services.dart';

class HomeState extends StatefulWidget {
    const HomeState({ super.key });
    @override
    State<HomeState>createState() => _Home();
}

class _Home extends State<HomeState> {
    final _donationFormKey = GlobalKey<FormState>();
    var clearTextFields = TextEditingController();
    int totalDonation = 0;
    int inputDonation = 0;

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        Future<void> getDonation() async {
            final response = await request.get("$siteUrl/get-donation-sum/");
            if (totalDonation == response['total']['amount__sum']) {
                return;
            }
            setState(() {
              totalDonation = response['total']['amount__sum'];
            });
        }

        getDonation();

        return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Stack(
                        children: [
                            Container(
                                height: 600,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage('assets/images/homepage.jpg'),
                                        fit: BoxFit.cover,
                                    )
                                ),
                            ),
                            const Positioned.fill(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                        'Find Your Loyal Companion',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                        ),             
                                        textAlign: TextAlign.center,
                                    ),
                                ),
                            ),
                        ]
                    ),
                    const SizedBox(height: 20),
                    Center(
                        child: Column(
                            children: [
                                const Text(
                                    'Lend A Helping Hand',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    )
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 8),
                                    child: Container(
                                        height: 350,
                                        width: 300,
                                        color: Colors.black,
                                        child: Column(
                                            children: [
                                                const Padding(
                                                padding: EdgeInsets.only(top: 30),
                                                child: Text(
                                                    'Donation Received',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 27,
                                                    ),
                                                ),
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(top: 30),
                                                    child: Text(
                                                        "Rp$totalDonation",
                                                        style: const TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 30,
                                                            fontWeight: FontWeight.bold,
                                                        ),
                                                    ),
                                                ),
                                                Form(
                                                    key: _donationFormKey,
                                                    child: Column(
                                                        children: [
                                                        Padding(
                                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                                                            child: TextFormField(
                                                                enabled: request.loggedIn ? true : false,
                                                                style: const TextStyle(
                                                                    fontSize: 18,
                                                                ),
                                                                controller: clearTextFields,
                                                                keyboardType: TextInputType.number,
                                                                inputFormatters: <TextInputFormatter>[
                                                                    FilteringTextInputFormatter.digitsOnly
                                                                ],
                                                                decoration: InputDecoration(
                                                                    filled: true,
                                                                    fillColor: Colors.white,
                                                                    hintText: request.loggedIn ? 'Enter donation amount' : 'You have to login first',
                                                                    border: OutlineInputBorder(
                                                                        borderRadius: BorderRadius.circular(5.0)
                                                                    ),
                                                                    icon: const Icon(Icons.money, color: Colors.white,)
                                                                ),
                                                                onChanged: (String? value) {
                                                                    if (value == ""){
                                                                        return;
                                                                    }
                                                                    setState(() {
                                                                        inputDonation = int.parse(value!);
                                                                    });
                                                                },
                                                                onSaved: (String? value) {
                                                                    setState(() {
                                                                        inputDonation = int.parse(value!);
                                                                    });
                                                                },
                                                                validator: (String? value) {
                                                                    if (value == "") {
                                                                        return "You must input something";
                                                                    }
                                                                    return null;
                                                                }
                                                            ),
                                                        ),
                                                        Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                                Container(
                                                                    margin: const EdgeInsets.all(5),
                                                                    width: 200,
                                                                    height: 40,
                                                                    child: ElevatedButton(
                                                                        style: ButtonStyle(
                                                                            backgroundColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                                                            side: MaterialStateProperty.all(
                                                                                const BorderSide(
                                                                                    color: Colors.white,
                                                                                    width: 1
                                                                                )
                                                                            )
                                                                        ),
                                                                        onPressed: request.loggedIn ? () async {
                                                                            if (_donationFormKey.currentState!.validate()) {
                                                                                final response = await request.post("$siteUrl/make-donation/", {
                                                                                    "amount": "$inputDonation",
                                                                                });
                                                                                clearTextFields.clear();
                                                                                getDonation();
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
                                                                                                                'Donation Received! Thank you',
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
                                                                                                            child: const Text('Return'),
                                                                                                        )
                                                                                                    ]
                                                                                                ),
                                                                                            ),
                                                                                        );
                                                                                    }
                                                                                );
                                                                            }
                                                                        } : null,
                                                                        child: Text(
                                                                            request.loggedIn ? 'MAKE A DIFFERENCE' : 'LOGIN FIRST',
                                                                            style: const TextStyle(
                                                                                color: Colors.white,
                                                                                fontSize: 15,
                                                                            ),
                                                                        ),
                                                                    )
                                                                ),
                                                            ],
                                                        ),
                                                        ],
                                                    ),
                                                ),
                                            ],
                                        )
                                    ),
                                ),
                            ],
                        ),
                    )
                ],
            )
        );
    }
}
