import 'package:flutter/material.dart';
import '../controllers/attendance_controller.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  // Instantiating the controller locally
  final AttendanceController _controller = AttendanceController();

  @override
  void initState() {
    super.initState();
    // Re-render view whenever the controller triggers notifyListeners()
    _controller.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Attendance'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Stat Dashboard Header Area
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.teal.withOpacity(0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Total Students: ${_controller.totalCount}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Present: ${_controller.presentCount}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                ),
              ],
            ),
          ),
          
          // Student Attendance Status List Builder
          Expanded(
            child: ListView.builder(
              itemCount: _controller.students.length,
              itemBuilder: (context, index) {
                final student = _controller.students[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      child: Text(student.name[0], style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(student.name),
                    subtitle: Text('ID: ${student.id}'),
                    trailing: Checkbox(
                      activeColor: Colors.teal,
                      value: student.isPresent,
                      onChanged: (bool? value) {
                        _controller.toggleAttendance(index);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}