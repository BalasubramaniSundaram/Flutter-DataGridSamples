import 'package:data_grid_demo/data_grid/freeze_pane_sample.dart';
import 'package:flutter/material.dart';

class SfDataGridSamplesHomePage extends StatefulWidget {
  @override
  _SfDataGridSamplesHomePageState createState() =>
      _SfDataGridSamplesHomePageState();
}

class _SfDataGridSamplesHomePageState extends State<SfDataGridSamplesHomePage> {
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
            title: Text(
              'Freeze Pane',
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new DataGridFreezePane()));
            },
          ),
        ]));
  }
}
