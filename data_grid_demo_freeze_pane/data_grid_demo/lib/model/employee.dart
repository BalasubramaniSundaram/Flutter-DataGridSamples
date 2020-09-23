import 'dart:math' as math;

math.Random radom = math.Random();

class Employee {
  Employee(
      {this.id, this.name, this.designation, this.salary, this.experience, this.serialNumber, this.level});

  int id;
  String name;
  String designation;
  int salary;
  int experience;
  String serialNumber;
  String level;
}

populateData(int count)
{
    List<Employee> employeeData = List<Employee>();
    for(var i = 1 ; i<= count ; i++ ) {
      final range = i;
      employeeData.add(
          Employee(
              id: range,
              name: names[radom.nextInt((names.length - 1))],
              designation: position[radom.nextInt((position.length - 1))],
              salary: (1000 + range),
              experience: (range * 2) ~/ 2,
              serialNumber: (10 + range).toString(),
              level: level[radom.nextInt(level.length - 1)]
          )
      );
    }

    return employeeData;
}

// List<String> names = ['Anandh','Aswin', 'Gowtham', 'Mani'];

List<String> names = ['Anandh','Aswin', 'Gowtham', 'Mani', 'Sakthi', 'Ashok', 'Titus', 'Siva', 'Pandi',
'Jaya Prakash', 'Vishnu'];

List<String> position = ['Software Engineer', 'Network Engineer', 'Testing Engineer', 'Product Manager'];

List<String> level = ['Level 1', 'Level 2', ' Level 3']; 

List<Employee> employeeData = populateData(100);

List employeeDataHeader = ['ID', 'Name', 'Designation', 'Experience', 'Salary', 'Serial', 'Level','Salary', 'Serial', 'Level'];


class StudentDetails{
  String studentName;
  String level;
}

List<StudentDetails> studentDetails = [
  StudentDetails()
  ..studentName = 'Aswin'
  ..level = 'one',
  StudentDetails()
    ..studentName = 'Gowtham'
    ..level = 'two',
];

