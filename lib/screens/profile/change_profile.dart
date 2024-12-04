import 'package:arena_connect/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChangeProfile extends StatefulWidget {
  const ChangeProfile({super.key});

  @override
  _ChangeProfileState createState() => _ChangeProfileState();
}

class _ChangeProfileState extends State<ChangeProfile> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  String initialUsername = 'Thora`s Times';
  String initialPhone = '081234567891';
  String initialEmail = 'thoraatime@gmail.com';

  bool isChanged = false;

  @override
  void initState() {
    super.initState();
    usernameController.text = initialUsername;
    phoneController.text = initialPhone;
    emailController.text = initialEmail;

    // Add listeners to detect changes
    usernameController.addListener(checkChanges);
    phoneController.addListener(checkChanges);
    emailController.addListener(checkChanges);
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  Future<void> pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void checkChanges() {
    setState(() {
      isChanged = usernameController.text != initialUsername ||
          phoneController.text != initialPhone ||
          emailController.text != initialEmail;
    });
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _showSaveConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          backgroundColor: white,
          title: Center(
            child: Column(
              children: [
                Text(
                  'Simpan Perubahan',
                  style: superFont1.copyWith(color: primary),
                ),
                const SizedBox(height: 20),
                Text(
                  'Apakah kamu yakin ingin menyimpan perubahan?',
                  textAlign: TextAlign.center,
                  style: regulerFont1.copyWith(color: primary),
                ),
              ],
            ),
          ),
          contentPadding:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
          content: SizedBox(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
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
                        child: Text(
                          'Kembali',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Menutup dialog
                        },
                      ),
                    ),
                    const SizedBox(width: 4),
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
                        child: Text(
                          "Simpan",
                          style: buttonFont2,
                          selectionColor: secondary,
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pop(); // Tutup dialog setelah menyimpan
                          // Tampilkan SnackBar untuk konfirmasi berhasil
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text("Perubahan berhasil disimpan!"),
                              backgroundColor: Colors
                                  .lightGreen, // Warna hijau sesuai gambar
                              duration: const Duration(
                                  seconds: 2), // Durasi tampilan SnackBar
                              behavior: SnackBarBehavior
                                  .floating, // Menampilkan di tengah layar
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 20.0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: AppBar(
                backgroundColor: primary,
                automaticallyImplyLeading: false,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios,
                                size: 20, color: white),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Ubah Profile',
                            style: superFont1.copyWith(color: white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 80),
                  Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: white,
                            width: 9,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: tertiary,
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : null,
                          child: _profileImage == null
                              ? Icon(Icons.person, size: 50, color: white)
                              : null,
                        ),
                      ),
                      Positioned(
                          bottom: 11,
                          right: 14,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          leading: Icon(
                                            Icons.camera_alt,
                                            color: primary,
                                          ),
                                          title: Text(
                                            'Ambil Foto dari Kamera',
                                            style: regulerFont1.copyWith(
                                                fontSize: 15),
                                          ),
                                          onTap: () {
                                            pickImageFromCamera();
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          leading: Icon(
                                            Icons.photo,
                                            color: primary,
                                          ),
                                          title: Text(
                                            'Tambahkan dari Galeri',
                                            style: regulerFont1.copyWith(
                                                fontSize: 15),
                                          ),
                                          onTap: () {
                                            pickImageFromGallery();
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: white,
                              radius: 20,
                              child: const Icon(
                                Icons.add_a_photo_outlined,
                                size: 23,
                                color: Color(0xFF12215C),
                              ),
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildInputField(
                      labelText: 'Username',
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: buildInputField(
                      labelText: 'No Telepon',
                      controller: phoneController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildInputField(
                      labelText: 'Email',
                      controller: emailController,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ProfileOption(
                      text: 'Hapus Akun',
                      selectedItemColor: primary,
                      onTap: () {},
                      color: primary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: isChanged ? _showSaveConfirmationDialog : null,
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(320, 50),
                        backgroundColor: secondary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: Text(
                      'Simpan Perubahan',
                      style: buttonFont1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      //   appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(150), // Increase the height to accommodate the profile picture

      // ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set to Profile page index
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: tertiary,
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
      ),
    );
  }
}

Widget buildInputField({
  required String labelText,
  required TextEditingController controller, // Untuk mengontrol input
  TextInputType inputType = TextInputType.text, // Tipe input, default text
}) {
  return TextFormField(
    controller: controller, // Menghubungkan input dengan controller
    keyboardType: inputType, // Mengatur tipe keyboard berdasarkan tipe input
    decoration: InputDecoration(
      labelText: labelText, // Menggunakan parameter untuk label
      labelStyle: TextStyle(
        color: tertiary, // Warna teks label
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: tertiary, // Warna border ketika tidak aktif
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10), // Border radius
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary, // Warna border saat input difokuskan
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10), // Border radius
      ),
      contentPadding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 15), // Padding dalam kotak input
    ),
    style: superFont4,
  );
}

class ProfileOption extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;

  const ProfileOption({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
    required Color selectedItemColor,
  });

  @override
  _ProfileOptionState createState() => _ProfileOptionState();
}

class _ProfileOptionState extends State<ProfileOption> {
  Color arrowColor = tertiary;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            arrowColor = primary;
          });
        },
        onExit: (event) {
          setState(() {
            arrowColor = tertiary;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: primary),
          ),
          child: Row(
            children: <Widget>[
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: superFont3,
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, size: 16, color: arrowColor),
            ],
          ),
        ),
      ),
    );
  }
}
