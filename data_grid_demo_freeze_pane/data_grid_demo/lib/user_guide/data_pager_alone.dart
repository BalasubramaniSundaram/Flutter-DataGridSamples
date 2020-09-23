import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';


class SfDataPagerAlone extends StatefulWidget {
  @override
  _SfDataPagerAloneState createState() => _SfDataPagerAloneState();
}

class _SfDataPagerAloneState extends State<SfDataPagerAlone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: 2)
              ),
              child: SfDataPagerTheme(
                data: SfDataPagerThemeData(
                  // itemColor: Colors.white,
                  // selectedItemColor: Colors.lightGreen,
                  // itemBorderRadius: BorderRadius.circular(5),
                  // backgroundColor: Colors.teal,
                ),
                child: SfDataPager(
                  delegate: _CustomDataPagerDelegate(),
                  rowsPerPage: 20,
                  direction: Axis.horizontal,
                ),
              ),
            ),
          ),
        )
    );
  }
}

class _CustomDataPagerDelegate extends DataPagerDelegate {
  @override
  int get rowCount => 100;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex,
      int startRowIndex, int rowsPerPage) {
    return super.handlePageChange(
        oldPageIndex, newPageIndex, startRowIndex, rowsPerPage);
  }
}

