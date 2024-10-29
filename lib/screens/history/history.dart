import 'package:arena_connect/config/theme.dart';
import 'package:arena_connect/screens/history/history_detail.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HistoryScreen(),
  ));
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: const Color(0xFF12215C),
        elevation: 0,
        title: Text('History Pertandingan', style: buttonFont1),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10), 
            child: Container(
            color: const Color(0xFF12215C),
            height: 4.0, 
            ),
        ),
        ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  buildSimpleCard(
                    context: context,
                    title: "Mabar Yok Guys -",
                    icon: Icons.sports_soccer,
                    level: "Futsal - semua level",
                    dateTime: "Sen, 23 Sep 2024, 19.00-21.00",
                    location: "Lap. Futsal Reham, Smg", 
                  ),
                  const SizedBox(height: 16),
                  buildSimpleCard(
                    context: context,
                    title: "Tanding berani??",
                    icon: Icons.sports_tennis,
                    level: "Badminton - semua level",
                    dateTime: "Min, 22 Sep 2024, 10.00-12.00",
                    location: "Lap. Bad Bulusan, Temb",
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF12215C), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 14,
              height: 14,
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
            Text(level, style: superFont5),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.calendar_today, size: 18, color: Color(0xFF12215C)),
            const SizedBox(width: 6),
            Text(dateTime, style: superFont5),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.location_on_outlined, size: 18, color: Color(0xFF12215C)),
            const SizedBox(width: 6),
            Text(location, style: superFont5),
          ],
        ),
        const SizedBox(height: 2),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.arrow_forward_ios, size: 8, color: Color(0xFF12215C)), 
          ],
        ),
      ],
    ),
  ),
  );
}

}

