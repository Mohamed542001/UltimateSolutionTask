import 'package:ultimate_solution_task/core/src/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoadingDialog {

  static showLoadingDialog() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        dismissOnTap: false,
        indicator: SpinKitCubeGrid(
          size: 40.0,
          itemBuilder: (context, index) {
            return Container(
              height: 10,
              width: 10,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
            );
          },
        ),
        status: "loading");
  }

  static showLoadingView({Color? color}) {
    return const Center(
      child: CupertinoActivityIndicator()
    );
  }

  static showSimpleToast({required String msg, Color? color, Color? textColor}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: color ?? AppColors.blackOpacity,
        textColor: textColor ?? Colors.white,
        fontSize: 16.0);
  }
}
