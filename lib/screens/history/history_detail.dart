import 'package:flutter/material.dart';

// Color Palettes
Color primary = const Color(0xFF12215C);
Color secondary = const Color.fromARGB(255, 255, 255, 255);
Color tertiary = const Color(0xFFA7ADC3);
Color white = const Color(0xFFFFFFFF);

// Font Styles
TextStyle superFont1 = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w900,
  fontSize: 19,
  color: primary,
);

TextStyle superFont2 = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: primary,
);

// Regular Font Styles
TextStyle regulerFont1 = TextStyle(
  fontFamily: 'Source Sans Pro',
  fontWeight: FontWeight.normal,
  fontSize: 14,
  color: primary,
);

class HistoryDetail extends StatefulWidget {
  @override
  _HistoryDetailState createState() => _HistoryDetailState();
}

class _HistoryDetailState extends State<HistoryDetail> {
  int _rating = 0;
  int _currentIndex = 1;

  double _topContainerHeight = 150;
  Color _topContainerColor = secondary; // Warna dari palet warna

  void _showThankYouDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Terima Kasih!'),
          content: const Text('Terima kasih atas rating Anda!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
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
          'History Pertandingan',
          style: superFont1.copyWith(color: white),
        ),
        backgroundColor: primary,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Container(
            height: 4.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: _topContainerHeight,
            color: _topContainerColor,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tanding Berani??', style: superFont1),
                  const SizedBox(height: 10),
                  Text('Bulusan, Tembalang, Kota Semarang',
                      style: regulerFont1),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Badminton - semua level',
                            style: superFont2,
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.calendar_today),
                              SizedBox(width: 10),
                              Text('Minggu, 22 September 2024\n10:00 - 12:00'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 10),
                              Text('Lapangan Badminton Bulusan\nLapangan 2'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Icon(Icons.monetization_on),
                              SizedBox(width: 10),
                              Text('Biaya: 60.000'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Bagaimana Pengalamanmu?',
                    style: superFont2,
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
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
        selectedItemColor: white,
        unselectedItemColor: tertiary,
        backgroundColor: primary,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
//
