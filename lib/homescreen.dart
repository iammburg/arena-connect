import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Image.asset(
                      'images/arena-connect1.png',
                      width: 70,
                      height: 70,
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  "Welcome to Arena Connect",
                  style: TextStyle(
                      fontFamily: "Kanit",
                      color: Color(0xFF12215C),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              )
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF489DD6),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'SourceSans3',
                              color: Color(0xFFffffff)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF12215C),
                        ),
                        child: const Text(
                          "Daftar",
                          style: TextStyle(
                              fontFamily: 'SourceSans3',
                              color: Color(0xFFffffff)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
