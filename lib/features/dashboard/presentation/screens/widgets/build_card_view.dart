import 'package:responsive_framework/responsive_framework.dart';
import 'package:ultimate_solution_task/core/src/app_export.dart';

class BuildCardView extends StatelessWidget {
  const BuildCardView({super.key, required this.view, required this.iconButton, this.title, this.titleSize, this.tablesSize, this.desktopSize, this.defaultSize, this.verticalPadding});
  final Widget view;
  final Widget iconButton;
  final String? title;
  final double? titleSize;
  final double? tablesSize;
  final double? desktopSize;
  final double? defaultSize;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveValue<double>(
        context,
        conditionalValues: [
          Condition.smallerThan(value: (tablesSize??500).w, name: TABLET),
          Condition.largerThan(value: (desktopSize??150).w, name: DESKTOP),
        ],
        defaultValue: (defaultSize??140).w,
      ).value,
      child: Card(
        margin: EdgeInsetsDirectional.only(top: 10.h, end: 5.w),
        elevation: 10.r,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: (verticalPadding??25).h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title??'title',style: AppTextStyles.textStyle(
                      size: titleSize??14,
                      weight: FontWeight.w700,
                      color: AppColors.blackOpacity
                    ),),
                    iconButton,
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              view,
            ],
          ),
        ),
      ),
    );
  }
}
