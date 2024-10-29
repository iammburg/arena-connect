import 'package:arena_connect/config/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Keluar Akun',
                  style: superFont1.copyWith(color: primary),
                ),
                SizedBox(height: 20),
                Text(
                  'Apakah kamu yakin ingin keluar akun kamu saat ini?',
                  textAlign: TextAlign.center,
                  style: regulerFont1.copyWith(color: primary),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Kembali',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Keluar',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showRegisterFieldDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          backgroundColor: white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Daftarkan Lapanganmu',
                  style: superFont1.copyWith(color: primary),
                ),
                SizedBox(height: 20),
                Text(
                  'Apakah Kamu Siap Jadi Owner Lapangan?',
                  textAlign: TextAlign.center,
                  style: regulerFont1.copyWith(color: primary),
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          content: Container(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Kembali',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Daftar',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Tambahkan logika untuk daftar lapangan di sini
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Profile', style: superFont1.copyWith(color: white)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundColor: tertiary,
              child: Icon(
                Icons.person,
                size: 50,
                color: white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Thora`s Times',
              style: superFont1,
            ),
            const SizedBox(height: 5),
            Text(
              'thoraatime@gmail.com',
              style: regulerFont1,
            ),
            const SizedBox(height: 20),
            ProfileOption(
              icon: Icons.person,
              text: 'Ubah Profile',
              selectedItemColor: primary,
              onTap: () {
                // Add your profile editing logic here
              },
              color: primary,
            ),
            ProfileOption(
              icon: Icons.lock,
              text: 'Ubah Password',
              onTap: () {
                // Add password changing logic here
              },
              color: primary,
              selectedItemColor: primary,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                _showRegisterFieldDialog(context);
              },
              style: longButton1,
              child: Text(
                'DAFTARKAN LAPANGANMU',
                style: buttonFont1,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              style: longButton1,
              child: Text(
                'KELUAR',
                style: buttonFont1,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF12215c),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: Color(0xFF12215c)),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProfileOption extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color color;

  ProfileOption({
    required this.icon,
    required this.text,
    required this.onTap,
    required this.color,
    required Color selectedItemColor,
  });

  @override
  _ProfileOptionState createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  Color arrowColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            arrowColor = primary;
          });
        },
        onExit: (event) {
          setState(() {
            arrowColor = Colors.grey;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: tertiary),
          ),
          child: Row(
            children: <Widget>[
              Icon(widget.icon, color: primary),
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: superFont2,
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16, color: arrowColor),
            ],
          ),
        ),
      ),
    );
  }
}
