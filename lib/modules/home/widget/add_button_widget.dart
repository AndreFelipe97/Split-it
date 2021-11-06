import 'package:flutter/material.dart';

class AddButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;

  const AddButtonWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 48.0,
        height: 56.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.fromBorderSide(
            BorderSide(
              color: Color(0xFFFFFFFF).withOpacity(.25),
              width: 1.5,
            ),
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
