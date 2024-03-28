import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:multiplatform_app_crud/domain/entities/user_entity.dart';
import 'package:multiplatform_app_crud/presentation/bloc/cities/cities_bloc.dart';
import 'package:multiplatform_app_crud/presentation/bloc/list_all_users/list_all_users_bloc.dart';
import 'package:multiplatform_app_crud/presentation/pages/users/widget/cities_list.dart';
import 'package:multiplatform_app_crud/presentation/widgets/widgets.dart';
import 'package:multiplatform_app_crud/routes/routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'widget/card_user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final _searchInputController = TextEditingController();
  final _focusNode = FocusNode();
  List<String> _selectedCities = [];

  void _handleSelectCities(List<String> selectedCities) {
    setState(() {
      _selectedCities = selectedCities;
    });
    context.read<ListAllUsersBloc>().add(FilterByCity(_selectedCities));
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<ListAllUsersBloc>(context, listen: false)
          .add(FetchAllPengguna()),
    );
    Future.microtask(
      () => Provider.of<CitiesBloc>(context, listen: false).add(CitiesEvent()),
    );
  }

  void _resetSearchInput() {
    _searchInputController.clear();
    _focusNode.unfocus();
  }

  @override
  void dispose() {
    _resetSearchInput();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kGreenColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.pushNamed(context, AccurateApp.addUserPage),
          tooltip: 'add user',
          child: const Icon(Icons.person_add),
        ), // This tra
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 10),
          Expanded(
              child: Stack(children: [
            Positioned(
                top: 2.5.h,
                child: RefreshIndicator(
                    onRefresh: () async {
                      _resetSearchInput();
                      Provider.of<ListAllUsersBloc>(context, listen: false)
                          .add(FetchAllPengguna());
                    },
                    child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Container(
                            color: kBgGreenColorContainerLight,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "All Users",
                                        style: TextStyle(
                                            fontSize: 3.sh,
                                            fontWeight: FontWeight.bold,
                                            color: kGreenColorSecondButton),
                                      ),
                                      CitiesList(
                                        selectedCities: _selectedCities,
                                        onSelectCities: _handleSelectCities,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  CustomTextFormField(
                                    height: 8.h,
                                    hintText: "Search users",
                                    hintTextStyle: greyTextStyle.copyWith(
                                        fontSize: 14.sp, fontWeight: regular),
                                    filled: true,
                                    isDense: true,
                                    controller: _searchInputController,
                                    focusNode: _focusNode,
                                    onChanged: (String user) {
                                      context
                                          .read<ListAllUsersBloc>()
                                          .add(SearchUsers(user));
                                    },
                                    borderWidth: 1.0,
                                    borderRadius: 10,
                                    borderStyle: BorderStyle.solid,
                                    focusedBorderColor: kBlueColor,
                                    hasSuffixIcon: true,
                                    suffixIconWidget: const Icon(Icons.search,
                                        color: kGreenColor),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  BlocBuilder<ListAllUsersBloc,
                                      ListAllUsersState>(
                                    builder: (context, state) {
                                      if (state is ListAllUsersEmpty) {
                                        return WidgetElseState(
                                            widget: Text(state.message));
                                      }
                                      if (state is ListAllUsersFailure) {
                                        return WidgetElseState(
                                            widget:
                                                Text(state.failure.message));
                                      }
                                      if (state is ListAllUsersLoaded) {
                                        final result = state.users;
                                        final bool isSorted =
                                            state.isSortedAscending;
                                        return Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    "Sort by name",
                                                    style: TextStyle(
                                                        fontSize: 14.sp),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      context
                                                          .read<
                                                              ListAllUsersBloc>()
                                                          .add(SortUsers(
                                                              !isSorted));
                                                    },
                                                    child: Row(
                                                      children: [
                                                        Icon(isSorted
                                                            ? Icons.arrow_upward
                                                            : Icons
                                                                .arrow_downward),
                                                        const Icon(Icons
                                                            .sort_by_alpha),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 2.h,
                                              ),
                                              Expanded(
                                                child: ListView.builder(
                                                  key: const Key('search_item'),
                                                  padding: EdgeInsets.zero,
                                                  itemBuilder:
                                                      (context, index) {
                                                    Color cardColor = index %
                                                                2 ==
                                                            0
                                                        ? kBgGreenColorContainerLight
                                                        : kBgGreenColorContainer;
                                                    UserEntity dataPengguna =
                                                        result[index];
                                                    return CardUsers(
                                                      user: dataPengguna,
                                                      cardColor: cardColor,
                                                    );
                                                  },
                                                  itemCount: result.length,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              )
                                            ],
                                          ),
                                        );
                                      }
                                      return const WidgetElseState(
                                          widget: LoadingWidget());
                                    },
                                  ),
                                ])))))
          ]))
        ]));
  }
}
