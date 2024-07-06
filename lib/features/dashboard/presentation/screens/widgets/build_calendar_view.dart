import 'package:flutter/cupertino.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';

class BuildCalendarView extends StatefulWidget {
  const BuildCalendarView({super.key});

  @override
  State<BuildCalendarView> createState() => _BuildCalendarViewState();
}

class _BuildCalendarViewState extends State<BuildCalendarView> {



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit,DashboardState>(
      builder: (context,state) {
        var cubit = DashboardCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  enabled: false,
                  onTap: (){
                    cubit.selectDate(context);
                  },
                  decoration: InputDecoration(
                    hintText: "${cubit.selectedDate.toLocal()}".split(' ')[0],
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.zero
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  cubit.selectDate(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  color: AppColors.primary,
                  child: Icon(
                    Icons.calendar_month,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 50,
                color: AppColors.primary,
                child: Icon(
                  Icons.refresh,
                  color: AppColors.white,
                ),
              ),

            ],
          ),
        );
      }
    );
  }
}
