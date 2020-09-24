import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter/foundation.dart';
import 'package:data_grid_demo/model/data_grid_source.dart';

List<IPLTeamData> _iplTeamData;

class DataGridFreezePane extends StatefulWidget {
  @override
  _DataGridFreezePaneState createState() => _DataGridFreezePaneState();
}

class _DataGridFreezePaneState extends State<DataGridFreezePane> {
  final _CutsomDataGridSource dataGridSource = _CutsomDataGridSource();
  ColumnSizer _columnSizer = ColumnSizer();

  final Map<String, Image> images = {
    'Chennai super kings': Image.asset(
      "images/chennai-super-kings.png",
      width: 30,
      height: 30,
      alignment: Alignment.center,
    ),
    'Delhi capitals':
        Image.asset("images/delhi-capitals.png", width: 30, height: 30),
    'Kings xi punjab': Image.asset(
      "images/kings-eleven-punjab.png",
      width: 30,
      height: 30,
      alignment: Alignment.center,
    ),
    'Kolkata knight riders':
        Image.asset("images/kolkata-knight-riders.png", width: 30, height: 30),
    'Mumbai indians':
        Image.asset("images/mumbai-indians.png", width: 30, height: 30),
    'Royal challengers bangalore': Image.asset(
        "images/royal-challengers-bangalore.png",
        width: 30,
        height: 30
        ),
    'Sunrisers hyderabad':
        Image.asset("images/sunrisers-hyderbad.png", width: 30, height: 30),
    'Rajasthan royals':
        Image.asset("images/rajasthan-royals.png", width: 50, height: 50),
  };

  final Map<String, Color> teamColor = {
    'Chennai super kings': Colors.yellowAccent,
    'Delhi capitals': Colors.blueAccent,
    'Kings xi punjab': Colors.redAccent,
    'Kolkata knight riders': Colors.purple,
    'Mumbai indians': Colors.blue,
    'Royal challengers bangalore': Colors.red,
    'Sunrisers hyderabad': Colors.yellow,
    'Rajasthan royals': Colors.pink,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.indigo,
            elevation: 0.0,
            title: Text(
              'SF-IPL Schedule 2020',
              style: TextStyle(color: Colors.white),
            )),
        body: FutureBuilder(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/ipl_time_table.json'),
          builder: (context, snapshot) {
            _iplTeamData = _getData(snapshot) ?? [];

            if (_iplTeamData.isEmpty) {
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
              );
            } else {
              return SfDataGridTheme(
                data: SfDataGridThemeData(
                    frozenPaneLineColor: Colors.black12,
                    frozenPaneLineWidth: .5,
                    gridLineStrokeWidth: 1,
                    gridLineColor: Colors.black12,
                    headerStyle: DataGridHeaderCellStyle(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                            color: Colors.black45,
                            fontSize: 13,
                            fontWeight: FontWeight.normal)),
                    cellStyle: DataGridCellStyle(
                        backgroundColor: Colors.white,
                        textStyle: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.normal, fontSize: 12))),
                child: SfDataGrid(
                  source: dataGridSource,
                  frozenColumnsCount: 3,
                  columnSizer: _columnSizer,
                  cellBuilder: (contex, column, rowIndex) {
                    final IPLTeamData iplTeamData = _iplTeamData[rowIndex];

                    List<Widget> getChildren(Image logo, String teamName) {
                      final List<Widget> children = [];

                      children.add(logo);

                      if (kIsWeb) {
                        children.add(SizedBox(width: 10));
                        children.add(Text(
                          teamName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 10),
                        ));
                      }

                      return children;
                    }

                    if (column.mappingName == 'teamOneLogo') {
                      return Container(
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: getChildren(iplTeamData.teamOneLogo,
                                iplTeamData.teamNameOne)),
                      );
                    } else if (column.mappingName == 'teamTwoLogo') {
                      return Container(
                          margin: EdgeInsets.all(2),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getChildren(iplTeamData.teamTwoLogo,
                                  iplTeamData.teamNameTwo)));
                    } else {
                      return Container(
                          alignment: Alignment.center,
                          child: Text('${rowIndex + 1}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12)));
                    }
                  },
                  columns: [
                    GridWidgetColumn(mappingName: 'index', headerText: 'S.no')
                      ..width = kIsWeb ? 100 : 70
                      ..headerTextAlignment = Alignment.center,
                    GridWidgetColumn(
                        mappingName: 'teamOneLogo', headerText: 'T1')
                      ..width = kIsWeb ? 220 : 80
                      ..headerTextAlignment = Alignment.center,
                    GridWidgetColumn(
                        mappingName: 'teamTwoLogo', headerText: 'T2')
                      ..width = kIsWeb ? 220 : 80
                      ..headerTextAlignment = Alignment.center,
                    GridTextColumn(mappingName: 'date', headerText: 'Date')
                      ..textAlignment = Alignment.center
                      ..headerTextAlignment = Alignment.center,
                    GridTextColumn(mappingName: 'day', headerText: 'Day')
                      ..textAlignment = Alignment.center
                      ..headerTextAlignment = Alignment.center,
                    GridTextColumn(mappingName: 'time', headerText: 'Timing')
                      ..textAlignment = Alignment.center
                      ..headerTextAlignment = Alignment.center,
                    GridTextColumn(mappingName: 'venue', headerText: 'Venue')
                      ..headerTextAlignment = Alignment.center
                      ..width = 100,
                  ],
                ),
              );
            }
          },
          initialData: [],
        ),
      ),
    );
  }

  List<IPLTeamData> _getData(AsyncSnapshot snapshot) {
    var _data = json.decode(snapshot?.data?.toString());
    if (_data == null || !snapshot.hasData) return null;
    return _data
        .map<IPLTeamData>((e) => IPLTeamData(
            teamOneLogo: images[e['TeamNameOne']],
            teamTwoLogo: images[e['TeamNameTwo']],
            teamNameOne: e['TeamNameOne'],
            teamNameTwo: e['TeamNameTwo'],
            date: e['Date'],
            day: e['Day'],
            time: e['Time'],
            venue: e['Venue']))
        .toList(growable: false);
  }
}

class _CutsomDataGridSource extends DataGridSource<IPLTeamData> {
  @override
  List<IPLTeamData> get dataSource => _iplTeamData;

  @override
  Object getValue(IPLTeamData data, String columnName) {
    switch (columnName) {
      case 'teamNameOne':
        return data.teamNameOne;
        break;

      case 'teamNameTwo':
        return data.teamNameTwo;
        break;

      case 'day':
        return data.day;
        break;

      case 'date':
        return data.date;
        break;

      case 'time':
        return data.time;
        break;

      case 'venue':
        return data.venue;
        break;
      default:
        return '';
        break;
    }
  }
}
