import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/build_card_view.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/revenue_widget.dart';
import 'package:ultimate_solution_task/features/dashboard/presentation/screens/widgets/segmented_progress_bar.dart';

class SegmentationAndRevenueView extends StatelessWidget {
  const SegmentationAndRevenueView({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 1100
        ? Row(
            children: [
              Expanded(
                flex: 1,
                child: SegmentedProgressBar(
                    progressValue: 70,
                    size: 200,
                    progressBarColor: AppColors.primary),
              ),
              Expanded(
                flex: 2,
                child: BuildCardView(view: const RevenueWidget(), iconButton: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        final RenderBox button = context.findRenderObject() as RenderBox;
                        final RenderBox overlay =
                        Overlay.of(context).context.findRenderObject() as RenderBox;
                        final Offset position =
                        button.localToGlobal(Offset.zero, ancestor: overlay);
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
                ),),
              ),
            ],
          )
        : Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: SegmentedProgressBar(
                    progressValue: 70,
                    size: 200,
                    progressBarColor: AppColors.primary),
              ),
              SizedBox(
                width: double.infinity,
                child: BuildCardView(view: const RevenueWidget(),
                  iconButton: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {
                        final RenderBox button = context.findRenderObject() as RenderBox;
                        final RenderBox overlay =
                        Overlay.of(context).context.findRenderObject() as RenderBox;
                        final Offset position =
                        button.localToGlobal(Offset.zero, ancestor: overlay);
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
            ],
          );
  }
}
