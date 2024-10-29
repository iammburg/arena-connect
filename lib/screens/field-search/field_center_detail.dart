import 'package:arena_connect/config/theme.dart';
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
        leading: Icon(Icons.arrow_back_ios, size: 18),
        title: Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10.0), //Tambahkan Margin bawah untuk BoxShadow
            child: Stack(
              children: [
                // Container untuk bayangan
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0), // Margin agar bayangan tidak terpotong
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
                            bottom: 0.55,
                            left: 0.1,
                            right: 0.1,
                            child: Container(
                              height: 85.0,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.75),
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
                              child : Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Kota Semarang',
                                              style: TextStyle(color: secondary, fontSize: 8),
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
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Icon(Icons.star, color: Colors.orangeAccent, size: 22),
                                                SizedBox(width: 6),
                                                Text('4.5', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 4),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                _buildChip('Badminton', Icons.sports_tennis),
                                                SizedBox(width: 8),
                                                _buildChip('Futsal', Icons.sports_soccer),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Mulai',
                                                  style: TextStyle(fontSize: 10, color: secondary),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 6),
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Rp 30.000',
                                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black),
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
                  spreadRadius: 1, // Sebaran bayangan
                  blurRadius: 2,   // Jarak blur
                  offset: Offset(-0.5, 4), // Perpindahan bayangan (x,y)
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 25, right: 0),
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
                          style: TextStyle(
                            fontSize: 10,
                          ),
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
            margin: const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            padding: const EdgeInsets.only(top: 10, bottom: 0, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Aturan Lapangan",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                // Daftar aturan dengan bullet poin
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("• ", style: TextStyle(fontSize: 16,  color: secondary)), // Bullet point
                          Expanded(
                            child: Text("Dilarang Meludah sembarangan", style: TextStyle(fontSize: 12, color: secondary)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("• ", style: TextStyle(fontSize: 16, color: secondary)), // Bullet point
                          Expanded(
                            child: Text("Masuk sesuai waktu booking", style: TextStyle(fontSize: 12, color: secondary)),
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
            margin: const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
            padding: const EdgeInsets.only(top: 10, bottom: 0, left: 16, right: 16),
            // padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fasilitas',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                
                // Daftar Fasilitas Lapangan dengan Ikon
                Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Container(
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.chair, color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Toilet', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black)),
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
                                      Icon(Icons.motorcycle, color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Parkir Motor', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black)),
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
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.wifi, color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('WiFi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black)),
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
                                      Icon(Icons.mosque, color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Musholla', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black)),
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
                        child: 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //Kolom Pertama dengan Expanded
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.car_rental, color: secondary, size: 22),
                                      SizedBox(width: 8),
                                      Text('Parkir Mobil', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.black)),
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
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(2.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26, // Warna bayangan
                  offset: Offset(4.5, 0), // Posisi bayangan
                  blurRadius: 4.0, // Jarak blur bayangan
                  spreadRadius: 3.5, // Jarak sebar bayangan
                ),
              ],
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Membuat jarak antara dua elemen
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mulai',
                          style: TextStyle(
                            fontSize: 10, // Ukuran font yang lebih kecil
                            color: Colors.grey, // Warna teks abu-abu
                          ),
                        ),
                        Text(
                          'Rp 30.000',
                          style: TextStyle(
                            fontSize: 15, // Ukuran font untuk harga
                            fontWeight: FontWeight.bold,
                            color: primary, // Warna teks biru gelap
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol ditekan
                      },
                      style: shortButton3,
                      child: Text(
                        'Pilih Lapangan',
                        style: TextStyle(
                          fontSize: 12, // Ukuran teks tombol
                          color: Colors.white, // Warna teks putih
                        ),
                      ),
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