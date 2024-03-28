import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:multiplatform_app_crud/presentation/bloc/list_all_users/list_all_users_bloc.dart';
import 'package:multiplatform_app_crud/presentation/bloc/post_data/post_data_cubit.dart';
import 'package:multiplatform_app_crud/presentation/widgets/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:multiplatform_app_crud/injection.dart' as di;

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final PostDataCubit postDataCubit = di.locator<PostDataCubit>();

  bool _autoValidate = false;
  bool navigateToSwipeBack(BuildContext context) {
    Navigator.pop(context);
    return true;
  }

  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumbeController = TextEditingController();
  final _cityController = TextEditingController();

  String? validatePhoneNumber(String? value) {
    // Add your phone number validation logic here
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Invalid phone number';
    }
    return null;
  }

  String? validateEmail(String? value) {
    // Add your email validation logic here
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Invalid email address';
    }
    return null;
  }

  String? validateRequired(String field, String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $field.';
    }
    return null;
  }

  final Map<String, dynamic> _fieldErrors = {
    "name": null,
    "address": null,
    "email": null,
    "phoneNumber": null,
    "city": null,
  };

  void clearError(String field) {
    setState(() {
      _fieldErrors[field] = null;
    });
  }

  void onLoginButtonPressed() {
    if (_key.currentState!.validate()) {
      postDataCubit.postUserData(
        name: _nameController.text,
        address: _addressController.text,
        email: _emailController.text,
        phoneNumber: _phoneNumbeController.text,
        city: _cityController.text,
      );
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  @override
  void dispose() {
    _phoneNumbeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => navigateToSwipeBack(context),
        child: BlocListener<PostDataCubit, PostDataState>(
            listener: (context, state) {
          if (state.newUser != null) {
            snackBarDialog(context, ["Success add ${state.newUser?.name}"],
                warnaSnackbar: kGreenColorSecondButton);
            context.read<ListAllUsersBloc>().add(FetchAllPengguna());
            Navigator.pop(context);
          }
        }, child: BlocBuilder<PostDataCubit, PostDataState>(
                builder: (context, state) {
          return Scaffold(
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
                  child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Form(
                            key: _key,
                            autovalidateMode: _autoValidate
                                ? AutovalidateMode.always
                                : AutovalidateMode.disabled,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  CustomTextFormField(
                                    labelText: 'Name *',
                                    labelTextInOutside: true,
                                    labelTextStyle: greenTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: bold),
                                    hintText: 'Enter your name',
                                    hintTextStyle: greyTextStyleLight.copyWith(
                                        fontSize: 14.5.sp, fontWeight: bold),
                                    textInputAction: TextInputAction.next,
                                    filled: true,
                                    isDense: true,
                                    controller: _nameController,
                                    onChanged: (_) {
                                      clearError('name');
                                    },
                                    validator: ((value) =>
                                        validateRequired('name', value)),
                                    borderWidth: 2.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    errorText: _fieldErrors['name'],
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Address *',
                                    labelTextInOutside: true,
                                    labelTextStyle: greenTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: bold),
                                    hintText: 'Enter your address',
                                    hintTextStyle: greyTextStyleLight.copyWith(
                                        fontSize: 14.5.sp, fontWeight: bold),
                                    textInputAction: TextInputAction.next,
                                    filled: true,
                                    isDense: true,
                                    controller: _addressController,
                                    onChanged: (_) {
                                      clearError('address');
                                    },
                                    validator: ((value) =>
                                        validateRequired('address', value)),
                                    borderWidth: 2.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    errorText: _fieldErrors['address'],
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Email *',
                                    labelTextInOutside: true,
                                    labelTextStyle: greenTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: bold),
                                    hintText: 'Enter your email',
                                    hintTextStyle: greyTextStyleLight.copyWith(
                                        fontSize: 14.5.sp, fontWeight: bold),
                                    textInputAction: TextInputAction.next,
                                    filled: true,
                                    isDense: true,
                                    controller: _emailController,
                                    onChanged: (_) {
                                      clearError('email');
                                    },
                                    validator: validateEmail,
                                    borderWidth: 2.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    errorText: _fieldErrors['email'],
                                  ),
                                  CustomTextFormField(
                                    labelText: 'Phone Number *',
                                    labelTextInOutside: true,
                                    labelTextStyle: greenTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: bold),
                                    hintText: 'Enter your phone number',
                                    hintTextStyle: greyTextStyleLight.copyWith(
                                        fontSize: 14.5.sp, fontWeight: bold),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.phone,
                                    filled: true,
                                    isDense: true,
                                    controller: _phoneNumbeController,
                                    onChanged: (_) {
                                      clearError('phoneNumber');
                                    },
                                    validator: validatePhoneNumber,
                                    borderWidth: 2.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    errorText: _fieldErrors['phoneNumber'],
                                  ),
                                  CustomTextFormField(
                                    labelText: 'City *',
                                    labelTextInOutside: true,
                                    labelTextStyle: greenTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: bold),
                                    hintText: 'Enter your city',
                                    hintTextStyle: greyTextStyleLight.copyWith(
                                        fontSize: 14.5.sp, fontWeight: bold),
                                    textInputAction: TextInputAction.done,
                                    filled: true,
                                    isDense: true,
                                    controller: _cityController,
                                    onChanged: (_) {
                                      clearError('city');
                                    },
                                    validator: ((value) =>
                                        validateRequired('city', value)),
                                    borderWidth: 2.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    errorText: _fieldErrors['city'],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  ElevatedButton(
                                      onPressed: onLoginButtonPressed,
                                      child: state.isLoading
                                          ? const Center(
                                              child: SizedBox(
                                                height: 18,
                                                width: 18,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(Colors.white),
                                                ),
                                              ),
                                            )
                                          : const Text("Submit"))
                                ]),
                          )))));
        })));
  }
}
