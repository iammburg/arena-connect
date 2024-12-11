import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/field-search/select_schedule.dart';
import 'package:flutter/material.dart';

class BuktiBookingLapangan extends StatelessWidget {
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
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      color: white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 46),
                    // Memberikan jarak antara ikon dan teks
                    child: Text(
                        'Bukti Booking Lapangan', // Teks yang ingin ditampilkan
                        style: superFont1.copyWith(color: white)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bukti',
                                      style: superFont2,
                                    ),
                                    Text(
                                      '1 September 2024',
                                      style: superFont2,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                CustomPaint(
                                  painter: DashedLinePainter(
                                      color: Colors.grey.shade400),
                                  size: Size(
                                      MediaQuery.of(context).size.width, 0.5),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order ID',
                                      style: regulerFont1,
                                    ),
                                    Text(
                                      'XXXXXX', //data dinamis
                                      style: regulerFont1,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Rincian',
                                  style: superFont2,
                                ),
                                SizedBox(height: 20),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.event, color: primary),
                                    SizedBox(width: 8),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Pelaksanaan',
                                          style: superFont3,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Lapangan 1',
                                          style: regulerFont1.copyWith(
                                              color: secondary),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Senin, 1 September 2024',
                                          style: regulerFont1.copyWith(
                                              color: secondary),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Sparring dimulai 07:00 - 08:00',
                                          style: regulerFont1.copyWith(
                                              color: secondary),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(right: 10.0),
                    //     child: ElevatedButton.icon(
                    //       onPressed: () {
                    //         // Aksi ketika tombol ditekan
                    //       },
                    //       icon: Icon(Icons.download, color: Colors.white),
                    //       label: Text(
                    //         'Unduh Bukti Booking',
                    //         style: superFont3.copyWith(color: Colors.white),
                    //       ),
                    //       style: ElevatedButton.styleFrom(
                    //         padding: EdgeInsets.symmetric(
                    //           horizontal: 28.0,
                    //           vertical: 18.0,
                    //         ),
                    //         backgroundColor: secondary,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //       ),
                    //     ),
                    //   ),                                    
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
