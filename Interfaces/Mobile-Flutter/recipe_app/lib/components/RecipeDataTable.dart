import 'package:flutter/material.dart';
import 'package:recipe_app/app-config.dart';

// ignore: must_be_immutable
class RecipeDataTable extends StatelessWidget {

  double screenHeight;
  double screenWidth;
  double elevation;
  List<String> dataList;
  String colName;
  final Color pinkTheme = RecipeAppTheme.pinkTheme;

  RecipeDataTable({@required this.colName, @required this.dataList, this.elevation=2});

  @override
  Widget build(BuildContext context) {

    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: elevation,
      shadowColor: pinkTheme.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.all(5),
        child: DataTable(
          columns: [
            DataColumn(
                label: Text(
                  colName,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
                )
            )
          ],
          rows: dataList.map(
                (e) => DataRow(
                cells: <DataCell>[
                  DataCell(Text(e))
                ]
            ),
          ).toList(),
        ),
      ),
    );
  }
}
