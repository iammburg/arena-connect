import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/history/history_detail.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color(0xFF12215C),
<<<<<<< HEAD
        elevation: 0,
        title: Text('History Pembayaran', style: buttonFont1),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10), 
            child: Container(
            color: const Color(0xFF12215C),
            height: 4.0, 
            ),
=======
        title: Padding(
          padding: const EdgeInsets.only(top: 35, left: 15),
          child: Text('History Pertandingan',
              style: superFont1.copyWith(color: Colors.white)),
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildSimpleCard(
                    context: context,
                    title: "GOR DIPONEGORO",
                    icon: Icons.sports_soccer,
<<<<<<< HEAD
                    level: "Futsal",
                    dateTime: "Jum, 5 Dec 2024, 09.00-10.00",
                    location: "Lapangan Badminton 2A Diponegoro", 
=======
                    level: "Futsal - semua level",
                    dateTime: "Sen, 23 Sep 2024, 19.00-21.00",
                    location: "Lap. Futsal Reham, Smg",
>>>>>>> 277f23f4722744267c271bac2d98fe68f56d3a58
                  ),
                  const SizedBox(height: 16),
                  buildSimpleCard(
                    context: context,
                    title: "GOR TRI LOMBA JUANG",
                    icon: Icons.sports_tennis,
                    level: "Badminton",
                    dateTime: "Rab, 27 Nov 2024, 08.00-09.00",
                    location: "Lapangan Badminton 2A Tri Juang",
                    navigateToDetails: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSimpleCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required String level,
    required String dateTime,
    required String location,
    bool navigateToDetails = false,
  }) {
    return InkWell(
      onTap: navigateToDetails
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HistoryDetail(),
                ),
              );
            }
          : null,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF12215C), width: 2.8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
                    color: Color(0xFF12215C),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: superFont3,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                Icon(icon, size: 18, color: const Color(0xFF12215C)),
                const SizedBox(width: 6),
                Text(level, style: superFont4),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.calendar_today,
                    size: 18, color: Color(0xFF12215C)),
                const SizedBox(width: 6),
                Text(dateTime, style: superFont4),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.location_on_outlined,
                    size: 18, color: Color(0xFF12215C)),
                const SizedBox(width: 6),
                Text(location, style: superFont4),
              ],
            ),
            const SizedBox(height: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.arrow_forward_ios,
                    size: 15, color: Color(0xFF12215C)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
