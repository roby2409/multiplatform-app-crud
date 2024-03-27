import 'package:flutter/material.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  bool navigateToSwipeBack(BuildContext context) {
    Navigator.pop(context);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => navigateToSwipeBack(context),
        child: Scaffold(
            appBar: AppBar(
                title: const Text("Add New User"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => navigateToSwipeBack(context),
                )),
            body: Container(
                color: kBgGreenColorContainerLight,
                width: 100.w,
                height: 100.h,
                child: const Text("add new user"))));
  }
}
