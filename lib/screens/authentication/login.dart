import 'package:arena_connect/config/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:arena_connect/api/api_service.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool _isPasswordObscured = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  String? _emailError;
  String? _passwordError;

  void _login() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = _emailController.text;
    final password = _passwordController.text;

    final result = await _apiService.login(email, password);

    if (result['success']) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login berhasil')),
      );
      Navigator.pushNamed(context, '/homepage');
    } else {
      final errors = result['errors'] ?? {};

      setState(() {
        _emailError = errors['email']?.first ?? null;
        _passwordError = errors['password']?.first ?? null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login gagal, periksa input Anda')),
      );
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.start,
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
                  const SizedBox(height: 120)
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(18),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFffffff),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 16,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                                color: Color(0xFF12215C),
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Source Sans Pro"),
                          ),
                        ),
                        const SizedBox(height: 35),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12), // Margin agar ikon sejajar secara vertikal 
                              child:  Icon(
                                Icons.email,
                                color: Colors.grey,
                                size: 25,
                              ),
                            ),
                            hintText: 'Email',
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, // Padding vertikal untuk memperbesar tinggi field
                              horizontal: 18, // Padding horizontal untuk jarak teks dari tepi
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0, // Border lebih tebal saat fokus
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0, // Border lebih tebal saat error
                              ),
                            ),
                            errorText: _emailError,
                          ),
                          style: const TextStyle(
                              fontFamily: "Source Sans Pro",
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF0A0A0A),
                              fontSize: 18),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isPasswordObscured,
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12), // Margin agar ikon sejajar secara vertikal 
                              child: Icon(
                                Icons.lock,
                                color: Colors.grey, 
                                size: 25,
                              )
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, // Padding vertikal untuk memperbesar tinggi field
                              horizontal: 18, // Padding horizontal untuk jarak teks dari tepi
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                                width: 2.0, // Border lebih tebal saat fokus
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2.0, // Border lebih tebal saat error
                              ),
                            ),
                            errorText: _passwordError,
                            suffixIcon: IconButton(
                              icon: Icon(
                                  _isPasswordObscured
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                  size: 25),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: "Source Sans Pro",
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF0A0A0A),
                            fontSize: 18
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: _login,
                          style: masukButton,
                          child: Text(
                            "M A S U K",
                            style: masukButtonFont,
                          ),
                        ),
                        const SizedBox(height: 25),
                        RichText(
                          text: TextSpan(
                            text: 'Belum punya akun? ',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF12215C),
                              fontFamily: "Source Sans Pro",
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Daftar',
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushNamed(context, '/register');
                                    }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
