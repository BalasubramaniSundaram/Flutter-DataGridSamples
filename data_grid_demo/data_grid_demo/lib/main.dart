import 'package:data_grid_demo/data_grid/datagrid_home.dart';
import 'package:data_grid_demo/data_pager/data_pager_home.dart';
import 'package:data_grid_demo/user_guide/user_guide_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'model/data_grid_source.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List<IPLTeamData> _iplTeamData;

class _MyHomePageState extends State<MyHomePage> {
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
            title: Text(
              'SfDataGrid Samples',
              style: TextStyle(color: Colors.black45),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new SfDataGridSamplesHomePage()));
            },
          ),
          ListTile(
            title: Text('DataPager Samples',
                style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new SfDataPagerSamplesHomePage()));
            },
          ),
          ListTile(
            title: Text('UG', style: TextStyle(color: Colors.black45)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => new UserGuideSamplesHomePage()));
            },
          ),
        ]));
  }
}
