import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/field-search/select_schedule.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({super.key});

  @override
  State<Pembayaran> createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  String? bayar;

  void showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Metode Pembayaran : $bayar"),
    ));
  }

  Widget buildCircleIcon(IconData icon, String label,
      {Color? backgroundColor, Color? iconColor = Colors.white}) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor ?? const Color(0xFF12215c),
        ),
        child: Icon(
          icon,
          color: iconColor ?? Colors.white,
          size: 28,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: buttonFont6,
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/top-wave-cropped.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left),
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 40),
                        child: buildCircleIcon(
                            Icons.calendar_month_outlined, "Pilih Jadwal"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(0),
                        child: buildCircleIcon(
                          Icons.list_alt_rounded,
                          "Detail Booking",
                          backgroundColor: Colors.white,
                          iconColor: const Color(0xFF12215c),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: CustomPaint(
                      painter: DashedLinePainter(),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 40),
                        child: buildCircleIcon(
                            Icons.payments_outlined, "Pemabayaran"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Positioned(
            top: 200,
            left: 8,
            right: 8,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                height: 78,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Pembayaran",
                        style: regulerFont7,
                      ),
                      Text(
                        "Rp 30.000",
                        style: superFont2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 303,
            left: 45,
            child: Row(
              children: [
                Text(
                  "Metode Pembayaran",
                  style: superFont4,
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Positioned(
            top: 340,
            left: 8,
            right: 8,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'BRI',
                            style: superFont3,
                          ),
                          const SizedBox(width: 35),
                          Text("26215-xxxxxxxxxxxx", style: regulerFont1),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Radio<String>(
                          value: 'BRI',
                          groupValue: bayar,
                          activeColor: const Color(0xFF12215c),
                          onChanged: (String? value) {
                            setState(() {
                              bayar = value;
                              showSnackbar();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Positioned(
            top: 410,
            left: 8,
            right: 8,
            child: FractionallySizedBox(
              widthFactor: 0.95,
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Text(
                            'BNI',
                            style: superFont3,
                          ),
                          const SizedBox(width: 35),
                          Text("26215-xxxxxxxxxxxx", style: regulerFont1),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Radio<String>(
                          value: 'BNI',
                          groupValue: bayar,
                          activeColor: const Color(0xFF12215c),
                          onChanged: (String? value) {
                            setState(() {
                              bayar = value;
                              showSnackbar();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: (4.0),
                  ),
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 257,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF489DD6),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text("Bayar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
