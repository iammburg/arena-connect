import 'package:arena_connect/config/theme.dart';
import 'package:flutter/material.dart';

class PasswordChangePage extends StatefulWidget {
  const PasswordChangePage({super.key});

  @override
  _PasswordChangePageState createState() => _PasswordChangePageState();
}

class _PasswordChangePageState extends State<PasswordChangePage> {
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Konfirmasi Perubahan',
            style: buttonFont1.copyWith(color: primary, fontSize: 17),
            textAlign: TextAlign.center,
          ),
          content: Text(
            'Perubahan ini akan disimpan. Apakah kamu yakin ingin melanjutkan?',
            style: regulerFont1.copyWith(color: primary),
            textAlign: TextAlign.center,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Kembali',
                        style: buttonFont1.copyWith(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 10, height: 2),
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
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showSuccessDialog();
                    },
                    child: Text('Simpan',
                        style: buttonFont1.copyWith(color: Colors.white)),
                  ),
                ),
              ],
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              Icon(Icons.check_circle, color: secondary, size: 80),
              const SizedBox(height: 20),
              Text(
                'Kata Sandi Berhasil\ndiperbarui!',
                style: buttonFont1.copyWith(color: primary),
                textAlign: TextAlign.center,
              )
            ],
          ),
          actions: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text('OK', style: buttonFont1.copyWith(color: secondary)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: primary,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(left: 30, top: 48, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 25),
                Text('Ubah Kata Sandi\nBaru',
                    style: superFont1.copyWith(color: white, fontSize: 25)),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45),
            topRight: Radius.circular(45),
          ),
        ),
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/iconpassword.png',
              width: 110,
              height: 110,
            ),
            const SizedBox(height: 20),
            Text(
              'Masukkan kata sandi baru',
              style: buttonFont1.copyWith(
                  color: primary, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Kata sandi baru',
                labelStyle: TextStyle(color: primary, fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primary), // Warna border saat fokus
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.grey), // Warna border saat tidak fokus (grey)
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Konfirmasi kata sandi baru',
                labelStyle: TextStyle(color: primary, fontSize: 13),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: primary), // Warna border saat fokus
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color:
                          Colors.grey), // Warna border saat tidak fokus (grey)
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: secondary,
              ),
              onPressed: _showConfirmationDialog,
              child: Text('Simpan Perubahan', style: buttonFont1),
            ),
          ],
        ),
      ),
    );
  }
}
