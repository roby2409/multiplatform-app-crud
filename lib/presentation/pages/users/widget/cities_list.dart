import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:multiplatform_app_crud/presentation/bloc/cities/cities_bloc.dart';

class CitiesList extends StatelessWidget {
  final List<String> selectedCities;
  final void Function(List<String>) onSelectCities;
  const CitiesList(
      {Key? key, required this.selectedCities, required this.onSelectCities})
      : super(key: key);

  void _showModal(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ContentCitiesList(
            selectedCities: selectedCities,
            onSelectCities: onSelectCities,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _showModal(context),
      icon: const Icon(Icons.location_city),
      label: const Text('Select Cities'),
      style: ButtonStyle(
        side: MaterialStateProperty.all<BorderSide>(
            const BorderSide(color: kGreenColor)),
        foregroundColor:
            MaterialStateProperty.all<Color>(kGreenColorSecondButton),
      ),
    );
  }
}

class ContentCitiesList extends StatefulWidget {
  final List<String> selectedCities;
  final void Function(List<String>) onSelectCities;
  const ContentCitiesList(
      {Key? key, required this.selectedCities, required this.onSelectCities})
      : super(key: key);

  @override
  State<ContentCitiesList> createState() => _ContentCitiesListState();
}

class _ContentCitiesListState extends State<ContentCitiesList> {
  late List<String> _selectedCities;
  @override
  void initState() {
    _selectedCities = List.from(widget.selectedCities);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Filter by city'),
      content: SizedBox(
          width: double.minPositive,
          child: BlocBuilder<CitiesBloc, CitiesState>(
            builder: (context, state) {
              return (state is CitiesHasData)
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.cities.length,
                      itemBuilder: (BuildContext context, int index) {
                        final city = state.cities[index];
                        return CheckboxListTile(
                          title: Text(city.name),
                          value: _selectedCities.contains(city.name),
                          onChanged: (bool? value) {
                            setState(() {
                              if (value != null && value) {
                                _selectedCities.add(city.name);
                              } else {
                                _selectedCities.remove(city.name);
                              }
                            });
                          },
                        );
                      },
                    )
                  : const Text("No Data");
            },
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Close'),
        ),
        TextButton(
          onPressed: () {
            widget.onSelectCities(_selectedCities);
            Navigator.pop(context);
          },
          child: const Text('Apply'),
        ),
      ],
    );
  }
}
