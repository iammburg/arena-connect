import 'package:flutter/material.dart';

// Color Palettes
Color primary = const Color(0xFF12215C);
Color secondary = const Color(0xFF489DD6);
Color tertiary = const Color(0xFFA7ADC3);
Color white = const Color(0xFFFFFFFF);

// Font Styles
TextStyle buttonFont1 = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
  fontSize: 15,
  color: white,
);

ButtonStyle longButton1 = ElevatedButton.styleFrom(
  minimumSize: const Size(double.infinity, 50),
  backgroundColor: secondary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PasswordChangePage(),
    );
  }
}

class PasswordChangePage extends StatefulWidget {
  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Simpan Perubahan', style: buttonFont1.copyWith(color: primary)),
          content: Text(
            'Apakah kamu yakin ingin menyimpan perubahan?',
            style: buttonFont1.copyWith(fontSize: 13, color: primary), 
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kembali', style: buttonFont1.copyWith(color: primary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _showSuccessDialog();
              },
              child: Text('Simpan', style: buttonFont1.copyWith(color: secondary)),
            ),
          ],
        );
      },
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: secondary, size: 60),
              const SizedBox(height: 10),
              Text('Kata Sandi Berhasil diperbarui!', style: buttonFont1.copyWith(color: primary)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: buttonFont1.copyWith(color: secondary)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: white), // Arrow back icon
            ),
            const SizedBox(height: 10), // Space between icon and text
            Text(
              'Ubah Kata Sandi Baru',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: white,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          // Latar belakang primary lebih panjang
          Container(
            color: primary,
            height: 80,
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            decoration: BoxDecoration(
              color: white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.lock, color: secondary, size: 100),
                const SizedBox(height: 20),
                Text(
                  'Masukkan kata sandi baru',
                  style: buttonFont1.copyWith(color: primary, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Kata sandi baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Konfirmasi kata sandi baru',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: longButton1,
                  onPressed: _showConfirmationDialog,
                  child: Text('Simpan Perubahan', style: buttonFont1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
