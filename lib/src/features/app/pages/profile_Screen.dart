import 'package:flutter/material.dart';
import 'package:loginsys/src/constants/colors.dart';
import 'package:loginsys/src/constants/image_string.dart';
import 'package:loginsys/src/constants/text_string.dart';
import 'package:loginsys/src/features/app/pages/post_Screen.dart';

import '../widgets/user_activity_info.dart';
import '../widgets/user_info_widget.dart';
import '../widgets/user_profile_image.dart';
import 'articles_Screen.dart';
import 'gallery_Screen.dart';

class MyHomePage1 extends StatefulWidget {
  final String title;            
  const MyHomePage1({Key ? key, required this.title}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage1> {
  int _selectedEvent = 0;

  List<Widget> _pages = [GalleryScreen(), PostScreen(), ArticlesScreen()];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.menu, color: Colors.black),
        title: Text(
          tAppname,
          style: Theme.of(context).textTheme.headline4,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyHomePage1(title: '',)));
                },
                icon: Image(image: const AssetImage(tUserprofileImage))),
          )
        ],
      ),
      // set icon color of drawer black
      drawer: Drawer(
        backgroundColor: Colors.grey.shade100,
        elevation: 10,
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildUserImage(size),

              // * 3 user Name
              buildUserInfo(),

              //* 4 total no. of posts, followers, following (Row Widget)
              buildUserActivity(),

              // * 5 follow and message button (Row widget)
              buildUserEvents(size),

              // *
              _pages[_selectedEvent],
            ],
          ),
        ),
      ),
    );
  }

  

  Container buildUserEvents(Size size) {
    return Container(
      // color: Colors.grey.shade100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 0 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 0;
                  });
                },
                child: Text("Gallery",
                    style: TextStyle(
                      color: _selectedEvent == 0
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 1 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 1;
                  });
                },
                child: Text("Posts",
                    style: TextStyle(
                      color: _selectedEvent == 1
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: size.width / 1.8,
              padding: EdgeInsets.all(8),
              child: MaterialButton(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue.shade700)),
                color:
                    _selectedEvent == 2 ? Colors.blue.shade700 : Colors.white,
                onPressed: () {
                  setState(() {
                    _selectedEvent = 2;
                  });
                },
                child: Text("Articles",
                    style: TextStyle(
                      color: _selectedEvent == 2
                          ? Colors.white
                          : Colors.blue.shade700,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
