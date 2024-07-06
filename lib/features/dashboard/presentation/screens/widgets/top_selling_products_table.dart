import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/dashboard_table.dart';

class TopSellingProductsTable extends StatelessWidget {
  const TopSellingProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardTable(
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
                'Avl. Quantity',
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
                'Seller',
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
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('8,540'),
          ),

        ),
        const TableCell(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Adidas')
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
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('8,540'),
          ),

        ),
        const TableCell(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Adidas')
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
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('8,540'),
          ),

        ),
        const TableCell(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Adidas')
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
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('8,540'),
          ),

        ),
        const TableCell(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Adidas')
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
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('8,540'),
          ),

        ),
        const TableCell(
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Adidas')
          ),
        ),


      ]),

    ],
      bottomWidget: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          // primary: Colors.blue, // Background color
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(5.0), // Border radius
          ),
        ),
        child: Text('View all',style: AppTextStyles.textStyle(
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primary,
            color: AppColors.primary
        ),),
      ),
    );
  }
}
