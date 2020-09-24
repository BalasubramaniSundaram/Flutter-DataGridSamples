import 'package:data_grid_demo/data_pager/async_loading_datagrid_with_datapager.dart';
import 'package:data_grid_demo/data_pager/datapager_datagrid.dart';
import 'package:data_grid_demo/data_pager/datapager_listview.dart';
import 'package:flutter/material.dart';

class SfDataPagerSamplesHomePage extends StatefulWidget {
  @override
  _SfDataPagerSamplesHomePageState createState() =>
      _SfDataPagerSamplesHomePageState();
}

class _SfDataPagerSamplesHomePageState
    extends State<SfDataPagerSamplesHomePage> {
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
            title: Text('DataPager with DataGrid',
                style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DataPagerDataGrid()));
            },
          ),
          ListTile(
            title: Text('DataPager ListView',
                style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DataPagerWithListView()));
            },
          ),
          ListTile(
            title: Text('Async Loading with datagrid',
                style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new AsyncDataGridWithDataPager()));
            },
          ),
        ]));
  }
}
