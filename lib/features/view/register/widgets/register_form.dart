import 'package:datingapp/features/view-model/register/register_cubit.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../product/constants/app_colors.dart';
import '../../../../product/constants/app_fonts.dart';
import '../../../../product/editors/text_field_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/snackbar_widgets.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordAgainController;
  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.passwordAgainController,
  });

  @override
  Widget build(BuildContext context) {
    final RegisterCubit cubit = context.watch<RegisterCubit>();

    void register(BuildContext context) {
      if (passwordController.text == passwordAgainController.text) {
        context.read<RegisterCubit>().register(
          emailController.text,
          nameController.text,
          passwordController.text,
        );
      } else {
        errorSnackabr(context, "şifreler uyum sağlamıyor.");
      }
    }

    return Column(
      children: [
        TextFieldWidget(
          controller: nameController,
          prefixIcon: FontAwesomeIcons.envelope,
          labelText: context.loc.name,
        ),
        CustomSizedBox.paddingHeight(heightValue: 10.0),
        TextFieldWidget(
          controller: emailController,
          prefixIcon: FontAwesomeIcons.envelope,
          labelText: context.loc.email,
        ),
        CustomSizedBox.paddingHeight(heightValue: 10.0),
        TextFieldWidget(
          controller: passwordController,
          prefixIcon: FontAwesomeIcons.unlockKeyhole,
          suffixIcon: Icons.remove_red_eye,
          labelText: context.loc.password,
          obscure: true,
        ),
        CustomSizedBox.paddingHeight(heightValue: 10.0),
        TextFieldWidget(
          controller: passwordAgainController,
          prefixIcon: FontAwesomeIcons.unlockKeyhole,
          labelText: context.loc.againPassword,
          obscure: true,
        ),
        CustomSizedBox.paddingHeight(heightValue: 12.0),
        RichText(
          text: TextSpan(
            text: context.loc.registerAgreementFirst,
            style: AppFonts.greyText,
            children: [
              TextSpan(
                text: " ${context.loc.registerAgreementSecond} ",
                style: TextStyle(
                  color: AppColors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: context.loc.registerAgreementThirth,
                style: AppFonts.greyText,
              ),
            ],
          ),
        ),
        CustomSizedBox.paddingHeight(heightValue: 36.0),
        SizedBox(
          width: double.infinity,
          child:
              cubit.state.isLoading == false
                  ? Button(
                    name: context.loc.registerButton,
                    onTap: () => register(context),
                  )
                  : ButtonLoading(),
        ),
      ],
    );
  }
}
