import 'package:data_grid_demo/user_guide/datagrid_with_datapager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmptyPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<EmptyPage> {
  @override
  Widget build(BuildContext context) {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body:  SfDataPager(
          //delegate: _orderInfoDataSource,
          rowsPerPage: 20,
          direction: Axis.horizontal,
        ),
      );
    }
  }
}


