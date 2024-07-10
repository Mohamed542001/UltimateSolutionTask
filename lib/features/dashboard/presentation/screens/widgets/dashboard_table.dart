import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_card_view.dart';

class DashboardTable extends StatelessWidget {
  const DashboardTable({super.key, required this.tableRows, this.bottomWidget});
  final List<TableRow> tableRows;
  final Widget? bottomWidget;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BuildCardView(view: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 500,
            child: Table(
              border: const TableBorder.symmetric(
                inside: BorderSide.none,
                outside: BorderSide.none,
              ),
              children: tableRows,
            ),
          ),
        ),
        bottomWidget??const SizedBox.shrink()
      ],
          ), iconButton: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        // primary: Colors.blue, // Background color
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(5.0), // Border radius
        ),
      ),
      child: Text('Export',style: AppTextStyles.textStyle(),),
    ),
    );
  }
}
