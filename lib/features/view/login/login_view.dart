import 'package:datingapp/features/view-model/login/login_cubit.dart';
import 'package:datingapp/features/view-model/login/login_state.dart';
import 'package:datingapp/features/view/login/widgets/login_form.dart';
import 'package:datingapp/features/widgets/custom_view.dart';
import 'package:datingapp/features/widgets/padding.dart';
import 'package:datingapp/features/widgets/social_media.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/constants/app_fonts.dart';
import 'package:datingapp/product/extension/context_extension.dart';
import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../main.dart';
import '../../widgets/snackbar_widgets.dart';
import 'widgets/login_header.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChangeLanguage(),
                Column(
                  children: [
                    LoginHeader(),
                    CustomSizedBox.paddingHeight(heightValue: 24.0),
                    LoginForm(
                      emailController: _emailController,
                      passwordController: _passwordController,
                    ),
                    CustomSizedBox.paddingHeight(heightValue: 36.0),
                    SocialMediaWidget(),
                    CustomSizedBox.paddingHeight(heightValue: 36.0),
                    InkWell(
                      onTap:
                          () =>
                              context.push(AppRoutes.path(AppRoutes.register)),
                      child: RichText(
                        text: TextSpan(
                          text: "${context.loc.dontHaveAnAccount}  ",
                          style: AppFonts.greyText,
                          children: [
                            TextSpan(
                              text: context.loc.signup,
                              style: TextStyle(
                                color: AppColors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    CustomSizedBox.paddingHeight(heightValue: 100.0),
                  ],
                ),
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

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.watch<LoginCubit>();
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: ConstEdgeInsets.paddingSymetric(
          verticalPad: 50,
          horizontalPad: 10,
        ),
        child: DropdownButton(
          value: cubit.state.language,
          items: [
            DropdownMenuItem(
              value: 'TR',
              child: Text("TR", style: AppFonts.greyText),
            ),
            DropdownMenuItem(
              value: 'EN',
              child: Text("EN", style: AppFonts.greyText),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              MyApp.setLocale(context, Locale(value.toLowerCase()));
              cubit.changeLanguage(value);
            }
          },
        ),
      ),
    );
  }
}
