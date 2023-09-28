import 'package:flutter/material.dart';
import 'package:flutter_apk/Culcluter.dart';
import 'package:flutter_apk/Login_Page.dart';
import 'package:flutter_apk/Music_Player.dart';
import 'package:flutter_apk/mult..dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome App',
      home: WelcomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/about': (context) => AboutPage(),
        '/settings': (context) => SettingsPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        backgroundColor: Colors.black,
        title: Text(
          'Welcome',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome Let's Start",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text('Start',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Color.fromARGB(255, 23, 19, 5))),
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(221, 224, 199, 199),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color.fromARGB(255, 75, 10, 135),
      ),
      body: const Center(
        child: Text(
          'صفحة البداية',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color.fromARGB(255, 75, 10, 135)),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info, color: Color.fromARGB(255, 75, 10, 135)),
            label: 'حول',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color.fromARGB(255, 75, 10, 135)),
            label: 'الإعدادات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color.fromARGB(255, 75, 10, 135)),
            label: 'الملف الشخصي',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/about');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Murad"),
              accountEmail: Text("aaa@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text("M"),
              ),
            ),
            ListTile(
              title:
                  Text("Login", style: TextStyle(fontWeight: FontWeight.w900)),
              leading: Icon(Icons.login),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
            ListTile(
              title:
                  Text("mult", style: TextStyle(fontWeight: FontWeight.w900)),
              leading: Icon(Icons.star_border),
              onTap: () {
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => FilterPage()));
              },
            ),
            ListTile(
              title: Text("Culcliter",
                  style: TextStyle(fontWeight: FontWeight.w900)),
              leading: Icon(Icons.multiline_chart_sharp),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CalculatorPage()));
              },
            ),
            ListTile(
              title: Text("Music_Player",
                  style: TextStyle(fontWeight: FontWeight.w900)),
              leading: Icon(Icons.music_note),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AudioPlayerPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('About'),
          backgroundColor: Color.fromARGB(255, 75, 10, 135)),
      body: const Center(
        child: Text(
          'حول التطبيق',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Settings'),
          backgroundColor: Color.fromARGB(255, 75, 10, 135)),
      body: const Center(
        child: Text(
          'صفحة الإعدادات',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Color.fromARGB(255, 75, 10, 135)),
      body: const Center(
        child: Text(
          'صفحة الملف الشخصي',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
