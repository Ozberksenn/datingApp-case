import 'package:datingapp/features/view-model/add_photo/add_photo_cubit.dart';
import 'package:datingapp/features/view/profile/widgets/profile_app_bar.dart';
import 'package:datingapp/features/widgets/button.dart';
import 'package:datingapp/features/widgets/loading.dart';
import 'package:datingapp/features/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../view-model/add_photo/add_photo_state.dart';
import '../../widgets/padding.dart';
import 'widgets/upload_photo_card.dart';

class AddPhotoView extends StatelessWidget {
  const AddPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AddPhotoCubit(),
      child: BlocConsumer<AddPhotoCubit, AddPhotoState>(
        builder: (context, state) {
          if (state.isLoading == false) {
            return AddPhotoContent();
          } else {
            return LoadingWidget();
          }
        },
        listener: (context, state) {
          if (state.isSuccess == true) {
            successSnackbar(context, "Görsel Başarıyla Yüklendi.");
            context.pop();
          }
        },
      ),
    );
  }
}

class AddPhotoContent extends StatelessWidget {
  const AddPhotoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context, limitedOffer: false),
      bottomNavigationBar: Container(
        height: 60,
        margin: ConstEdgeInsets.paddingSymetric(
          verticalPad: 40,
          horizontalPad: 20,
        ),
        child: Button(
          name: "Devam",
          onTap: () => context.read<AddPhotoCubit>().uploadPhoto(),
        ),
      ),
      body: Column(
        children: [
          CustomSizedBox.paddingHeight(heightValue: 6.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Fotoğraflarınızı Yükleyin",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          CustomSizedBox.paddingHeight(heightValue: 6.0),
          Text(
            "Resources out incentivize \n relaxation floor loss cc.",
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          CustomSizedBox.paddingHeight(heightValue: 32.0),
          UploadPhotoCardWidget(),
        ],
      ),
    );
  }
}
