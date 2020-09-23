import 'package:data_grid_demo/user_guide/data_pager_alone.dart';
import 'package:data_grid_demo/user_guide/datagrid_alone.dart';
import 'package:data_grid_demo/user_guide/datagrid_with_datapager.dart';
import 'package:flutter/material.dart';

class UserGuideSamplesHomePage extends StatefulWidget {
  @override
  _UserGuideSamplesHomePageState createState() =>
      _UserGuideSamplesHomePageState();
}

class _UserGuideSamplesHomePageState extends State<UserGuideSamplesHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'SfDataGrid Collections',
            style:
                TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
          ),
        ),
        body: ListView(children: [
          ListTile(
            title: Text('DataGrid', style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new SfDataGridAlone()));
            },
          ),
          ListTile(
            title: Text('DataPager', style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new SfDataPagerAlone()));
            },
          ),
          ListTile(
            title: Text('DataGrid with DataPager', style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new UGDataGridWithDataPager()));
            },
          ),
        ]));
  }
}
