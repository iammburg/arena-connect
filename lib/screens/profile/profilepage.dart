import 'dart:convert';
import 'package:arena_connect/api/api_service.dart';
import 'package:arena_connect/homescreen.dart';
import 'package:http/http.dart' as http;
import 'package:arena_connect/screens/edit_password/edit_password.dart';
import 'package:arena_connect/screens/profile/change_profile.dart';
import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = '';
  String userEmail = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserProfile();
  }

  Future<void> _getUserProfile() async {
    final token = await ApiService().getToken();
    if (token != null) {
      final response = await ApiService().getUserProfile(token);
      if (response['success']) {
        setState(() {
          userName = response['data']['name'];
          userEmail = response['data']['email'];
          isLoading = false;
        });
      }
    }
  }

  void _showJoinAsOwnerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Daftarkan Lapanganmu',
                  style: superFont1.copyWith(color: primary),
                ),
                const SizedBox(height: 20),
                Text(
                  'Apakah kamu siap menjadi owner lapangan?',
                  textAlign: TextAlign.center,
                  style: regulerFont1.copyWith(color: primary),
                ),
              ],
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          content: SizedBox(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 115,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
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
                    const SizedBox(width: 4),
                    Container(
                      height: 40,
                      width: 115,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Daftar',
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

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Keluar Akun',
                  style: superFont1.copyWith(color: primary),
                ),
                const SizedBox(height: 20),
                Text(
                  'Apakah kamu yakin ingin keluar akun kamu saat ini?',
                  textAlign: TextAlign.center,
                  style: regulerFont1.copyWith(color: primary),
                ),
              ],
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          content: SizedBox(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 115,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Keluar',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 40,
                      width: 115,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          'Batal',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Container(
                    height: 110,
                    color: primary,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 60, right: 10),
                    child: Row(
                      children: [
                        Text(
                          'Profile',
                          style: superFont1.copyWith(color: white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 50),
                    Stack(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primary,
                              width: 10,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: tertiary,
                            child: Icon(
                              Icons.person,
                              size: 50,
                              color: white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    isLoading
                        ? CircularProgressIndicator()
                        : Text(
                            userName,
                            style: superFont1,
                          ),
                    const SizedBox(height: 5),
                    Text(
                      userEmail,
                      style: regulerFont1,
                    ),
                    const SizedBox(height: 30),
                    ProfileOption(
                      icon: Icons.person,
                      text: 'Ubah Profile',
                      selectedItemColor: primary,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangeProfile()),
                        );
                      },
                      color: primary,
                    ),
                    ProfileOption(
                      icon: Icons.lock,
                      text: 'Ubah Password',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()),
                        );
                      },
                      color: primary,
                      selectedItemColor: primary,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        _showJoinAsOwnerDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 55),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFF489DD6),
                      ),
                      child: Text(
                        'Daftarkan Lapanganmu',
                        style: buttonFont1.copyWith(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 15),
                    ElevatedButton(
                      onPressed: () {
                        _showLogoutDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 125),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: const Color(0xFF489DD6),
                      ),
                      child: Text(
                        'Keluar',
                        style: buttonFont1.copyWith(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ProfileOption({
    super.key,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
