import '../src/app_export.dart';

class AppTextStyles {
  static TextStyle textStyle({
    Color? color,
    Color? decorationColor,
    double? size,
    TextDecoration? decoration,
    String? family,
    FontWeight? weight,
    List<Shadow>? shadow,
    double height = 1.3,
    bool? isDecorated = false,
    bool? isItalic = false,
  }) {
    return TextStyle(
      inherit: true,
      color: color ?? AppColors.black,
      fontSize: (size ?? 14),
      fontFamily: family ?? 'Helvetica',
      fontWeight: weight ?? FontWeight.w400,
      height: height,
      fontStyle: isItalic! ? FontStyle.italic : null,
      decoration: decoration,
      shadows: shadow,
      decorationColor: decorationColor,
    );
  }
}
