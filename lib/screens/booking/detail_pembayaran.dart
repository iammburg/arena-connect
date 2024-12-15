import 'dart:io';
import 'package:arena_connect/screens/booking/bukti_booking_lap.dart';
import 'package:arena_connect/screens/field-search/select_schedule.dart';
import 'package:flutter/material.dart';
import 'package:arena_connect/config/theme.dart';
import 'package:image_picker/image_picker.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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

  File? image;
  bool imageSelected = false;

  Future getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePicked =
        await _picker.pickImage(source: ImageSource.gallery);
    if (imagePicked != null) {
      setState(() {
        image = File(imagePicked.path);
        imageSelected = true; // Set flag menjadi true jika gambar sudah dipilih
      });
    }
  }

  Future<void> uploadImage(File imageFile) async {
    // Logika upload gambar ke server bisa ditambahkan di sini
    print("Mengirim gambar: ${imageFile.path}");
    // Contoh, upload gambar ke server atau lakukan aksi lainnya
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
                          backgroundColor: primary,
                          iconColor: white,
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
                            Icons.payments_outlined, "Pemabayaran",
                            backgroundColor: white, iconColor: primary),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 185,
            left: 8,
            right: 8,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20), // Margin lebih kecil
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Menunggu Pembayaran',
                            style: superFont2,
                          ),
                          Icon(Icons.access_time, color: primary),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Selesaikan pembayaran sebelum',
                            style: regulerFont1.copyWith(
                                color: secondary, fontSize: 12),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color(0XFFA8E911),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              Text(
                                '00:59:11',
                                style: regulerFont1.copyWith(color: primary),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // const SizedBox(height: 15),
                      // const Divider(color: Colors.grey),
                      const SizedBox(height: 25),
                      CustomPaint(
                        painter: DashedLinePainter(color: Colors.grey.shade400),
                        size: Size(MediaQuery.of(context).size.width, 1),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 20),
                            Image.asset(
                              'images/bri.png',
                              width: 48,
                              height: 48,
                            ),
                            const SizedBox(width: 35),
                            Text(
                              'BAYAR MELALUI BRI',
                              style: superFont3,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Pembayaran',
                            style: superFont3.copyWith(color: primary),
                          ),
                          Text(
                            'Rp30.000',
                            style: superFont2.copyWith(color: primary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 485,
            left: 8,
            right: 8,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: 10, vertical: 20), // Margin lebih kecil
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Menampilkan gambar jika sudah dipilih
                      if (image != null)
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom:
                                  20), // Spasi antara gambar dan tombol kirim
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200, // Menjaga agar gambar proporsional
                          ),
                        ),

                      // Menampilkan tombol kirim jika gambar sudah dipilih

                      Container(
                        margin: const EdgeInsets.only(
                            top: 10), // Menambahkan jarak dari elemen atas
                        alignment:
                            Alignment.centerRight, // Posisi tombol di kanan
                        child:
                            image != null // Periksa apakah gambar sudah diinput
                                ? ElevatedButton.icon(
                                    onPressed: () async {
                                      await uploadImage(
                                          image!); // Logika pengiriman
                                    },
                                    label: Text(
                                      'Kirim',
                                      style: superFont3.copyWith(color: white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 18.0),
                                      backgroundColor: secondary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                      ),

                      // Tombol upload hanya tampil jika gambar belum dipilih
                      if (!imageSelected)
                        Row(
                          children: [
                            IconButton(
                              icon:
                                  Icon(Icons.upload, color: primary, size: 27),
                              onPressed: () async {
                                await getImage(); // Pilih gambar
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Text('Upload Bukti Pembayaran',
                                  style: superFont2),
                            ),
                          ],
                        ),
                      const SizedBox(height: 10)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget scheduleChooseIcon() {
    return IconButton(
      icon: Icon(Icons.calendar_month_outlined),
      color: primary,
      onPressed: null,
      disabledColor: Colors.white,
    );
  }

  Widget bookingDetailIcon() {
    return IconButton(
      icon: Icon(Icons.list_alt_rounded),
      color: primary,
      onPressed: null,
      disabledColor: Colors.white,
    );
  }

  Widget paymentIcon() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: IconButton(
            icon: const Icon(Icons.payments_outlined),
            color: primary,
            onPressed: null,
            disabledColor: primary,
          ),
        ),
      ],
    );
  }

  Widget buildDashedLine() {
    return Transform.translate(
      offset: Offset(0, -10),
      child: Container(
        width: 60,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Flex(
              children: List.generate(
                10,
                (index) => SizedBox(
                  width: 3,
                  height: 2,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
              ),
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            );
          },
        ),
      ),
    );
  }
}
