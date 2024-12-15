import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/background-image.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 40),
                        child: Image.asset(
                          'images/arena-connect1.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "Welcome to",
                      style: superFont0,
                    ),
                  ),
                  Center(
                    child: Text(
                      "Arena Connect",
                      style: superFont0,
                    ),
                  )
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
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
                            style: masukButton,
                            child: Text(
                              "M A S U K",
                              style: masukButtonFont,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            style: daftarButton,
                            child: Text(
                              "D A F T A R",
                              style: daftarButtonFont,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
//