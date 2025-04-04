import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:solano_app/app/constants/color_constants.dart';

class ToastService {
  ToastService._();

  static final GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showToastMessage({
    required BuildContext context,
    required String content,
    Color? color,
  }) async {
    await Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConstants.deepBlueColor,
        textColor: ColorConstants.whiteColor,
        fontSize: 16.0);
  }
}
