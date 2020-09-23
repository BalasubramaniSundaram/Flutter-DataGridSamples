import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:data_grid_demo/model/employee.dart';

class SfDataGridAlone extends StatefulWidget {
  @override
  _DataGridAlone createState() => _DataGridAlone();
}

List<Employee> _employees = [];

class _DataGridAlone extends State<SfDataGridAlone> {
  EmployeeDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource();
    _employees = populateData(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataGrid'),
      ),
      body: SfDataGrid(
          source: _employeeDataSource,
          columnWidthMode: ColumnWidthMode.fill,
          columns: <GridColumn>[
            GridNumericColumn(mappingName: 'id', headerText: 'ID'),
            GridTextColumn(mappingName: 'name', headerText: 'Name'),
            GridTextColumn(
                mappingName: 'designation', headerText: 'Designation'),
            GridNumericColumn(mappingName: 'salary', headerText: 'Salary')
          ]),
    );
  }
}

class EmployeeDataSource extends DataGridSource<Employee> {
  @override
  List<Employee> get dataSource => _employees;

  @override
  Object getValue(Employee data, String columnName) {
    switch (columnName) {
      case 'id':
        return data.id;
        break;
      case 'name':
        return data.name;
        break;
      case 'salary':
        return data.salary;
        break;
      case 'designation':
        return data.designation;
        break;
      default:
        return ' ';
        break;
    }
  }
}
