import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: StudentCRUDApp()));
}

class Student {
  int? id;
  String name, email, phone, github, roll;

  Student({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.github,
    required this.roll,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'github': github,
      'roll': roll,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  Student.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        email = map['email'],
        phone = map['phone'],
        github = map['github'],
        roll = map['roll'];
}

class ApiService {
  final String baseUrl = 'http://your-api-url.com/students'; // Replace this

  Future<List<Student>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Student.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load students');
    }
  }

  Future<void> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toMap()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add student');
    }
  }

  Future<void> updateStudent(Student student) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${student.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(student.toMap()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update student');
    }
  }

  Future<void> deleteStudent(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete student');
    }
  }
}

class StudentCRUDApp extends StatefulWidget {
  @override
  _StudentCRUDAppState createState() => _StudentCRUDAppState();
}

class _StudentCRUDAppState extends State<StudentCRUDApp> {
  final _formKey = GlobalKey<FormState>();
  final apiService = ApiService();

  List<Student> studentList = [];

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController githubCtrl = TextEditingController();
  TextEditingController rollCtrl = TextEditingController();

  int? editingId;

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  void fetchStudents() async {
    try {
      List<Student> students = await apiService.getStudents();
      setState(() {
        studentList = students;
      });
    } catch (e) {
      print("Error fetching students: $e");
    }
  }

  void resetForm() {
    nameCtrl.clear();
    emailCtrl.clear();
    phoneCtrl.clear();
    githubCtrl.clear();
    rollCtrl.clear();
    editingId = null;
  }

  void saveStudent() async {
    if (_formKey.currentState!.validate()) {
      Student student = Student(
        id: editingId,
        name: nameCtrl.text,
        email: emailCtrl.text,
        phone: phoneCtrl.text,
        github: githubCtrl.text,
        roll: rollCtrl.text,
      );

      try {
        if (editingId == null) {
          await apiService.addStudent(student);
        } else {
          await apiService.updateStudent(student);
        }
        resetForm();
        fetchStudents();
      } catch (e) {
        print("Error saving student: $e");
      }
    }
  }

  void editStudent(Student student) {
    setState(() {
      nameCtrl.text = student.name;
      emailCtrl.text = student.email;
      phoneCtrl.text = student.phone;
      githubCtrl.text = student.github;
      rollCtrl.text = student.roll;
      editingId = student.id;
    });
  }

  void deleteStudent(int id) async {
    try {
      await apiService.deleteStudent(id);
      fetchStudents();
    } catch (e) {
      print("Error deleting student: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student CRUD via API')),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(children: [
          Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(controller: nameCtrl, decoration: InputDecoration(labelText: 'Name'), validator: (v) => v!.isEmpty ? 'Required' : null),
              TextFormField(controller: emailCtrl, decoration: InputDecoration(labelText: 'Email'), validator: (v) => v!.isEmpty ? 'Required' : null),
              TextFormField(controller: phoneCtrl, decoration: InputDecoration(labelText: 'Phone'), validator: (v) => v!.isEmpty ? 'Required' : null),
              TextFormField(controller: githubCtrl, decoration: InputDecoration(labelText: 'GitHub'), validator: (v) => v!.isEmpty ? 'Required' : null),
              TextFormField(controller: rollCtrl, decoration: InputDecoration(labelText: 'Roll No'), validator: (v) => v!.isEmpty ? 'Required' : null),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: saveStudent,
                child: Text(editingId == null ? 'Add Student' : 'Update Student'),
              )
            ]),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (_, index) {
                final student = studentList[index];
                return Card(
                  child: ListTile(
                    title: Text(student.name),
                    subtitle: Text('${student.email} | ${student.github}'),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                      IconButton(icon: Icon(Icons.edit), onPressed: () => editStudent(student)),
                      IconButton(icon: Icon(Icons.delete), onPressed: () => deleteStudent(student.id!)),
                    ]),
                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
