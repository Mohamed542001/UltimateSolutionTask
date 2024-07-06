import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_card_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/dashboard_table.dart';

class BuildBottomTables extends StatelessWidget {
  const BuildBottomTables({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Wrap(
      children: [
        DashboardTable(
          tableRows: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Product',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Price',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Orders',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

              ],
            ),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
          ],
        ),
        DashboardTable(
          tableRows: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Product',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Price',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Orders',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

              ],
            ),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
          ],
        ),
        DashboardTable(
          tableRows: [
            TableRow(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.05),
              ),
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Product',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Price',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                        bottom: BorderSide(
                            width: 2.0,
                            color: AppColors.black.withOpacity(0.05)),
                      ),
                    ),
                    child: const Text(
                      'Orders',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),

              ],
            ),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
            TableRow(children: [
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('ASOS Ridley High Waist'),
                ),
              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('\$79.49'),
                ),

              ),
              const TableCell(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('82'),
                ),
              ),
            ]),
          ],
        ),
      ],
    );
  }
}
