import 'package:app_flutter/home_page.dart';
import 'package:app_flutter/page1.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Youtude(),
    );
  }
}

class Practice1 extends StatelessWidget {
  const Practice1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: MyAppBar(title: 'Practice 1'),
      appBar: AppBar(
        title: Text('MyApp'),
        titleSpacing: 50,
        centerTitle: true,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 124, 171, 252),
        actions: [
          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Search button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p1');
              //print('Search button clicked.');
            },
            icon: Icon(Icons.search),
          ),
          SizedBox(width: 10),

          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Finish button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p2');
              //print('Close button clicked.');
            },
            icon: Icon(Icons.dangerous_sharp),
          ),
          SizedBox(width: 10),

          IconButton(
            onPressed: () {
              Fluttertoast.showToast(
                msg: "Hello! Settings button clicked.",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              //Navigator.pushNamed(context, '/p3');
              //print('Settings button clicked.');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: 1000.00,
          color: const Color.fromARGB(255, 207, 169, 211),
          child: Center(
            child: Text(
              'Hello Rakib!',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text(
            //     "My Drawer ",
            //     style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            UserAccountsDrawerHeader(
              accountName: Text("Rakib"),
              accountEmail: Text('rakib@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    'assets/logo.png',
                    width: 80.0,
                    height: 80.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              subtitle: Text("Go Home"),
              title: Text("Home"),
              trailing: Icon(Icons.ac_unit_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text("About"),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.account_balance)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.access_alarms_rounded),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.abc_rounded),
      ),

      //drawer: MyDrawer(),
    );
  }
}

class Youtude extends StatefulWidget {
  const Youtude({super.key});

  @override
  State<Youtude> createState() => _YoutudeState();
}

int _currentPage = 0;

final List<Widget> _page = [HomePage(), Page1()];

class _YoutudeState extends State<Youtude> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        currentIndex: _currentPage,
        unselectedItemColor: Colors.grey,

        onTap: (index) {
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.abc_outlined), label: 'out'),
        ],
      ),
    );
  }
}

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;

//   const MyAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer();
//   }
// }
