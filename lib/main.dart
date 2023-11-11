import 'package:flutter/material.dart';

void main() {
  runApp(TrackingApp());
}

class TrackingApp extends StatefulWidget {
  @override
  _TrackingAppState createState() => _TrackingAppState();
}

class _TrackingAppState extends State<TrackingApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AnotherPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tracking App'),
        ),
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
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
              icon: Icon(Icons.business),
              label: 'Other',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sehat.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: statusBarHeight + 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'This is my mobile programming Middle Test About Tracking Data Lokasi Layanan Isolasi Mandiri',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  final List<List<TextEditingController>> controllers = List.generate(
    10,
        (_) => List.generate(3, (_) => TextEditingController()),
  );

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    for (var row in controllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: List.generate(10, (rowIndex) {
            return TableRow(
              children: List.generate(3, (columnIndex) {
                return TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controllers[rowIndex][columnIndex],
                      onChanged: (text) {
                        // Handle text changes here
                        print('Text changed: $text');
                        // You can save the text to a database or other storage here
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: columnIndex == 0 ? '' : 'Row ${rowIndex + 1}, Column $columnIndex',
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final List<List<TextEditingController>> controllers = List.generate(
    5,
        (_) => List.generate(3, (_) => TextEditingController()),
  );

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    for (var row in controllers) {
      for (var controller in row) {
        controller.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: List.generate(5, (rowIndex) {
            return TableRow(
              children: List.generate(3, (columnIndex) {
                return TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controllers[rowIndex][columnIndex],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: columnIndex == 0 ? '' : 'Row ${rowIndex}, Column $columnIndex',
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(
        child: Text('This is the Menu Page'),
      ),
    );
  }
}


class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Text(
              'Anda Bisa Memilih!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildIconButton(
                  Icons.local_hospital,
                  'Tempat Layanan',
                  Colors.blue,
                      () {
                    // Navigate to the ServicePage when the icon is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ServicePage()),
                    );
                  },
                ),
                _buildIconButton(
                  Icons.location_on,
                  'Lokasi',
                  Colors.green,
                      () {
                    // Navigate to the LocationPage when the icon is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LocationPage()),
                    );
                  },
                ),
                _buildIconButton(
                  Icons.more_vert,
                  'Menu',
                  Colors.yellow,
                      () {
                    // Navigate to the MenuPage when the icon is clicked
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: IconButton(
            icon: Icon(icon),
            color: Colors.white,
            onPressed: onPressed,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage('assets/images/poto.jpeg'),
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
            ),
          ),
          SizedBox(height: 25),
          Text('Nama : Fachreyn Nurika Fitri'),
          Text('NIM  : 20210801258'),
          Text('Prodi : Teknik Informatika'),
          Text('Fakultas : Ilmu Komputer'),
        ],
      ),
    );
  }
}
