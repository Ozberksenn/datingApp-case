import 'package:datingapp/features/widgets/padding.dart';
import 'package:flutter/material.dart';

class CustomView extends StatelessWidget {
  final AppBar? appBar;
  final Widget body;
  final EdgeInsetsGeometry? padding;
  const CustomView({super.key, this.appBar, required this.body, this.padding});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: padding ?? ConstEdgeInsets.padding16(),
        child: body,
      ),
    );
  }
}
