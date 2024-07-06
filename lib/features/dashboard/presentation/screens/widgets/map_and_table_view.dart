import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_card_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/country_charts.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/custom_map.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/dashboard_table.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/top_selling_products_table.dart';

class MapAndTableView extends StatelessWidget {
  const MapAndTableView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1420
        ? Row(
      children: [
        Expanded(
          flex: screenWidth < 1420 ?4:3,
          // width: screenWidth<1500?screenWidth*0.46:screenWidth<1300?screenWidth*0.2:screenWidth*0.2,
          child: BuildCardView(
            view: SizedBox(
                height: 300,
                child: Row(
                  children: [
                    Expanded(flex: 3, child: CustomMaps()),
                    SizedBox(
                      width: 15.w,
                    ),
                    const Expanded(flex: 2, child: CountryCharts())
                    // CountryCharts(),
                  ],
                )),
            iconButton: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.more_vert),
                  onPressed: () {
                    final RenderBox button =
                    context.findRenderObject() as RenderBox;
                    final RenderBox overlay = Overlay.of(context)
                        .context
                        .findRenderObject() as RenderBox;
                    final Offset position = button
                        .localToGlobal(Offset.zero, ancestor: overlay);
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        position.dx - 90,
                        position.dy + button.size.height,
                        position.dx + button.size.width,
                        position.dy + button.size.height,
                      ),
                      items: [
                        const PopupMenuItem<int>(
                          value: 1,
                          child: Text('Item 1'),
                        ),
                        const PopupMenuItem<int>(
                          value: 2,
                          child: Text('Item 2'),
                        ),
                        const PopupMenuItem<int>(
                          value: 3,
                          child: Text('Item 3'),
                        ),
                      ],
                    ).then((value) {
                      if (value != null) {
                        // Handle item selection here
                        print('Selected item: $value');
                        // You can add any action you want to perform here
                      }
                    });
                  },
                );
              },
            ),
          ),
        ),
        const Expanded(
            flex: 2,
            // width: screenWidth<1500?screenWidth*0.4:screenWidth*0.43,
            child: TopSellingProductsTable()),
      ],
    )
        : SizedBox(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: BuildCardView(
              view: SizedBox(
                  height: 280,
                  child: Row(
                    children: [
                      Expanded(flex: 2, child: CustomMaps()),
                      SizedBox(
                        width: 15.w,
                      ),
                      const Expanded(flex: 2, child: CountryCharts())
                      // CountryCharts(),
                    ],
                  )),
              iconButton: Builder(
                builder: (context) {
                  return IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      final RenderBox button =
                      context.findRenderObject() as RenderBox;
                      final RenderBox overlay = Overlay.of(context)
                          .context
                          .findRenderObject() as RenderBox;
                      final Offset position = button
                          .localToGlobal(Offset.zero, ancestor: overlay);
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          position.dx - 90,
                          position.dy + button.size.height,
                          position.dx + button.size.width,
                          position.dy + button.size.height,
                        ),
                        items: [
                          const PopupMenuItem<int>(
                            value: 1,
                            child: Text('Item 1'),
                          ),
                          const PopupMenuItem<int>(
                            value: 2,
                            child: Text('Item 2'),
                          ),
                          const PopupMenuItem<int>(
                            value: 3,
                            child: Text('Item 3'),
                          ),
                        ],
                      ).then((value) {
                        if (value != null) {
                          // Handle item selection here
                          print('Selected item: $value');
                          // You can add any action you want to perform here
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
          const SizedBox(
              width: double.infinity,
              child: TopSellingProductsTable()),
        ],
      ),
    );
  }
}
