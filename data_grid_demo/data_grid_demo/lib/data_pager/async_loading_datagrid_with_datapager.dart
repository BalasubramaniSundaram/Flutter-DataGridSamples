import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:data_grid_demo/model/employee.dart';

class AsyncDataGridWithDataPager extends StatefulWidget {
  @override
  _AsyncDataGridWithDataPager createState() => _AsyncDataGridWithDataPager();
}

List<Employee> _employees = [];

List<Employee> paginatedDataSource = [];

bool showLoadingIndicator = false;

class _AsyncDataGridWithDataPager extends State<AsyncDataGridWithDataPager> {
  EmployeeDataSource _employeeDataSource;
  final DataPagerController _dataPagerController = DataPagerController();

  @override
  void initState() {
    super.initState();
    _employeeDataSource = EmployeeDataSource()..addListener(updateWidget);
    _employees = populateData(100);
  }

  updateWidget() {
    setState(() {});
  }

  _loadDataGrid(BoxConstraints constraints) {
    List<Widget> _getChildren() {
      final List<Widget> stackChildren = [];
      if (paginatedDataSource.isNotEmpty) {
        stackChildren.add(SfDataGrid(
            source: _employeeDataSource,
            columnWidthMode: ColumnWidthMode.fill,
            columns: <GridColumn>[
              GridNumericColumn(mappingName: 'id', headerText: 'ID'),
              GridTextColumn(mappingName: 'name', headerText: 'Name'),
              GridTextColumn(
                  mappingName: 'designation', headerText: 'Designation'),
              GridNumericColumn(mappingName: 'salary', headerText: 'Salary')
            ]));
      }

      if (showLoadingIndicator) {
        stackChildren.add(Container(
          color: Colors.black12,
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          ),
        ));
      }

      return stackChildren;
    }

    return Stack(
      children: _getChildren(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('DataPager'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Row(children: [
              Column(
                children: [
                  SizedBox(
                      height: constraints.maxHeight - 60,
                      width: constraints.maxWidth-100,
                      child: _loadDataGrid(constraints)),
                  Container(
                    height: 60,
                    width: constraints.maxWidth-100,
                    child: SfDataPager(
                      delegate: _employeeDataSource,
                      controller: _dataPagerController,
                      rowsPerPage: 20,
                      direction: Axis.horizontal,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  FlatButton(onPressed: (){
                    _dataPagerController.nextPage();
                  }, child: Text('Next')),
                  FlatButton(onPressed: (){
                    _dataPagerController.previousPage();
                  }, child: Text('Previous'))
                ],
              )
            ]);
          },
        ),
      ),
    );
  }
}

class EmployeeDataSource extends DataGridSource<Employee> {
  @override
  List<Employee> get dataSource => paginatedDataSource;

  @override
  int get rowCount => _employees.length;

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

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex,
      int startRowIndex, int rowsPerPage) async {
    int endIndex = startRowIndex + rowsPerPage;
    if (endIndex > _employees.length) {
      endIndex = _employees.length - 1;
    }

    showLoadingIndicator = true;
    notifyListeners();
    await Future.delayed(Duration(milliseconds: 2000));
    showLoadingIndicator = false;
    notifyListeners();

    paginatedDataSource = List.from(
        _employees.getRange(startRowIndex, endIndex).toList(growable: false));
    notifyDataSourceListeners();
    return true;
  }
}
