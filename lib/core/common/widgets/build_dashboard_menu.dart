import 'package:responsive_framework/responsive_framework.dart';
import 'package:ultimate_solution_task/core/common/widgets/custom_list_tile.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/main_screen/cubit/home_cubit.dart';

class BuildDashboardMenu extends StatefulWidget {
  const BuildDashboardMenu({super.key, this.width, this.isDrawer=false});
  final double? width;
  final bool? isDrawer;

  @override
  State<BuildDashboardMenu> createState() => _BuildDashboardMenuState();
}

class _BuildDashboardMenuState extends State<BuildDashboardMenu> {

  bool isEmailExpanded = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<HomeCubit,HomeState>(
      builder: (context,state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          // color: AppColors.white,
          height: double.infinity,
          // decoration: BoxDecoration(
          //   boxShadow: [
          //
          // ),
          width:screenWidth<1150&&widget.isDrawer==false?70:250,
          child: Card(
            elevation: 10.r,
            margin: EdgeInsets.zero,
            shape: const ContinuousRectangleBorder(
                borderRadius: BorderRadius.zero
            ),
            child: ScrollConfiguration(
              behavior:
              ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: ListView(
                // physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children:  [
                  SizedBox(
                    height: 93,
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ResponsiveVisibility(
                            hiddenConditions: [
                              Condition.smallerThan(
                                  value: false, breakpoint: 400),
                            ],
                            child: Icon(
                              Icons.ac_unit,
                            ),
                          ),
                          if(screenWidth>1150||widget.isDrawer==true)const Text(
                            'JIDOX',
                            // style: AppTextStyles.font20BrownBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if(screenWidth>1150||widget.isDrawer==true)Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: AppColors.primary,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          children: [
                            Text(
                              'Doris Larson',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Founder',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: List.generate(cubit.menuListTile.length, (index)=>Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: MouseRegion(
                          // onEnter: cubit.onListTileHover(true,index),
                          // onExit: cubit.onListTileHover(false,index),
                          child: CustomListTile(
                            onTap: (){
                              print("object");
                              cubit.selectListTile(index,cubit.menuListTile);
                              print(cubit.menuListTile[index].isSelected);
                            },
                            icon: cubit.menuListTile[index].icon,
                            title: cubit.menuListTile[index].title,
                            isSelected: cubit.menuListTile[index].isSelected,
                            isDrawer: widget.isDrawer,
                          ),
                        ),
                      ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
