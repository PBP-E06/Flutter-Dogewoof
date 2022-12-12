import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/services.dart';

import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/pages/home/models/feedback_model.dart';

class FeedbackPage extends StatefulWidget {
    const FeedbackPage({ super.key });
    @override
    State<FeedbackPage>createState() => _FeedbackPage();
}

class _FeedbackPage extends State<FeedbackPage> {
    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        Future<List<FeedbackModel>> fetchFeedback() async {
            var response = await request.get("$siteUrl/get-contact-us/");
            List<FeedbackModel> listFeedback = [];
            for (var d in response) {
                if (d != null) {
                    listFeedback.add(FeedbackModel.fromJson(d));
                }
            }
            return listFeedback;
        }
        return Column(
          children: <Widget>[
            const SizedBox(height: 70),
            const Text(
                "Your Feedbacks",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: fetchFeedback(),
                    builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                            return const Center(child: CircularProgressIndicator());
                        } else {
                            if (!snapshot.hasData) {
                                return Column(
                                    children: const [
                                        Text(
                                            "Be the first to post a feedback!",
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
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                        Text(
                                                            "By ${snapshot.data![index].username}",
                                                            style: const TextStyle(
                                                                fontSize: 13.0,
                                                                fontWeight: FontWeight.bold
                                                            ),
                                                        ),
                                                        Text(
                                                            "${snapshot.data![index].date}",
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                            )
                                                        ),
                                                    ]
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            "Subject: ${snapshot.data![index].subject}",
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                                const SizedBox(height: 5),
                                                Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                        Text(
                                                            "${snapshot.data![index].description}",
                                                            style: const TextStyle(
                                                                fontSize: 13,
                                                            ),
                                                        ),
                                                    ],
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
