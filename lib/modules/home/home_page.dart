import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widget/app_bar_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
        appBar: AppBarWidget(
      user: user,
      onTap: () {},
    ));
  }
}
