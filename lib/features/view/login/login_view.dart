import 'package:datingapp/features/view-model/login/login_cubit.dart';
import 'package:datingapp/features/view-model/login/login_state.dart';
import 'package:datingapp/features/widgets/custom_view.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/features/widgets/social_media.dart';
import 'package:datingapp/product/constants/app_fonts.dart';
import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../product/editors/text_field_widget.dart';
import '../../widgets/button.dart';
import '../../widgets/snackbar_widgets.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void submit(BuildContext context) async {
    if (_emailController.text == "" || _passwordController.text == "") {
      errorSnackabr(context, "E-posta ya da şifre alanı boş olamaz");
    }
    context.read<LoginCubit>().login(
      _emailController.text,
      _passwordController.text,
    );
  }

  void successLogin(LoginState state) {
    successSnackbar(context, "Success Login");
    context.go(AppRoutes.path(AppRoutes.home));
    _emailController.text = "";
    _passwordController.text = "";
  }

  void errorLogin(LoginState state) {
    errorSnackabr(context, state.errorMessage ?? "Error");
    _emailController.text = "";
    _passwordController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return CustomView(
            body: Column(
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
                TextFieldWidget(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  labelText: "E-posta",
                ),
                CustomSizedBox.paddingHeight(heightValue: 14.0),
                TextFieldWidget(
                  controller: _passwordController,
                  prefixIcon: Icons.key,
                  suffixIcon: Icons.remove_red_eye,
                  obscure: true,
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
                      state.isLoading == false
                          ? Button(
                            name: "Giriş Yap",
                            onTap: () => submit(context),
                          )
                          : ButtonLoading(),
                ),
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
                    InkWell(
                      onTap:
                          () =>
                              context.push(AppRoutes.path(AppRoutes.register)),
                      child: Text(
                        "Kayıt Ol",
                        style: Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                CustomSizedBox.paddingHeight(heightValue: 100.0),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.isSuccess == true) {
            successLogin(state);
          }
          if (state.isSuccess == false) {
            errorLogin(state);
          }
        },
      ),
    );
  }
}
