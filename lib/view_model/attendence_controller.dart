import 'package:flutter/material.dart';
import '../models/student_model.dart';

class AttendanceController extends ChangeNotifier {
  // Simulating database storage locally
  final List<Student> _students = [
    Student(id: '1', name: 'Alex Johnson'),
    Student(id: '2', name: 'Beatrice Smith'),
    Student(id: '3', name: 'Charlie Davis'),
    Student(id: '4', name: 'Diana Prince'),
  ];

  // Getter to expose data safely without allowing external file mutation
  List<Student> get students => _students;

  // Toggle state logic
  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners(); // Essential for pushing updates down to the View layer
  }

  // Calculate Quick Stats
  int get presentCount => _students.where((student) => student.isPresent).length;
  int get totalCount => _students.length;
}