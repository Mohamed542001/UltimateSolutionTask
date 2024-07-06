import 'package:ultimate_solution_task/core/src/app_export.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key, required this.icon, required this.title, this.leading, this.onTap, this.isHovering, this.isSelected, this.isDrawer});
  final IconData icon;
  final String title;
  final Widget? leading;
  final GestureTapCallback? onTap;
  final bool? isHovering;
  final bool? isSelected;
  final bool? isDrawer;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon,color:isSelected==true?AppColors.primary:AppColors.black ,),
          const SizedBox(width: 10,),
          if(screenWidth>1150||isDrawer==true)Text(title,style: AppTextStyles.textStyle(
            color: isSelected==true?AppColors.primary:AppColors.black,
          ),),
          if(screenWidth>1150||isDrawer==true)...[
            const Spacer(),
            Icon(Icons.keyboard_arrow_down,color:isSelected==true?AppColors.primary:AppColors.black ,)
          ]
        ],
      ),
    );
  }
}
