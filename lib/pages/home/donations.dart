import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:dogewoof/assets/constants.dart';
import 'package:flutter/services.dart';
import 'package:dogewoof/pages/home/models/donation_model.dart';

class DonationPage extends StatefulWidget {
    const DonationPage({ super.key });
    @override
    State<DonationPage>createState() => _DonationPage();
}

class _DonationPage extends State<DonationPage> {
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        Future<List<Donation>> fetchDonation() async {
            var response = await request.get("$siteUrl/get-all-donations/");
            List<Donation> listDonation = [];
            for (var d in response) {
                if (d != null) {
                    listDonation.add(Donation.fromJson(d));
                }
            }
            return listDonation;
        }
        return Column(
          children: <Widget>[
            const SizedBox(height: 70),
            const Text(
                "Top Donators",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: fetchDonation(),
                    builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());
                        } else {
                            if (!snapshot.hasData) {
                                return Column(
                                    children: const [
                                        Text(
                                            "Be the first to donate!",
                                            style: TextStyle(
                                                color: Color(0xff59A5D8),
                                                fontSize: 20
                                            ),
                                        ),
                                        SizedBox(height: 8),
                                    ],
                                );
                            } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5
                                        ),
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(10.0),
                                            boxShadow: const [
                                                BoxShadow(color: Colors.black, blurRadius: 1.0)
                                            ],
                                        ),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                    "Rp${snapshot.data![index].amount}",
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                    ),
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                    "By ${snapshot.data![index].username}",
                                                    style: const TextStyle(
                                                        fontSize: 13,
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                )
                                            ],
                                        ),
                                    ),
                                );
                            }
                        }
                    }
                ),
            )
          ],
        );
        //   ],
        // );
    }
}
