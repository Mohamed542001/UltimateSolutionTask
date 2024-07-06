import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:ultimate_solution_task/features/dashboard/cubit/dashboard_cubit.dart';

class HoverCard extends StatefulWidget {
  const HoverCard({super.key, required this.width});

  @override
  _HoverCardState createState() => _HoverCardState();
  final double width;

}

class _HoverCardState extends State<HoverCard> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController controller;
  late Animation<double> rotationAnimation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    rotationAnimation = Tween<double>(begin: 0.6, end: 0.0).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit,DashboardState>(
      builder: (context,state) {
        var cubit = DashboardCubit.get(context);
        return MouseRegion(
          onEnter: (_) => cubit.onHover(controller,true),
          onExit: (_) => cubit.onHover(controller,false),
          child:
          SizedBox(
            width: widget.width<800?double.infinity:225,
            // width: widget.width<500|| widget.width<1100?double.infinity:80.w,
            child: Card(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("CUSTOMERS",
                              style: AppTextStyles.textStyle(
                                color: AppColors.grey,
                                size: 12,
                                weight: FontWeight.w700
                              ),),
                              SizedBox(
                                height: 15.h,
                              ),
                              Text("9,254",
                                style: AppTextStyles.textStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    size: 18,
                                    weight: FontWeight.w700
                                ),),
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: rotationAnimation,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: rotationAnimation.value,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.purple,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.ac_unit),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration:  BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(2)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.arrow_downward_outlined,size: 10,color:  AppColors.white,),
                              Text("2,541",
                                style: AppTextStyles.textStyle(
                                    color: AppColors.white,
                                    size: 12,
                                ),),
                            ],
                          ),
                        ),
                        SizedBox(width: 5.w,),
                        const Expanded(
                          child: Text("Since last month",overflow: TextOverflow.ellipsis,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}

