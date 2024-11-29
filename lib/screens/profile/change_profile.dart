import 'package:arena_connect/api/api_service.dart';
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

  bool isChanged = false;
  String userId = '';
  String userName = '';
  String userEmail = '';
  String userPhone = '';
  bool isLoading = true;

  Future<void> _getUserProfile() async {
    final token = await ApiService().getToken();
    if (token != null) {
      final response = await ApiService().getUserProfile(token);
      if (response['success']) {
        setState(() {
          userName = response['data']['id'].toString();
          userName = response['data']['name'];
          userEmail = response['data']['email'];
          userPhone = response['data']['phone_number'];
          usernameController.text = userName;
          emailController.text = userEmail;
          phoneController.text = userPhone;
          isLoading = false;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserProfile();

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
      isChanged = usernameController.text != userName ||
          phoneController.text != userPhone ||
          emailController.text != userEmail;
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
            borderRadius: BorderRadius.circular(15.0),
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
          contentPadding: const EdgeInsets.all(20),
          content: SizedBox(
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Kembali',
                          style: buttonFont2,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Simpan",
                          style: buttonFont2,
                          selectionColor: secondary,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  const Text("Perubahan berhasil disimpan!"),
                              backgroundColor: Colors.lightGreen,
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
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
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: primary,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(left: 10, top: 50, right: 10),
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
                        Text('Ubah Profile',
                            style: superFont1.copyWith(color: white)),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 55),
                  Stack(
                    children: [
                      Container(
                        width: 115,
                        height: 115,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: primary,
                            width: 10,
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
                                        leading: Icon(Icons.camera_alt,
                                            color: primary),
                                        title: const Text(
                                            'Ambil Foto dari Kamera'),
                                        onTap: () {
                                          pickImageFromCamera();
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading:
                                            Icon(Icons.photo, color: primary),
                                        title:
                                            const Text('Tambahkan dari Galeri'),
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
                            radius: 12,
                            child: const Icon(Icons.add_a_photo_outlined,
                                size: 15, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: buildInputField(
                      labelText: 'Username',
                      controller: usernameController,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                  ProfileOption(
                    text: 'Hapus Akun',
                    selectedItemColor: primary,
                    onTap: () {
                      // Add your profile editing logic here
                    },
                    color: primary,
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: isChanged ? _showSaveConfirmationDialog : null,
                    style: longButton1,
                    child: Text('Simpan Perubahan', style: buttonFont1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
  required TextEditingController controller,
  TextInputType inputType = TextInputType.text,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(
        color: tertiary,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: tertiary,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: primary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
