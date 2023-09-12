import 'dart:io';
import 'dart:math';
import 'package:windows1251/windows1251.dart';

class Student {
  int id;
  String surname;
  String middle;
  String firstName;
  int age;
  String group;
  int grade;

  Student(
    this.id,
    this.age,
    this.group,
    this.grade, {
    required this.surname,
    required this.middle,
    required this.firstName,
  });
}

class StudentList {
  List<Student> students = [];

  StudentList(this.students);
  void addStudent(Student student) {
    students.add(student); 
  }
  Student? getStudentWithHighestGrade(bool highest) {
  if (students.isEmpty) {
    return null;
  }
  
  Student? studentWithHighestGrade = students.first;
  for (Student student in students) {
    if (highest) {
      if (student.grade > studentWithHighestGrade!.grade) {
        studentWithHighestGrade = student;
      }
    } else {
      if (student.grade < studentWithHighestGrade!.grade) {
        studentWithHighestGrade = student;
      }
    }
  }
  
  return studentWithHighestGrade;
}
  double getAverageGrade(students) {
  if (students.isEmpty) {
    return 0.0;
  }

  double totalGrade = 0.0;
  for (var student in students) {
    totalGrade += student.grade;
  }

  return totalGrade / students.length;
}

  void removeStudentId(students, int id) {
  students.removeWhere((student) => student.id == id);
}



void updateStudentDataById(students, int id, String newName,String surname, String last) {
  Student? student = students.firstWhere((student) => student.id == id);
  if (student != null) {
    student.middle = newName;
    student.firstName = surname;
    student.surname = last;
  }
}

}
class RandString{
  String getRandomString(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';

  String result = '';
  for (int i = 0; i < length; i++) {
    result += chars[random.nextInt(chars.length)];
  }
  
  return result;
}

}
void main(List<String> arguments) {
  RandString rand =RandString();
   Random random = Random();
   List<Student> studentList = [];
    for (int index = 0; index < 20; index++) {
    Student student = Student(
       index + 1,
       20 + index,
      'П50-${index + 1}-21',
       random.nextInt(5) + 1,
      surname:  rand.getRandomString(10),
      middle: rand.getRandomString(10),
      firstName: rand.getRandomString(10)
    );
    
    studentList.add(student);
  }
  
  
  StudentList students = StudentList(studentList);
  Student st = Student(66, 56, 'П-555', 3, surname: "Фихаилыч", middle: 'Вано', firstName: 'Ванисимо');
  students.addStudent(st);
  while(true){
    print("Выбирите действие:");
    print("1) Добавить студента");
    print("2) Вывести студента с наивысшим средним балом");
    print("3) Вывести студента с наименьшим средним балом");
    print("4) Вывести средний бал всех студентов");
    print("5) Удалить студента");
    print("6) Изменить данные студента");
    print("7) Вывести всех студентов");
    int a = int.parse(stdin.readLineSync()!);
    switch(a){
      case 1:
        print("Возраст:");
        
        int id =  int.parse(stdin.readLineSync()!);
        int age =  int.parse(stdin.readLineSync()!);
         print("Группа:");
        String group = stdin.readLineSync()!;
         print("Средний бал:");
        int grade =  int.parse(stdin.readLineSync()!);
         print("Фамилия:");
         String firstName = stdin.readLineSync()!;
          print("Имя:");
         String middle = stdin.readLineSync()!;
          print("Отчество:");
         String surname = stdin.readLineSync()!;
        Student st = Student(id, age, group, grade, surname: surname, middle: middle, firstName: firstName);
        students.addStudent(st);
        break;
        case 2:
        Student? highestGradeStudent = students.getStudentWithHighestGrade(true);
        print('Наивысший бал у студента:');
        print('ID: ${highestGradeStudent!.id}, Имя: ${highestGradeStudent.firstName} ${highestGradeStudent.middle} ${highestGradeStudent.surname}, Возраст: ${highestGradeStudent.age}, Группа: ${highestGradeStudent.group}, Средний балл: ${highestGradeStudent.grade}');

        break;
        case 3:
        Student? highestGradeStudent = students.getStudentWithHighestGrade(false);
        print('Наивысший бал у студента:');
        print('ID: ${highestGradeStudent!.id}, Имя: ${highestGradeStudent.firstName} ${highestGradeStudent.middle} ${highestGradeStudent.surname}, Возраст: ${highestGradeStudent.age}, Группа: ${highestGradeStudent.group}, Средний балл: ${highestGradeStudent.grade}');

        break;
        case 4:
       double averageGrade = students.getAverageGrade(students.students);
        print('Средний бал: $averageGrade');
        break;
        case 5:
        print("Введите ID человека которого надо удалить");
        int id =  int.parse(stdin.readLineSync()!);
        students.removeStudentById(students.students, id);
         for (var student in students.students ) {
    print('ID: ${student.id}, Имя: ${student.firstName} ${student.middle} ${student.surname}, Возраст: ${student.age}, Группа: ${student.group}, Средний балл: ${student.grade}');
  }
        break;
        case 6:
        print("Введите ID у которого изменить данные");
        int id =  int.parse(stdin.readLineSync()!);
         print("Фамилия:");
         String firstName = stdin.readLineSync()!;
          print("Имя:");
         String middle = stdin.readLineSync()!;
          print("Отчество:");
         String surname = stdin.readLineSync()!;
         students.updateStudentDataById(students.students, id, middle,firstName,surname);

         for (var student in students.students ) {
    print('ID: ${student.id}, Имя: ${student.firstName} ${student.middle} ${student.surname}, Возраст: ${student.age}, Группа: ${student.group}, Средний балл: ${student.grade}');
  }
        break;
        case 7:
        for (var student in students.students ) {
    print('ID: ${student.id}, Имя: ${student.firstName} ${student.middle} ${student.surname}, Возраст: ${student.age}, Группа: ${student.group}, Средний балл: ${student.grade}');
  }
        break;
    }
  }

 
}