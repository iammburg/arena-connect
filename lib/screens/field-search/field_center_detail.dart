import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/field-search/select_schedule.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FieldCenterDetails extends StatefulWidget {
  const FieldCenterDetails({super.key});

  @override
  FieldCenterState createState() => FieldCenterState();
}

class FieldCenterState extends State<FieldCenterDetails> {
  final List<String> imgList = [
    'images/badminton4.jpg',
    'images/badminton2.jpg',
    'images/futsal1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: primary),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        // title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(
                bottom: 10.0), //Tambahkan Margin bawah untuk BoxShadow
            child: Stack(
              children: [
                // Container untuk bayangan
                Container(
                  margin: const EdgeInsets.only(
                      bottom: 10.0), // Margin agar bayangan tidak terpotong
                  // Carousel untuk gambar lapangan
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                    items: imgList.map((item) {
                      return Stack(
                        children: [
                          //Gambar Latar Belakang
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26, // Warna bayangan
                                  offset: Offset(0, 1), // Posisi bayangan
                                  blurRadius: 0.5, // Jarak blur bayangan
                                  spreadRadius: 0.25, // Jarak sebar bayangan
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          //Background putih dengan Informasi di atasnya
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 87.5,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26, // Warna bayangan
                                    offset: Offset(0, 1), // Posisi bayangan
                                    blurRadius: 0.5, // Jarak blur bayangan
                                    spreadRadius: 0.25, // Jarak sebar bayangan
                                  ),
                                ],
                              ),

                              //Informasi Lapangan
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Kota Semarang',
                                              style: TextStyle(
                                                  color: secondary,
                                                  fontSize: 8),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              'REHAM',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                                color: primary,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.orangeAccent,
                                                    size: 22),
                                                SizedBox(width: 6),
                                                Text('4.5',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                _buildChip('Badminton',
                                                    Icons.sports_tennis),
                                                SizedBox(width: 8),
                                                _buildChip('Futsal',
                                                    Icons.sports_soccer),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Mulai',
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: secondary),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 6),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Rp 30.000',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 30, left: 30),
            decoration: BoxDecoration(
              color: Colors.white, // Background putih
              borderRadius: BorderRadius.circular(8), // Tepi rounded
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7), // Warna bayangan
                  spreadRadius: 0, // Sebaran bayangan
                  blurRadius: 3, // Jarak blur
                  offset: Offset(0, 3), // Perpindahan bayangan (x,y)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 0.0, left: 25, right: 0),
              child: Row(
                children: [
                  //Kolom Pertama
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jl.Mulawarman Selatan, Tembalang, Semarang',
                          style: TextStyle(fontSize: 10.2, color: primary),
                        ),
                      ],
                    ),
                  ),
                  //Kolom Kedua
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 55,
                          height: 45,
                          child: Image.asset(
                            'images/mapreham.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10),

          //ATURAN LAPANGAN
          Container(
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            padding:
                const EdgeInsets.only(top: 10, bottom: 0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Aturan Lapangan", style: superFont3),
                SizedBox(height: 10),
                // Daftar aturan dengan bullet poin
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("• ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondary)), // Bullet point
                          Expanded(
                            child: Text("Dilarang Meludah sembarangan",
                                style:
                                    TextStyle(fontSize: 12, color: secondary)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("• ",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: secondary)), // Bullet point
                          Expanded(
                            child: Text("Masuk sesuai waktu booking",
                                style:
                                    TextStyle(fontSize: 12, color: secondary)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //FASILITAS LAPANGAN
          Container(
            margin:
                const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            padding:
                const EdgeInsets.only(top: 10, bottom: 0, left: 16, right: 16),
            // padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text('Fasilitas', style: superFont2),
                SizedBox(height: 20),

                // Daftar Fasilitas Lapangan dengan Ikon
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.wc,
                                          color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Toilet',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 20),
                            //Kolom Kedua dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.motorcycle,
                                          color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Parkir Motor',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.wifi,
                                          color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('WiFi',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            //Kolom Kedua dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.mosque,
                                          color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Musholla',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.car_rental,
                                          color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Parkir Mobil',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),
          Container(
            height: 96,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black26, // Warna bayangan
                  offset: Offset(0, -4), // Posisi bayangan
                  blurRadius: 10, // Jarak blur bayangan
                  spreadRadius: 0, // Jarak sebar bayangan
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Membuat jarak antara dua elemen
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const Text(
                          'Mulai',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text('Rp 30.000',
                            style: superFont2.copyWith(fontSize: 19)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 10, bottom: 10, right: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectSchedule()),
                        );
                      },
                      style: shortButton3.copyWith(
                          fixedSize: WidgetStateProperty.all(const Size(0, 41)),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)))),
                      child: Text('Pilih Lapangan',
                          style:
                              superFont4.copyWith(color: white, fontSize: 14)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk kategori chip (misalnya Badminton dan Futsal)
  Widget _buildChip(String label, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ukuran Chip hanya sebesar konten
        children: [
          Icon(
            icon,
            size: 12, // Ukuran ikon
            color: Colors.white,
          ),
          SizedBox(width: 7), // Jarak antara ikon dan teks
          Text(
            label,
            style: TextStyle(
              fontSize: 8,
              color: Colors.white,
            ), // Ukuran teks
          ),
        ],
      ),
    );
  }
}
