import 'package:flutter/material.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardUsers extends StatelessWidget {
  final UserEntity user;
  final Color cardColor;
  const CardUsers({
    super.key,
    required this.user,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          border: Border.all(color: kGreyColorLight),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          teksCardWidget("Nama", user.name),
          SizedBox(
            height: 1.h,
          ),
          teksCardWidget("Address", user.address),
          SizedBox(
            height: 1.h,
          ),
          teksCardWidget("Email", user.email),
          SizedBox(
            height: 1.h,
          ),
          teksCardWidget("Kota", user.city),
          SizedBox(
            height: 1.h,
          ),
          teksCardWidget("No Phone", user.phoneNumber),
        ]),
      ),
    );
  }

  Widget teksCardWidget(String keyProperty, String? valueProperty) {
    return Row(
      children: [
        Text("$keyProperty: ", style: blackTextStyle.copyWith(fontSize: 14.sp)),
        Text(valueProperty ?? '-',
            style: blackTextStyle.copyWith(
                fontSize: 14.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
