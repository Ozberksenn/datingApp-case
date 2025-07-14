import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorSnackabr(
  BuildContext context,
  final String errorMessage,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.buttonColor,
      content: Text(errorMessage),
    ),
  );
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> successSnackbar(
  BuildContext context,
  final String successMessage,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.green,
      content: Text(successMessage),
    ),
  );
}
