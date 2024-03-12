import 'package:flutter/material.dart';
import 'package:qrbats/pages/home_page.dart';

class MainPage extends StatefulWidget {
  final int pageIndex;
  const MainPage({Key? key, this.pageIndex=0}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Add your other pages to this list
  List<Widget> pages = [
    Home(),
    // Add more pages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Sky Ticker",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF086494),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Color(0xFF086494),
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(
              Icons.logout,
              color: Color(0xFF086494),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF086494),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Smart Garden',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              leading: Icon(Icons.account_circle,color: Color(0xFF086494),size: 35,),
              title: Text('Profile',style: TextStyle(color: Color(0xFF086494),fontSize: 20),),
              onTap: () {
                // Handle drawer item 1
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage(pageIndex: 3,)),
                );
                // Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings,color: Color(0xFF086494),size: 35,),
              title: Text('Settings',style: TextStyle(color: Color(0xFF086494),fontSize: 20),),
              onTap: () {
                // Handle drawer item 2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage(pageIndex: 4,)),
                );
                //Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.logout,color: Color(0xFF086494),size: 35,),
              title: Text('Logout',style: TextStyle(color: Color(0xFF086494),fontSize: 20)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
            // Add more list items as needed
          ],
        ),
      ),
      endDrawer: Drawer(
        // Add content for endDrawer
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xFF086494),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books),
            label: 'Module',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR-Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Shedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body:pages[_currentIndex],

    );
  }
}
