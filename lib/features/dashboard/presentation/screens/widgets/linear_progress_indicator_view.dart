import 'package:ultimate_solution_task/core/src/app_export.dart';

class LinearProgressIndicatorView extends StatelessWidget {
  const LinearProgressIndicatorView({super.key, required this.title, required this.number, required this.value});
  final String title;
  final int number;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: AppTextStyles.textStyle(
          color: AppColors.blackOpacity
        ),),
        Row(
          children: [
            Expanded(child: LinearProgressIndicator(color: AppColors.primary,backgroundColor: AppColors.cA4ACAD,value: value,),),
            SizedBox(
              width: 5.w,
            ),
            Text("${number}K",style: AppTextStyles.textStyle(
              weight: FontWeight.w700
            ),),
          ],
        ),
      ],
    );
  }
}
