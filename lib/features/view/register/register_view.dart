import 'package:datingapp/features/view-model/register/register_cubit.dart';
import 'package:datingapp/features/widgets/custom_view.dart';
import 'package:datingapp/features/widgets/snackbar_widgets.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../product/constants/app_fonts.dart';
import '../../../product/editors/text_field_widget.dart';
import '../../view-model/register/register_state.dart';
import '../../widgets/button.dart';
import '../../widgets/padding.dart';
import '../../widgets/social_media.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordAgainController = TextEditingController();

  void register(BuildContext context) {
    if (_passwordController.text == _passwordAgainController.text) {
      context.read<RegisterCubit>().register(
        _emailController.text,
        _nameController.text,
        _passwordController.text,
      );
    } else {
      errorSnackabr(context, "şifreler uyum sağlamıyor.");
    }
  }

  void successRegister(RegisterState state) {
    successSnackbar(context, "Kullanıcı Başarıyla Oluşturuldu");
    context.go(AppRoutes.path(AppRoutes.login));
    clearInputs();
  }

  void errorRegister(RegisterState state) {
    errorSnackabr(context, state.errorMessage ?? "error");
    clearInputs();
  }

  void clearInputs() {
    _nameController.text = "";
    _emailController.text = "";
    _passwordController.text = "";
    _passwordAgainController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        builder: (context, state) {
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
                TextFieldWidget(
                  controller: _nameController,
                  prefixIcon: Icons.email,
                  labelText: "Ad Soyad",
                ),
                CustomSizedBox.paddingHeight(heightValue: 10.0),
                TextFieldWidget(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  labelText: "E-posta",
                ),
                CustomSizedBox.paddingHeight(heightValue: 10.0),
                TextFieldWidget(
                  controller: _passwordController,
                  prefixIcon: Icons.key,
                  suffixIcon: Icons.remove_red_eye,
                  labelText: "Şifre",
                ),
                CustomSizedBox.paddingHeight(heightValue: 10.0),
                TextFieldWidget(
                  controller: _passwordAgainController,
                  prefixIcon: Icons.key,
                  labelText: "Şifre Tekrar",
                ),
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
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    name: "Şimdi Kaydol",
                    onTap: () => register(context),
                  ),
                ),
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
        },
        listener: (context, state) {
          if (state.isSuccess == true) {
            successRegister(state);
          } else {
            errorRegister(state);
          }
        },
      ),
    );
  }
}
