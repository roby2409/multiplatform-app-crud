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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              teksCardWidget("Nama", user.city),
              const SizedBox(
                height: 5,
              ),
              teksCardWidget("Address", user.address),
              const SizedBox(
                height: 5,
              ),
              teksCardWidget("Email", user.email),
            ]),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                teksCardWidget("Kota", user.city),
                const SizedBox(
                  height: 5,
                ),
                teksCardWidget("No Phone", user.phoneNumber),
              ],
            )
          ],
        ),
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
