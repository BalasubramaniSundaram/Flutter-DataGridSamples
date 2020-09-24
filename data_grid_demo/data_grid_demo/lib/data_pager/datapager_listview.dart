import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:data_grid_demo/model/issues_data_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DataPagerWithListView extends StatefulWidget {
  @override
  _DataPagerWithListView createState() => _DataPagerWithListView();
}

List<IssueData> _paginatedData = [];

List<IssueData> _issueDataSource = generateList(50);

class _DataPagerWithListView extends State<DataPagerWithListView> {
  @override
  void initState() {
    super.initState();
  }

  void rebuildList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SF-Issues Board'),
        ),
        body: LayoutBuilder(builder: (context, constraint) {
          return Column(
            children: [
              Container(
                height: 40,
                color: Colors.grey.shade200,
                padding: EdgeInsets.fromLTRB(15.5, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(Icons.info_outline),
                    Text('  ${_issueDataSource.length} Open '),
                    SizedBox(width: 2),
                    Icon(
                      Icons.done,
                      size: 15,
                    ),
                    Text(' 2 Closed')
                  ],
                ),
              ),
              Container(
                  height: constraint.maxHeight - 100,
                  child: ListView.custom(
                      childrenDelegate: _CustomSliverDelegate(indexBuilder))),
              Container(
                color: Colors.grey.shade200,
                child: SfDataPagerTheme(
                    data: SfDataPagerThemeData(
                      itemBorderRadius: BorderRadius.circular(5),
                    ),
                    child: SfDataPager(
                        rowsPerPage: 10,
                        delegate: _CustomSliverDelegate(indexBuilder)
                          ..addListener(rebuildList))),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget indexBuilder(BuildContext context, int index) {
    final IssueData data = _paginatedData[index];
    return ListTile(
      title: LayoutBuilder(
        builder: (context, constraint) {
          return Container(
              width: constraint.maxWidth,
              height: 60,
              child: Row(
                children: [
                  Container(
                    width: 30,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.info_outline, color: Colors.green)),
                  ),
                  Container(
                    width: constraint.maxWidth - 60,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(data.title,
                            style: TextStyle(
                                color: Colors.black87, fontSize: 13))),
                  ),
                  Container(
                    width: 30,
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              size: 15,
                            ),
                            Text(
                              '${data.commentsCount}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10),
                            )
                          ],
                        ))),
                  ),
                ],
              ));
        },
      ),
      subtitle: Container(
        margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
        child: Text('#1600$index opened $index days ago by ${data.user}',
            style: TextStyle(color: Colors.black45, fontSize: 10)),
      ),
    );
  }
}

class _CustomSliverDelegate extends SliverChildBuilderDelegate
    with DataPagerDelegate, ChangeNotifier {
  _CustomSliverDelegate(builder) : super(builder);

  @override
  int get childCount => _paginatedData.length;

  @override
  int get rowCount => _issueDataSource.length;

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex,
      int startRowIndex, int rowsPerPage) async {
    int endIndex = startRowIndex + rowsPerPage;

    if (endIndex > _issueDataSource.length) {
      endIndex = _issueDataSource.length - 1;
    }

    _paginatedData = _issueDataSource
        .getRange(startRowIndex, endIndex)
        .toList(growable: false);

    notifyListeners();
    return true;
  }

  @override
  bool shouldRebuild(covariant _CustomSliverDelegate oldDelegate) {
    return true;
  }
}
