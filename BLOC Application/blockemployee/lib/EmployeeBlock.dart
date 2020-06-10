//// Work Flow

// TODO: imports
// TODO: list of employees
// TODO: stream controllers
// TODO: stream sink getter
// TODO: Constructor - add data, listen to changes
// TODO: core functions
// TODO: dispose

import 'dart:async';
import 'Employee.dart';

class EmployeeBloc {
  //sink to add in pipe
  //stream to get data from pipe
  //pipe means data flow here

  List<Employee> _employeeList = [
    Employee(1, "Employee One", 10000.0),
    Employee(2, "Employee Two", 15000.0),
    Employee(3, "Employee Three", 12000.0),
    Employee(4, "Employee Four", 11000.0),
    Employee(5, "Employee Five", 50000.0),
  ];

  final _employeeListStreamController = StreamController<List<Employee>>();

  // for increment and decrement
  final _employeeSalaryIncrementStreamController = StreamController<Employee>();
  final _employeeSalaryDecrementStreamController = StreamController<Employee>();

  // getters

  Stream<List<Employee>> get employeeListStream =>
      _employeeListStreamController.stream;
  StreamSink<List<Employee>> get employeeListSink =>
      _employeeListStreamController.sink;

  StreamSink<Employee> get employeeSalaryIncrement =>
      _employeeSalaryIncrementStreamController.sink;
  StreamSink<Employee> get employeeSalaryDecrement =>
      _employeeSalaryDecrementStreamController.sink;

  EmployeeBloc() {
    _employeeListStreamController.add(_employeeList);
    _employeeSalaryIncrementStreamController.stream.listen(_incrementSalary);
    _employeeSalaryDecrementStreamController.stream.listen(_decrementSalary);
  }

  _incrementSalary(Employee employee) {
    double salary = employee.salary;
    double incrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary + incrementedSalary;
    employeeListSink.add(_employeeList);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double decrementedSalary = salary * 20 / 100;

    _employeeList[employee.id - 1].salary = salary - decrementedSalary;
    employeeListSink.add(_employeeList);
  }

  void dispose() {
    _employeeSalaryIncrementStreamController.close();
    _employeeSalaryDecrementStreamController.close();
    _employeeListStreamController.close();
  }
}
