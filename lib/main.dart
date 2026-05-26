import 'package:flutter/material.dart';
import 'views/attendance_screen.dart';

void main() {
  runApp(const SchoolAttendanceApp());
}

class SchoolAttendanceApp extends StatelessWidget {
  const SchoolAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Attendance System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.teal,
      ),
      home: const AttendanceScreen(),
    );
  }
}