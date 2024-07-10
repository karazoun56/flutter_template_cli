import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class TableView extends StatelessWidget {
  const TableView({
    required this.columns,
    required this.rows,
    super.key,
  });

  final IList<DataColumn> columns;
  final IList<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    final splitColumn = columns.splitAt(2);
    final splitRows1 = rows.map((e) => e.cells.toIList().splitAt(2).$1.toList());
    final splitRows2 = rows.map((e) => e.cells.toIList().splitAt(2).$2.toList());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DataTable(
          columns: splitColumn.$1.toList(),
          rows: splitRows1.map((e) => DataRow(cells: e)).toList(),
          columnSpacing: 0,
          headingRowHeight: 34,
          horizontalMargin: 0,
          border: TableBorder.all(color: Colors.transparent),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: DataTable(
              columns: splitColumn.$2.toList(),
              rows: splitRows2.map((e) => DataRow(cells: e)).toList(),
              dividerThickness: 1,
              headingRowHeight: 34,
              horizontalMargin: 12,
              columnSpacing: 12,
              border: TableBorder.all(color: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }
}
