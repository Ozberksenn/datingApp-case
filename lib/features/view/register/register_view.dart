import 'package:datingapp/features/view-model/register/register_cubit.dart';
import 'package:datingapp/features/view/register/widgets/register_form.dart';
import 'package:datingapp/features/widgets/custom_view.dart';
import 'package:datingapp/features/widgets/snackbar_widgets.dart';
import 'package:datingapp/product/constants/app_colors.dart';
import 'package:datingapp/product/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view-model/register/register_state.dart';
import '../../widgets/padding.dart';
import '../../widgets/social_media.dart';
import 'widgets/register_header.dart';

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
                CustomSizedBox.paddingHeight(heightValue: 24.0),
                RegisterHeader(),
                CustomSizedBox.paddingHeight(heightValue: 24.0),
                RegisterForm(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  passwordAgainController: _passwordAgainController,
                ),
                CustomSizedBox.paddingHeight(heightValue: 36.0),
                SocialMediaWidget(),
                CustomSizedBox.paddingHeight(heightValue: 36.0),
                InkWell(
                  onTap: () => context.push(AppRoutes.path(AppRoutes.login)),
                  child: RichText(
                    text: TextSpan(
                      text: 'Zaten Bir Hesabın Var mı?  ',
                      style: TextStyle(
                        color: AppColors.lightGrey,
                        fontSize: 14,
                      ),
                      children: [
                        TextSpan(
                          text: 'Giriş Yap',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state.isSuccess == true) {
            successRegister(state);
          }
          if (state.isSuccess == false) {
            errorRegister(state);
          }
        },
      ),
    );
  }
}
