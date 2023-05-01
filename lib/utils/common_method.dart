import 'package:fluttertoast/fluttertoast.dart';

import 'app_colors.dart';

class CommonMethod{

  static showToast(String message){
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.white.withOpacity(0.9),
      textColor: AppColors.black,
      fontSize: 16.0,
    );
  }

}