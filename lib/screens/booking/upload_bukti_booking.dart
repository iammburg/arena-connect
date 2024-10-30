import 'package:arena_connect/config/theme.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadBuktiBooking extends StatefulWidget {
  const UploadBuktiBooking({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UploadBuktiBookingState createState() => _UploadBuktiBookingState();
}

class _UploadBuktiBookingState extends State<UploadBuktiBooking> {
  String? selectedFileName;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: Container(
          color: primary,
          child: Stack(
            children: [
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          scheduleChooseIcon(),
                          SizedBox(height: 10),
                          Text(
                            'Pilih Jadwal',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    buildDashedLine(),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5),
                          bookingDetailIcon(),
                          SizedBox(height: 10),
                          Text(
                            'Detail Booking',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    buildDashedLine(),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          paymentIcon(),
                          SizedBox(height: 9),
                          Text(
                            'Pembayaran',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    offset: Offset(0, 5),
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
                        style: superFont1.copyWith(color: primary),
                      ),
                      Icon(Icons.access_time, color: primary),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Selesaikan pembayaran sebelum',
                        style: regulerFont1.copyWith(color: primary),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.green,
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
                  SizedBox(height: 15),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order ID',
                        style: superFont4.copyWith(color: primary),
                      ),
                      Text(
                        'XXXXXXXX',
                        style: superFont4.copyWith(color: primary),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          child: Center(
                            child: Text(
                              'BRI',
                              style: buttonFont1.copyWith(color: primary),
                            ),
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 30,
                          color: Colors.grey.shade300,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'BAYAR MELALUI BRI',
                            style: buttonFont2.copyWith(color: primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Pembayaran',
                        style: superFont3.copyWith(color: primary),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Rp30.000',
                        style: superFont3.copyWith(color: primary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // UPLOAD BUKTI
            GestureDetector(
              onTap: () {
                // Upload Bukti Pembayaran action
                _pickFile();
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Card Container
                      Card(
                        color: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 65, right: 65, top: 35, bottom: 35),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Upload Title
                              Text(
                                'Upload Bukti Pembayaran',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 20),
                              // File Upload Icon
                              GestureDetector(
                                onTap: _pickFile,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 90,
                                      color: primary,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      selectedFileName ?? 'Pilih File',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: secondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      // Submit Button positioned at bottom-right
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: 10, bottom: 10, left: 20, right: 0),
                            child: ElevatedButton(
                              onPressed: () {
                                // Action when button is pressed
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    secondary, // Replace `shortButton3` with desired style
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                'Kirim',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
