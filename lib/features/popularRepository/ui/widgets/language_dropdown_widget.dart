import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/features/popularRepository/ui/bloc/popular_bloc.dart';

Widget dropDownLangues(BuildContext context, List<String> listOfLanguages) {
  return DropdownButton<String>(
    items: listOfLanguages.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList(),
    onChanged: (String? newValue) {
      BlocProvider.of<PopularBloc>(context)
          .add(GetPopularRepositoryByLanguageEvent(language: newValue!));
    },
  );
}
