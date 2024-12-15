import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart';

Color primary = const Color(0xFF12215C);
Color tertiary = const Color(0xFFA7ADC3);
Color white = const Color(0xFFFFFFFF);

class HistoryDetail extends StatefulWidget {
  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  int _rating = 0;
  int _currentIndex = 1;

  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            'Terima Kasih!',
            style: superFont1,
          ),
          content: Container(
            width: 30.0,
            height: 40.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Terima kasih atas rating Anda!',
                  style: superFont4,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: superFont3,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStar(int index) {
    return IconButton(
      onPressed: () {
        setState(() {
          _rating = index;
        });
        _showThankYouDialog();
      },
      icon: Icon(
        index <= _rating ? Icons.star : Icons.star_border,
        color: Colors.amber,
        size: 40,
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
<<<<<<< HEAD
          'History Pembayaran',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        backgroundColor: primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white), // Ikon back
          onPressed: () {
            Navigator.of(context).pop(); // Aksi kembali
          },
        ),
        leadingWidth: 20, // Atur lebar area leading agar lebih kecil
=======
          'History Pertandingan',
          style: superFont1.copyWith(color: white),
        ),
        backgroundColor: primary,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        titleSpacing: 0.0,
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0),
          child: Container(
            height: 4.0,
          ),
        ),
      ),
            body: Column(
        children: [
          Container(
<<<<<<< HEAD
            padding: const EdgeInsets.all(16.0),
=======
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
<<<<<<< HEAD
                  Text(
                    'GOR LOMBA TRI JUANG',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Lapangan Lomba Tri Juang 2A',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
=======
                  const SizedBox(height: 35),
                  Text('Tanding Berani?', style: superFont1),
                  const SizedBox(height: 5),
                  Text('Bulusan, Tembalang, Kota Semarang',
                      style: regulerFont1),
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
<<<<<<< HEAD
                              const Icon(Icons.sports_tennis),
                              const SizedBox(width: 10),
                              Text(
                                'Badminton',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today),
                              const SizedBox(width: 10),
                              Text(
                                'Jum, 5 Dec 2024\n09:00 - 10:00',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
=======
                              const Icon(
                                Icons.sports_tennis,
                                color: Color(0xFF12215C),
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Badminton - semua level',
                                style: superFont4,
                              )
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
<<<<<<< HEAD
                              const Icon(Icons.location_on),
                              const SizedBox(width: 10),
                              Text(
                                'Jl. Tri Lomba Juang, Mugassari',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
=======
                              const Icon(
                                Icons.calendar_today,
                                color: Color(0xFF12215C),
                                size: 24,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Minggu, 22 September 2024\n10:00 - 12:00',
                                style: superFont4,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Color(0xFF12215C),
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Lapangan Badminton Bulusan\nLapangan 2',
                                style: superFont4,
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
<<<<<<< HEAD
                              const Icon(Icons.monetization_on),
                              const SizedBox(width: 10),
                              Text(
                                'Biaya: 26.000',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
=======
                              const Icon(
                                Icons.monetization_on,
                                color: Color(0xFF12215C),
                                size: 25,
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Biaya: 60.000',
                                style: superFont4,
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Bagaimana Pengalamanmu?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        List.generate(5, (index) => _buildStar(index + 1)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
<<<<<<< HEAD
=======
//


>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
