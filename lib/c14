import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

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

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'students.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        phone TEXT,
        github TEXT,
        roll TEXT
      )
    ''');
  }

  Future<int> insertStudent(Student student) async {
    var dbClient = await db;
    return await dbClient.insert('students', student.toMap());
  }

  Future<List<Student>> getStudents() async {
    var dbClient = await db;
    List<Map<String, dynamic>> maps = await dbClient.query('students');
    return maps.map((e) => Student.fromMap(e)).toList();
  }

  Future<int> updateStudent(Student student) async {
    var dbClient = await db;
    return await dbClient.update('students', student.toMap(),
        where: 'id = ?', whereArgs: [student.id]);
  }

  Future<int> deleteStudent(int id) async {
    var dbClient = await db;
    return await dbClient.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}

class StudentCRUDApp extends StatefulWidget {
  @override
  _StudentCRUDAppState createState() => _StudentCRUDAppState();
}

class _StudentCRUDAppState extends State<StudentCRUDApp> {
  final _formKey = GlobalKey<FormState>();
  final dbHelper = DatabaseHelper();

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
    List<Student> students = await dbHelper.getStudents();
    setState(() {
      studentList = students;
    });
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

      if (editingId == null) {
        await dbHelper.insertStudent(student);
      } else {
        await dbHelper.updateStudent(student);
      }

      resetForm();
      fetchStudents();
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
    await dbHelper.deleteStudent(id);
    fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student CRUD')),
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
