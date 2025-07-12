import 'package:datingapp/features/view/login/widgets/underline_text_widget.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/features/widgets/social_media.dart';
import 'package:datingapp/product/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import '../../../product/editors/text_field_widget.dart';
import '../../widgets/button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ConstEdgeInsets.padding16(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Merhabalar",
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
            TextFieldWidget(prefixIcon: Icons.email, labelText: "E-posta"),
            CustomSizedBox.paddingHeight(heightValue: 14.0),
            TextFieldWidget(
              prefixIcon: Icons.key,
              suffixIcon: Icons.remove_red_eye,
              labelText: "Şifre",
            ),
            CustomSizedBox.paddingHeight(heightValue: 24.0),
            UnderlineTextWidget(text: "Şifremi Unuttum"),
            CustomSizedBox.paddingHeight(heightValue: 24.0),
            SizedBox(width: double.infinity, child: Button()),
            CustomSizedBox.paddingHeight(heightValue: 36.0),
            SocialMediaWidget(),
            CustomSizedBox.paddingHeight(heightValue: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Bir Hesabın Yok Mu?",
                  style: AppFonts.greyText,
                  textAlign: TextAlign.center,
                ),
                CustomSizedBox.paddingWidth(widthValue: 6.0),
                Text(
                  "Kayıt Ol",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            CustomSizedBox.paddingHeight(heightValue: 100.0),
          ],
        ),
      ),
    );
  }
}
