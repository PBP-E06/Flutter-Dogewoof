import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'package:dogewoof/widgets/drawer.dart';
import 'package:dogewoof/pages/home/home.dart';
import 'package:dogewoof/pages/home/donations.dart';
import 'package:dogewoof/assets/constants.dart';

class HomePage extends StatefulWidget {
    const HomePage({ super.key });
    static const routeName = "home";
    final String title = "DogeWoof";

    @override
    State<HomePage>createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
    int _selectedIndex = 0;

    static const List<Widget> _widgetOptions = <Widget>[
        HomeState(),
        DonationPage(),
        Text(
            "Coming soon"
        )
    ];

    void _onItemTapped(int index) {
        setState(() {
        _selectedIndex = index;
        });
    }
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Image.asset('assets/images/title.png'),
            ),
            drawer: DrawerWidget(),
            body: Container(
                child: _widgetOptions.elementAt(_selectedIndex)
            ),
            bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.savings),
                        label: 'Donations',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.comment),
                        label: 'Feedback',
                    ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.amber[800],
                onTap: _onItemTapped,
            ),
        );
    }
}