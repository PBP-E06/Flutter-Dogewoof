import 'package:dogewoof/assets/constants.dart';
import 'package:dogewoof/pages/dogmarket/models/dogitem_model.dart';
import 'package:dogewoof/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ListingPage extends StatefulWidget {
  const ListingPage({super.key});
  @override
  State<ListingPage> createState() => _ListingPage();
}

class _ListingPage extends State<ListingPage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    List _list_dog = List.empty();

    Future<List<DogItem>> getDogList() async {
      var response = await request.get("$siteUrl/get-contact-us/");
      List<DogItem> listFeedback = [];
      for (var d in response) {
        if (d != null) {
          listFeedback.add(DogItem.fromJson(d));
        }
      }
      _list_dog = await getDogList();
      return listFeedback;
    }

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: _list_dog.length,
            itemBuilder: (BuildContext context, int index) {
              final _item = _list_dog[index];
              return Container(
                height: 136,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFFE0E0E0)),
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _item.item_title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text("${_item.price} · ${_item.breed}",
                            style: Theme.of(context).textTheme.caption),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icons.bookmark_border_rounded,
                            Icons.share,
                            Icons.more_vert
                          ].map((e) {
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(e, size: 16),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    )),
                    Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(_item.imageUrl),
                            ))),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
