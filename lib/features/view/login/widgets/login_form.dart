import 'package:datingapp/features/view-model/login/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../product/editors/text_field_widget.dart';
import '../../../widgets/button.dart';
import '../../../widgets/padding.dart';
import '../../../widgets/snackbar_widgets.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  void submit(BuildContext context) async {
    if (emailController.text == "" || passwordController.text == "") {
      errorSnackabr(context, "E-posta ya da şifre alanı boş olamaz");
    }
    context.read<LoginCubit>().login(
      emailController.text,
      passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = context.watch<LoginCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(
          controller: emailController,
          prefixIcon: FontAwesomeIcons.envelope,
          labelText: "E-posta",
        ),
        CustomSizedBox.paddingHeight(heightValue: 14.0),
        TextFieldWidget(
          controller: passwordController,
          prefixIcon: FontAwesomeIcons.unlockKeyhole,
          suffixIcon:
              cubit.state.isObscuere == false
                  ? CupertinoIcons.eye
                  : CupertinoIcons.eye_slash_fill,
          obscure: cubit.state.isObscuere,
          onTapSuffix: () => context.read<LoginCubit>().changeObscureState(),
          labelText: "Şifre",
        ),
        CustomSizedBox.paddingHeight(heightValue: 24.0),
        RichText(
          text: TextSpan(
            text: 'Şifremi Unuttum',
            style: TextStyle(
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        CustomSizedBox.paddingHeight(heightValue: 24.0),
        SizedBox(
          width: double.infinity,
          child:
              cubit.state.isLoading == false
                  ? Button(name: "Giriş Yap", onTap: () => submit(context))
                  : ButtonLoading(),
        ),
      ],
    );
  }
}
