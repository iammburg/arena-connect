import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/booking/booking_page.dart';
import 'package:flutter/material.dart';

class SelectSchedule extends StatefulWidget {
  const SelectSchedule({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SelectScheduleState createState() => _SelectScheduleState();
}

class DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashSpace;
  final Paint paintLine;

  DashedLinePainter(
      {this.dashWidth = 4.0, this.dashSpace = 5.0, Color color = Colors.white})
      : paintLine = Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, size.height / 2),
          Offset(startX + dashWidth, size.height / 2), paintLine);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _SelectScheduleState extends State<SelectSchedule> {
  int selectedIndex = -1;
  String _selectedPrice = 'Rp0';
  List<Map<String, dynamic>> options = [
    {
      'duration': '60 Menit',
      'hoursDuration': '07:00 - 08:00',
      'pricing': 'Rp30.000',
    },
    {
      'duration': '60 Menit',
      'hoursDuration': '08:00 - 09:00',
      'pricing': 'Rp30.000',
    },
    {
      'duration': '60 Menit',
      'hoursDuration': '10:00 - 11:00',
      'pricing': 'Rp30.000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Widget scheduleChooseIcon() {
      return Column(
        children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
                // border: Border.all(color: Colors.white, width: 1)
              ),
              child: const IconButton(
                  icon: Icon(Icons.calendar_month_outlined),
                  color: Colors.white,
                  onPressed: null,
                  disabledColor: Colors.white)),
        ],
      );
    }

    Widget bookingDetailIcon() {
      return Column(
        children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                // border: Border.all(color: Colors.white, width: 1)
              ),
              child: IconButton(
                  icon: Icon(Icons.list_alt_rounded),
                  color: primary,
                  onPressed: null,
                  disabledColor: primary)),
        ],
      );
    }

    Widget paymentIcon() {
      return Column(
        children: [
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary,
                // border: Border.all(color: Colors.white, width: 1)
              ),
              child: const IconButton(
                  icon: Icon(Icons.payments_outlined),
                  color: Colors.white,
                  onPressed: null,
                  disabledColor: Colors.white)),
        ],
      );
    }

    Widget scheduleChooseOption(
      int index,
      String duration,
      String hoursDuration,
      String pricing,
    ) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.only(left: 24, top: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Card.outlined(
                color: selectedIndex == index ? primary : white,
                margin: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, top: 6, bottom: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(duration,
                              style: selectedIndex == index
                                  ? regulerFontSelected1
                                  : regulerFont1),
                          const SizedBox(height: 1),
                          Text(hoursDuration,
                              style: selectedIndex == index
                                  ? regulerFontSelected1
                                  : regulerFont1)
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 12, top: 6, bottom: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Kasih pengkondisian di text Booked
                          // Text("Booked", style: regulerFont3),
                          const SizedBox(height: 1),
                          Text(pricing,
                              style: selectedIndex == index
                                  ? regulerFontSelected1
                                  : regulerFont1),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

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
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 20),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
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
                        child: Column(
                          children: [
                            scheduleChooseIcon(),
                            const SizedBox(height: 1),
                            Text(
                              "Pilih Jadwal",
                              style: buttonFont6,
                            ),
                          ],
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
                          padding: const EdgeInsets.all(0),
                          child: bookingDetailIcon()),
                      const SizedBox(height: 1),
                      Text(
                        "Detail Booking",
                        style: buttonFont6,
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
                        child: Column(
                          children: [
                            paymentIcon(),
                            const SizedBox(height: 1),
                            Text(
                              "Pembayaran",
                              style: buttonFont6,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 30),
              // Nampilin list lapangan yang tersedia
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Theme(
                                data: Theme.of(context).copyWith(
                                  dividerColor: Colors.transparent,
                                ),
                                child: ExpansionTile(
                                  textColor: white,
                                  title: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'images/lapangan-futsal.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Lapangan Futsal",
                                            style: regulerFont2,
                                          ),
                                          // const SizedBox(height: 3),
                                          Text(
                                            "Futsal",
                                            style: regulerFont7,
                                          ),
                                          Text(
                                            "2 Jadwal",
                                            style: regulerFont7,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: Icon(
                                    Icons.expand_circle_down,
                                    color: primary,
                                  ),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          ...options
                                              .map((Map<String, dynamic> data) {
                                            return scheduleChooseOption(
                                              options.indexOf(data),
                                              data['duration'],
                                              data['hoursDuration'],
                                              data['pricing'],
                                            );
                                          }),
                                          const SizedBox(height: 10),
                                          GestureDetector(
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  _selectedPrice =
                                                      options[selectedIndex]
                                                          ['pricing'];
                                                });
                                              },
                                              style: shortButton2,
                                              child: Text(
                                                "Buat Booking",
                                                style: buttonFont6.copyWith(
                                                    fontSize: 11),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),

                        // Tambahin tipe lapangan (statis) di sini
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Mulai",
                            style: regulerFont10.copyWith(fontSize: 13)),
                        Text(_selectedPrice, style: superFont2),
                        const SizedBox(height: 12),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingPage()));
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(400, 48),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: secondary),
                            child: Text(
                              "Selanjutnya",
                              style: buttonFont2,
                            )),
                        const SizedBox(height: 18),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
