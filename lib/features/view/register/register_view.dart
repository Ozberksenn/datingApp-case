import 'package:datingapp/features/widgets/custom_view.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../product/constants/app_fonts.dart';
import '../../../product/editors/text_field_widget.dart';
import '../../widgets/button.dart';
import '../../widgets/padding.dart';
import '../../widgets/social_media.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "Hoşgeldiniz",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
          CustomSizedBox.paddingHeight(heightValue: 6.0),
          Text(
            "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox.paddingHeight(heightValue: 24.0),
          TextFieldWidget(prefixIcon: Icons.email, labelText: "Ad Soyad"),
          CustomSizedBox.paddingHeight(heightValue: 10.0),
          TextFieldWidget(prefixIcon: Icons.email, labelText: "E-posta"),
          CustomSizedBox.paddingHeight(heightValue: 10.0),
          TextFieldWidget(
            prefixIcon: Icons.key,
            suffixIcon: Icons.remove_red_eye,
            labelText: "Şifre",
          ),
          CustomSizedBox.paddingHeight(heightValue: 10.0),
          TextFieldWidget(prefixIcon: Icons.key, labelText: "Şifre Tekrar"),
          CustomSizedBox.paddingHeight(heightValue: 12.0),
          RichText(
            text: TextSpan(
              text: 'Kullanıcı sözleşmesini ',
              style: AppFonts.greyText,
              children: [
                TextSpan(
                  text: 'okudum ve kabul ediyorum.',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' Bu sözleşmeyi okuyarak devam ediniz lütfen.',
                  style: AppFonts.greyText,
                ),
              ],
            ),
          ),
          CustomSizedBox.paddingHeight(heightValue: 36.0),
          SizedBox(width: double.infinity, child: Button(name: "Şimdi Kaydol")),
          CustomSizedBox.paddingHeight(heightValue: 36.0),
          SocialMediaWidget(),
          CustomSizedBox.paddingHeight(heightValue: 36.0),
          RichText(
            text: TextSpan(
              text: 'Zaten Bir Hesabın Var mı?  ',
              style: TextStyle(color: AppColors.lightGrey, fontSize: 14),
              children: [
                TextSpan(
                  text: 'Giriş Yap',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
