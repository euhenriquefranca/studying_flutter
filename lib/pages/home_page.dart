import 'package:flutter/material.dart';
import 'pageViews/one_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Henrique'),
            accountEmail: Text('euhenriquefranca@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.greenAccent,
              child: Text('H'),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _pageController.jumpToPage(0);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 0;
              });
            },
          ),
          ListTile(
            title: Text('Item 2'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _pageController.jumpToPage(1);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 1;
              });
            },
          ),
          ListTile(
            title: Text('Item 3'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _pageController.jumpToPage(2);
              Navigator.pop(context);
              setState(() {
                indexBottomNavigationBar = 2;
              });
            },
          ),
        ],
      )),
      body: PageView(controller: _pageController, children: [
        OnePage(),
        Container(color: Colors.red),
        Container(color: Colors.yellow),
      ]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigationBar,
          onTap: (int page) => {
                setState(() {
                  indexBottomNavigationBar = page;
                }),
                _pageController.animateToPage(
                  page,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                ),
              },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_sharp),
              label: 'Item 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_sharp),
              label: 'Item 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_sharp),
              label: 'Item 3',
            )
          ]),
    );
  }
}
