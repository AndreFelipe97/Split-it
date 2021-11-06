import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widget/add_button_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/theme/app_theme.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({
    required VoidCallback onTap,
    required UserModel user,
  }) : super(
          preferredSize: Size.fromHeight(300.0),
          child: Stack(
            children: [
              Container(
                height: 231.0,
                decoration: BoxDecoration(
                  gradient: AppTheme.gradients.background,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 19.0),
                child: Column(
                  children: [
                    Container(
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32.0),
                          child: _buildUserTile(user, onTap),
                        ),
                      ),
                    ),
                    SizedBox(height: 36.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: 15.0),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

  static ListTile _buildUserTile(
    UserModel user,
    VoidCallback? onTap,
  ) {
    return ListTile(
      contentPadding: EdgeInsets.all(0.0),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(user.photoUrl!)),
      title: Text(
        user.name!,
        style: TextStyle(
            color: AppTheme.colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w400),
      ),
      trailing: AddButtonWidget(
        onTap: onTap,
      ),
    );
  }
}
