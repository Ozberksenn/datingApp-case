import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/theme/theme.dart';

class AppFonts {
  AppFonts._();

  static final greyText = AppTheme.darkTheme.textTheme.labelMedium!.copyWith(
    color: AppColors.lightGrey,
  );
  static final movieDescriptionText = AppTheme.darkTheme.textTheme.bodySmall!
      .copyWith(color: AppColors.lightGrey);
}
